"""
Build integration for genome-generated code.
"""
import subprocess
import sys
from pathlib import Path
import json


def generate_from_genomes(genome_dir: Path, output_dir: Path):
    """Generate Rust code from all genomes in directory"""
    genome_files = list(genome_dir.glob("*.genome.json"))

    if not genome_files:
        print("No genome files found")
        return

    print(f"Found {len(genome_files)} genome(s)")

    for genome_file in genome_files:
        print(f"Generating code from: {genome_file.name}")

        # Use the CLI to generate code
        result = subprocess.run([
            sys.executable, "-m", "genome.cli", "generate",
            str(genome_file), "-o", str(output_dir / f"{genome_file.stem}.rs")
        ])

        if result.returncode != 0:
            print(f"Failed to generate from {genome_file.name}")
            continue

        print(f"Generated: {genome_file.stem}.rs")


def create_mod_rs(output_dir: Path):
    """Create mod.rs with all generated modules"""
    rs_files = list(output_dir.glob("*.rs"))

    mod_content = "// Auto-generated from genomes\n\n"

    for rs_file in rs_files:
        module_name = rs_file.stem
        mod_content += f"pub mod {module_name};\n"

    mod_file = output_dir / "mod.rs"
    mod_file.write_text(mod_content)
    print(f"Created {mod_file}")


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Build genome-generated code")
    parser.add_argument("--genome-dir", default="data/genomes",
                       help="Directory containing genome files")
    parser.add_argument("--output-dir", default="geometry_os/vectorland/src/generated",
                       help="Output directory for generated Rust code")

    args = parser.parse_args()

    genome_dir = Path(args.genome_dir)
    output_dir = Path(args.output_dir)

    output_dir.mkdir(parents=True, exist_ok=True)

    generate_from_genomes(genome_dir, output_dir)
    create_mod_rs(output_dir)


if __name__ == "__main__":
    main()
