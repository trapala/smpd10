#install.packages("ggplot2")
library("ggplot2")

df <- as.data.frame(matrix(c(27.6, 26.2, 19.6, 19.2, 20.6, 22.8, 18.8, 27.9, 20.6, 24.6, 10.0, 21.0, 21.2, 36.1, 16.6,
                             130, 98, 75, 98, 98, 111, 98, 87, 98, 98, 56, 98, 98, 211, 64,
                             17, 18, 28, 21, 24, 24, 20, 16, 24, 16, 20, 20, 18, 12, 19,
                             3399, 2099, 899, 1399, 1799, 1199, 1699, 1999, 2199, 2099, 890, 1899, 1799, 3449, 1198), 15, 4))
labels <- c("1", "2", "3", "4", "5")
result <- c(2, 3, 4, 4, 3, 4, 4, 3, 3, 4, 3, 3, 4, 2, 3)
factors <- factor(result, labels)
df <- cbind(df, factors)
colnames(df) <- c("Matryca", "JasnoscEkranu", "CzasReakcjiMatrycy", "Cena", "Ocena")

histogram <- ggplot(df, aes(CzasReakcjiMatrycy))

histogram <- histogram + geom_histogram(binwidth=2, color="grey", fill="green")
histogram <- histogram + labs(x="CzasReakcjiMatrycy", y="Ilosc") + ggtitle("Najnizszy czas reakcji matrycy monitora LED")
histogram

histogram.facets <- histogram+facet_grid(Ocena~.)+ggtitle("Czas reakcji matrycy monitora LED a ocena")
histogram.facets #vertically