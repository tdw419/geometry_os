#!/usr/bin/env python3
"""GEOS CLI — Agent-Native Glyph Compiler Control Surface.

Usage:
    cli-anything-geos task compile --file program.json
    cli-anything-geos task execute --file program.json
"""

import sys
import os
import json
import click
import subprocess
from typing import Optional

# Namespace structure: cli_anything/geos/geos_cli.py
# Root of package: cli_anything/geos/

_json_output = False


def find_rust_binary():
    """Find the glyph_compiler Rust binary."""
    # Look in the build target directory first
    root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
    binary = os.path.join(root, "target", "debug", "glyph_compiler")
    if os.path.exists(binary):
        return binary
    
    # Fallback to current directory for development
    if os.path.exists("./glyph_compiler"):
        return "./glyph_compiler"
        
    raise RuntimeError(
        "Glyph compiler binary not found. Build it with:\n"
        "  cargo build --package glyph_compiler"
    )


def output(data, message: str = ""):
    if _json_output:
        click.echo(json.dumps(data, indent=2, default=str))
    else:
        if message:
            click.echo(message)
        if isinstance(data, dict):
            for k, v in data.items():
                click.echo(f"  {k}: {v}")
        else:
            click.echo(str(data))


@click.group(invoke_without_command=True)
@click.option("--json", "json_opt", is_flag=True, help="Output in JSON format")
@click.pass_context
def cli(ctx, json_opt):
    global _json_output
    _json_output = json_opt
    if ctx.invoked_subcommand is None:
        # Default to REPL or help
        click.echo(ctx.get_help())


@cli.group()
def task():
    """Glyph compilation and execution tasks."""
    pass


@task.command()
@click.option("--file", "-f", type=click.Path(exists=True), help="Input JSON file")
@click.option("--prompt", "-p", help="Direct JSON prompt")
def compile(file, prompt):
    """Compile a glyph program to SPIR-V."""
    if file:
        with open(file, "r") as f:
            data = f.read()
    elif prompt:
        data = prompt
    else:
        raise click.UsageError("Must provide --file or --prompt")

    binary = find_rust_binary()
    result = subprocess.run(
        [binary, "compile"],
        input=data,
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        output({"error": result.stderr, "status": "failed"}, "Compilation Failed")
        sys.exit(1)

    res_json = json.loads(result.stdout)
    output(res_json, "Compilation Successful")


@task.command()
@click.option("--file", "-f", type=click.Path(exists=True), help="Input JSON file")
def execute(file):
    """Execute a glyph program on GPU."""
    if not file:
        raise click.UsageError("Must provide --file")

    with open(file, "r") as f:
        data = f.read()

    binary = find_rust_binary()
    result = subprocess.run(
        [binary, "execute"],
        input=data,
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        output({"error": result.stderr, "status": "failed"}, "Execution Failed")
        sys.exit(1)

    output({"status": "success"}, "Execution Successful")


def main():
    cli()


if __name__ == "__main__":
    main()
