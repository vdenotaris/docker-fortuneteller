# Linux Alpine is used as base image
FROM alpine:latest

# Who takes care of this
MAINTAINER Vincenzo De Notaris (dev@vdenotaris.com)

# Update and upgrade Alpine
RUN apk update && apk upgrade

# Install fortune
RUN \
  apk add fortune

# Install cowsay
RUN \
    apk add git perl \
    && cd /tmp/ \
    && git clone https://github.com/schacon/cowsay \
    && cd cowsay && ./install.sh /usr/local \
    && cd .. \
    && rm -rf cowsay \
    && apk del git

# Add the cauldron ascii art
COPY cauldron.cow /usr/local/share/cows/

# Run the command
CMD fortune | cowsay -f cauldron.cow
