FROM node:20-slim AS base

RUN apt-get update && apt-get install -y python3 make g++ libpq-dev git

WORKDIR /app

COPY package.json yarn.lock .yarnrc.yml ./

COPY .yarn ./.yarn

RUN yarn install --immutable

COPY . .

RUN yarn build

EXPOSE 9000

CMD ["yarn", "medusa", "start"]
