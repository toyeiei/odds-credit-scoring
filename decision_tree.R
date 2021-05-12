# install package
# install.packages("readr")

# load library
library(readr)
library(dplyr)
library(rpart)
library(rpart.plot)

# read data
churnData <- read_csv("churn.csv")

churnData$churn <- as.factor(churnData$churn)
churnData$internationalplan <- as.factor(churnData$internationalplan)
churnData$voicemailplan <- as.factor(churnData$voicemailplan)

# train
treeModel <- rpart(churn ~ .,
                   data = churnData,
                   method = "class")

# test/ evaluate
rpart.plot(treeModel)

# savemodel
saveRDS(treeModel, "my_first_model.rds")




