#!/usr/bin/env python3
"""GlyphStratum CLI - AI-native visual programming language interface."""
import click
import json
import sys
from typing import Optional

from .core import Stratum, Opcode, SessionManager, ProgramRenderer
from .utils.repl_skin import ReplSkin


# Global session manager
session_manager = SessionManager()


def output_json(data: dict) -> None:
    """Output JSON to stdout."""
    click.echo(json.dumps(data, indent=2))


def output_result(data: dict, use_json: bool) -> None:
    """Output result in requested format."""
    if use_json:
        output_json(data)
    else:
        # Human-readable output
        for key, value in data.items():
            click.echo(f"{key}: {value}")


@click.group(invoke_without_command=True)
@click.option("--json", "output_json_flag", is_flag=True, help="Output in JSON format")
@click.option("--file", "-f", "program_file", type=click.Path(), help="Load program file")
@click.pass_context
def cli(ctx, output_json_flag, program_file):
    """GlyphStratum - AI-native visual programming language CLI."""
    ctx.ensure_object(dict)
    ctx.obj["json"] = output_json_flag

    # Load file if specified
    if program_file:
        try:
            session_manager.load(program_file)
            click.echo(f"Loaded: {program_file}")
        except FileNotFoundError:
            click.echo(f"Error: File not found: {program_file}", err=True)
            sys.exit(1)

    # If no subcommand, enter REPL
    if ctx.invoked_subcommand is None:
        ctx.invoke(repl)


@cli.command()
@click.pass_context
def repl(ctx):
    """Enter interactive REPL mode."""
    skin = ReplSkin("glyph_stratum", version="0.1.0")
    skin.print_banner()

    click.echo("GlyphStratum REPL - AI-native visual programming")
    click.echo("Type 'help' for commands, 'exit' to quit\n")

    while True:
        try:
            # Show status in prompt
            status = session_manager.status()
            modified_marker = "*" if status["modified"] else ""
            file_name = status["current_file"] or "new"
            prompt = f" glyphs:{status['glyph_count']} {file_name}{modified_marker}> "

            line = input(prompt).strip()
        except (EOFError, KeyboardInterrupt):
            click.echo("\nGoodbye!")
            break

        if not line:
            continue

        parts = line.split()
        cmd = parts[0].lower()
        args = parts[1:]

        if cmd in ("exit", "quit", "q"):
            if status["modified"]:
                click.echo("Unsaved changes. Use 'save <file>' or 'exit!' to force.")
            else:
                click.echo("Goodbye!")
                break
        elif cmd == "exit!":
            click.echo("Goodbye!")
            break
        elif cmd == "help":
            show_repl_help()
        elif cmd == "status":
            show_status(ctx.obj["json"])
        elif cmd == "new":
            session_manager.new_session()
            click.echo("New session created")
        elif cmd == "load" and args:
            try:
                session_manager.load(args[0])
                click.echo(f"Loaded: {args[0]}")
            except FileNotFoundError:
                click.echo(f"Error: File not found: {args[0]}")
        elif cmd == "save" and args:
            path = session_manager.save(args[0])
            click.echo(f"Saved: {path}")
        elif cmd == "add":
            handle_add(args, ctx.obj["json"])
        elif cmd == "get" and args:
            handle_get(int(args[0]), ctx.obj["json"])
        elif cmd == "query":
            handle_query(args, ctx.obj["json"])
        elif cmd == "render":
            handle_render(args)
        elif cmd == "validate":
            handle_validate(ctx.obj["json"])
        elif cmd == "undo":
            if session_manager.undo():
                click.echo("Undone")
            else:
                click.echo("Nothing to undo")
        elif cmd == "redo":
            if session_manager.redo():
                click.echo("Redone")
            else:
                click.echo("Nothing to redo")
        else:
            click.echo(f"Unknown command: {cmd}. Type 'help' for commands.")


def show_repl_help():
    """Show REPL help."""
    help_text = """
GlyphStratum REPL Commands:

  Session:
    new                    Create new session
    load <file>            Load program from file
    save <file>            Save program to file
    status                 Show session status
    undo                   Undo last action
    redo                   Redo last undone action

  Glyphs:
    add <stratum> <opcode> [rationale]
                           Add a glyph (e.g., 'add memory alloc')
    get <index>            Get glyph details
    query <type> [value]   Query glyphs:
      query stratum <name>   - by stratum
      query opcode <name>    - by opcode
      query deps <index>     - what depends on glyph
      query used <index>     - what glyph uses

  Visualization:
    render [format]        Render program:
      render ascii          - ASCII grid
      render strata         - by stratum layers
      render deps           - dependency graph
      render json           - full JSON dump

  Other:
    validate               Check program validity
    help                   Show this help
    exit / quit            Exit REPL (prompts if unsaved)
    exit!                  Force exit without saving
"""
    click.echo(help_text)


def show_status(use_json: bool):
    """Show session status."""
    status = session_manager.status()
    if use_json:
        output_json(status)
    else:
        click.echo(f"Session: {status['session_id']}")
        click.echo(f"File: {status['current_file'] or 'none'}")
        click.echo(f"Modified: {status['modified']}")
        click.echo(f"Glyphs: {status['glyph_count']}")
        click.echo(f"Strata: {status['strata']}")
        click.echo(f"Undo: {'available' if status['undo_available'] else 'none'}")
        click.echo(f"Redo: {'available' if status['redo_available'] else 'none'}")


def handle_add(args, use_json: bool):
    """Handle add command."""
    if len(args) < 2:
        click.echo("Usage: add <stratum> <opcode> [rationale]")
        click.echo("Strata: substrate, memory, logic, spec, intent")
        click.echo("Opcodes: alloc, free, load, store, loop, branch, call, return, data, type, ptr, struct, module, export, import, halt")
        return

    stratum_name = args[0].upper()
    opcode_name = args[1].upper()
    rationale = " ".join(args[2:]) if len(args) > 2 else ""

    try:
        stratum = Stratum[stratum_name]
    except KeyError:
        click.echo(f"Invalid stratum: {stratum_name}")
        return

    try:
        opcode = Opcode[opcode_name]
    except KeyError:
        click.echo(f"Invalid opcode: {opcode_name}")
        return

    glyph = session_manager.add_glyph(
        stratum=stratum,
        opcode=opcode,
        rationale=rationale,
    )

    if use_json:
        output_json(glyph.to_dict())
    else:
        click.echo(f"Created glyph [{glyph.index}] {stratum.name}.{opcode.name}")


def handle_get(index: int, use_json: bool):
    """Handle get command."""
    glyph = session_manager.get_glyph(index)
    if not glyph:
        click.echo(f"Glyph not found: {index}")
        return

    if use_json:
        output_json(glyph.to_dict())
    else:
        click.echo(f"Glyph [{index}]")
        click.echo(f"  Stratum: {glyph.stratum.name} ({glyph.stratum.value})")
        click.echo(f"  Opcode: {glyph.opcode.name} ({glyph.opcode.value})")
        click.echo(f"  Position: ({glyph.x}, {glyph.y})")
        click.echo(f"  Dependencies: {glyph.metadata.dependencies}")
        click.echo(f"  Rationale: {glyph.metadata.rationale}")
        click.echo(f"  Created: {glyph.metadata.provenance.timestamp}")


def handle_query(args, use_json: bool):
    """Handle query command."""
    if not args:
        click.echo("Usage: query <type> [value]")
        click.echo("  query stratum <name>")
        click.echo("  query opcode <name>")
        click.echo("  query deps <index>")
        click.echo("  query used <index>")
        return

    query_type = args[0].lower()

    if query_type == "stratum" and len(args) > 1:
        try:
            stratum = Stratum[args[1].upper()]
            results = session_manager.query_by_stratum(stratum)
            if use_json:
                output_json({str(r[0]): r[1].to_dict() for r in results})
            else:
                for idx, glyph in results:
                    click.echo(f"  [{idx}] {glyph.opcode.name}")
        except KeyError:
            click.echo(f"Invalid stratum: {args[1]}")

    elif query_type == "opcode" and len(args) > 1:
        try:
            opcode = Opcode[args[1].upper()]
            results = session_manager.query_by_opcode(opcode)
            if use_json:
                output_json({str(r[0]): r[1].to_dict() for r in results})
            else:
                for idx, glyph in results:
                    click.echo(f"  [{idx}] stratum={glyph.stratum.name}")
        except KeyError:
            click.echo(f"Invalid opcode: {args[1]}")

    elif query_type == "deps" and len(args) > 1:
        index = int(args[1])
        dependents = session_manager.query_dependents(index)
        if use_json:
            output_json({"glyph": index, "dependents": dependents})
        else:
            click.echo(f"Glyphs that depend on [{index}]: {dependents}")

    elif query_type == "used" and len(args) > 1:
        index = int(args[1])
        dependencies = session_manager.query_dependencies(index)
        if use_json:
            output_json({"glyph": index, "uses": dependencies})
        else:
            click.echo(f"Glyph [{index}] uses: {dependencies}")

    else:
        click.echo(f"Unknown query type: {query_type}")


def handle_render(args):
    """Handle render command."""
    format_type = args[0].lower() if args else "ascii"

    renderer = ProgramRenderer(session_manager.state.registry)

    if format_type == "ascii":
        click.echo(renderer.render_colored())
    elif format_type == "strata":
        click.echo(renderer.render_strata_view())
    elif format_type == "deps":
        click.echo(renderer.render_dependency_graph())
    elif format_type == "json":
        click.echo(renderer.render_json())
    elif format_type == "summary":
        click.echo(renderer.render_summary())
    else:
        click.echo(f"Unknown format: {format_type}")
        click.echo("Formats: ascii, strata, deps, json, summary")


def handle_validate(use_json: bool):
    """Handle validate command."""
    errors = session_manager.validate()
    if use_json:
        output_json({"valid": len(errors) == 0, "errors": errors})
    else:
        if errors:
            click.echo("Validation errors:")
            for error in errors:
                click.echo(f"  - {error}")
        else:
            click.echo("Program is valid")


# Subcommands for one-shot CLI usage
@cli.command()
@click.argument("stratum")
@click.argument("opcode")
@click.option("--rationale", "-r", default="", help="Rationale for the glyph")
@click.option("--deps", "-d", multiple=True, type=int, help="Dependencies (glyph indices)")
@click.pass_context
def add(ctx, stratum, opcode, rationale, deps):
    """Add a glyph to the program."""
    try:
        s = Stratum[stratum.upper()]
        o = Opcode[opcode.upper()]
    except KeyError as e:
        click.echo(f"Invalid value: {e}", err=True)
        sys.exit(1)

    glyph = session_manager.add_glyph(
        stratum=s,
        opcode=o,
        rationale=rationale,
        dependencies=list(deps) if deps else None,
    )

    output_result(glyph.to_dict(), ctx.obj["json"])


@cli.command("query")
@click.argument("query_type", type=click.Choice(["stratum", "opcode", "deps", "used"]))
@click.argument("value")
@click.pass_context
def query_cmd(ctx, query_type, value):
    """Query glyphs in the program."""
    if query_type == "stratum":
        try:
            s = Stratum[value.upper()]
            results = session_manager.query_by_stratum(s)
            data = {str(r[0]): r[1].to_dict() for r in results}
        except KeyError:
            click.echo(f"Invalid stratum: {value}", err=True)
            sys.exit(1)

    elif query_type == "opcode":
        try:
            o = Opcode[value.upper()]
            results = session_manager.query_by_opcode(o)
            data = {str(r[0]): r[1].to_dict() for r in results}
        except KeyError:
            click.echo(f"Invalid opcode: {value}", err=True)
            sys.exit(1)

    elif query_type == "deps":
        index = int(value)
        data = {"glyph": index, "dependents": session_manager.query_dependents(index)}

    elif query_type == "used":
        index = int(value)
        data = {"glyph": index, "uses": session_manager.query_dependencies(index)}

    output_json(data) if ctx.obj["json"] else click.echo(data)


@cli.command()
@click.argument("format", type=click.Choice(["ascii", "strata", "deps", "json", "summary"]), default="ascii")
@click.pass_context
def render(ctx, format):
    """Render the program visually."""
    renderer = ProgramRenderer(session_manager.state.registry)

    if format == "ascii":
        click.echo(renderer.render_colored())
    elif format == "strata":
        click.echo(renderer.render_strata_view())
    elif format == "deps":
        click.echo(renderer.render_dependency_graph())
    elif format == "json":
        click.echo(renderer.render_json())
    elif format == "summary":
        click.echo(renderer.render_summary())


@cli.command()
@click.argument("file", type=click.Path())
@click.pass_context
def load(ctx, file):
    """Load a program from file."""
    try:
        session_manager.load(file)
        status = session_manager.status()
        output_result({"loaded": file, "glyphs": status["glyph_count"]}, ctx.obj["json"])
    except FileNotFoundError:
        click.echo(f"File not found: {file}", err=True)
        sys.exit(1)


@cli.command()
@click.argument("file", type=click.Path())
@click.pass_context
def save(ctx, file):
    """Save program to file."""
    path = session_manager.save(file)
    output_result({"saved": path}, ctx.obj["json"])


@cli.command()
@click.pass_context
def validate(ctx):
    """Validate the program."""
    errors = session_manager.validate()
    output_result({"valid": len(errors) == 0, "errors": errors}, ctx.obj["json"])


if __name__ == "__main__":
    cli()
