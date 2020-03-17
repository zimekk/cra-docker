FROM node:10-slim AS builder
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM node:10-slim
ENV PORT 3000
RUN yarn global add serve
COPY --from=builder /app/build build
CMD serve -s build -l $PORT
