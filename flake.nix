{
  description = "wc dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [

            # mdbook
            mdbook
            mdbook-toc
            mdbook-katex
            mdbook-mermaid
            # Diagram
            mermaid-cli

            # Slides
            marp-cli
          ];
        };
      }
    );
}
