FROM ubuntu:latest

WORKDIR /app

LABEL version="1.0.0"
LABEL maintainer="Victor Monday"

RUN apt-get update -y && \
  apt-get install curl -y && \
  curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh && \
  apt-get install nodejs -y && \
  apt-get install npm -y && \
  npm i -g typescript
  
RUN apt-get update -y && \
  apt-get install -y python3.6 python3-distutils python3-pip python3-apt

COPY package.json .

RUN npm i

COPY . .