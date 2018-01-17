// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "vaporTestServer",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/OpenKitten/MongoKitten.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: ["Vapor", "FluentProvider", "MongoKitten"],
            exclude: ["Config", "Public", "Resources"]
        ),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)

