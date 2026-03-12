#!/usr/bin/env python3
"""
GlyphStratum CLI - Command-line interface for glyph operations

Usage:
    glyph_cli.py new <name>                    Create new empty program
    glyph_cli.py generate <name> <description> Generate program from description
    glyph_cli.py validate <file.json>          Validate a program file
    glyph_cli.py profile <file.json>           Profile program performance
    glyph_cli.py export <file.json> <format>   Export to different formats
    glyph_cli.py visualize <file.json>         Open in graph viewer
    glyph_cli.py samples                       List sample programs
    glyph_cli.py info <file.json>              Show program info
"""
import sys
import os
import json
import argparse
from typing import Dict, List, Any, Optional

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "agent-harness", "cli_anything"))

from glyph_stratum.core.stratum import Stratum, Opcode
from glyph_stratum.core.glyph_registry import GlyphRegistry


# Stratum order for validation
STRATUM_ORDER = {s: i for i, s in enumerate(["SUBSTRATE", "MEMORY", "LOGIC", "SPEC", "INTENT"])}


def create_empty_program(name: str) -> Dict:
    """Create an empty program structure."""
    return {
        "name": name,
        "glyphs": {}
    }


def validate_program(data: Dict) -> List[str]:
    """Validate a glyph program. Returns list of errors."""
    errors = []
    glyphs = data.get("glyphs", {})

    # Convert string keys to int for validation
    glyph_map = {}
    for idx_str, g in glyphs.items():
        try:
            idx = int(idx_str)
            glyph_map[idx] = g
        except ValueError:
            errors.append(f"Invalid glyph ID: {idx_str}")
            continue

    # Check each glyph
    for idx, glyph in glyph_map.items():
        # Check stratum
        stratum = glyph.get("stratum", "")
        if stratum not in STRATUM_ORDER:
            errors.append(f"Glyph #{idx}: Invalid stratum '{stratum}'")

        # Check opcode
        opcode = glyph.get("opcode", "")
        valid_opcodes = ["DATA", "LOAD", "STORE", "ALLOC", "FREE", "CALL",
                         "BRANCH", "LOOP", "RETURN", "EXPORT", "MODULE", "NOP", "HALT"]
        if opcode not in valid_opcodes:
            errors.append(f"Glyph #{idx}: Invalid opcode '{opcode}'")

        # Check dependencies
        deps = glyph.get("dependencies", [])
        for dep in deps:
            dep_int = int(dep) if isinstance(dep, str) else dep
            if dep_int not in glyph_map:
                errors.append(f"Glyph #{idx}: Dependency #{dep} does not exist")
            elif stratum in STRATUM_ORDER and glyph_map[dep_int].get("stratum") in STRATUM_ORDER:
                dep_stratum = glyph_map[dep_int].get("stratum")
                if STRATUM_ORDER[dep_stratum] > STRATUM_ORDER[stratum]:
                    errors.append(
                        f"Glyph #{idx} ({stratum}) depends on higher stratum "
                        f"#{dep_int} ({dep_stratum})"
                    )

    # Check for INTENT glyph
    has_intent = any(g.get("stratum") == "INTENT" for g in glyph_map.values())
    if not has_intent and len(glyph_map) > 0:
        errors.append("No INTENT glyph found - program needs a MODULE entry point")

    return errors


def calculate_coherence(data: Dict) -> float:
    """Calculate strata ordering coherence (0-100%)."""
    glyphs = data.get("glyphs", {})
    valid = 0
    total = 0

    for idx_str, glyph in glyphs.items():
        stratum = glyph.get("stratum", "")
        if stratum not in STRATUM_ORDER:
            continue

        for dep in glyph.get("dependencies", []):
            dep_str = str(dep)
            if dep_str in glyphs:
                dep_stratum = glyphs[dep_str].get("stratum", "")
                if dep_stratum in STRATUM_ORDER:
                    total += 1
                    if STRATUM_ORDER[dep_stratum] <= STRATUM_ORDER[stratum]:
                        valid += 1

    return (valid / total * 100) if total > 0 else 100.0


def get_program_stats(data: Dict) -> Dict:
    """Get statistics about a program."""
    glyphs = data.get("glyphs", {})

    stats = {
        "name": data.get("name", "unnamed"),
        "total_glyphs": len(glyphs),
        "strata_counts": {},
        "opcode_counts": {},
        "coherence": calculate_coherence(data),
        "max_id": 0,
        "dependencies": 0
    }

    for idx_str, glyph in glyphs.items():
        stratum = glyph.get("stratum", "UNKNOWN")
        opcode = glyph.get("opcode", "UNKNOWN")

        stats["strata_counts"][stratum] = stats["strata_counts"].get(stratum, 0) + 1
        stats["opcode_counts"][opcode] = stats["opcode_counts"].get(opcode, 0) + 1
        stats["max_id"] = max(stats["max_id"], int(idx_str))
        stats["dependencies"] += len(glyph.get("dependencies", []))

    return stats


def format_stats(stats: Dict) -> str:
    """Format stats for display."""
    lines = [
        f"Program: {stats['name']}",
        "=" * 50,
        f"Total Glyphs: {stats['total_glyphs']}",
        f"Max ID: {stats['max_id']}",
        f"Dependencies: {stats['dependencies']}",
        f"Coherence: {stats['coherence']:.1f}%",
        "",
        "Strata Breakdown:"
    ]

    for stratum in ["SUBSTRATE", "MEMORY", "LOGIC", "SPEC", "INTENT"]:
        count = stats["strata_counts"].get(stratum, 0)
        bar = "█" * count
        lines.append(f"  {stratum:10} {count:3} {bar}")

    lines.append("")
    lines.append("Opcode Breakdown:")
    for opcode, count in sorted(stats["opcode_counts"].items(), key=lambda x: -x[1]):
        lines.append(f"  {opcode:10} {count:3}")

    return "\n".join(lines)


def export_to_dot(data: Dict) -> str:
    """Export to Graphviz DOT format."""
    lines = [
        "digraph glyphs {",
        "    rankdir=BT;",
        "    node [shape=circle, style=filled];",
        ""
    ]

    # Node definitions
    colors = {
        "INTENT": "gold",
        "SPEC": "#58a6ff",
        "LOGIC": "#7ee787",
        "MEMORY": "#a371f7",
        "SUBSTRATE": "#6e7681"
    }

    for idx_str, glyph in data.get("glyphs", {}).items():
        stratum = glyph.get("stratum", "SUBSTRATE")
        opcode = glyph.get("opcode", "DATA")
        color = colors.get(stratum, "#6e7681")
        label = f"{idx_str}\\n{opcode}"
        lines.append(f'    {idx_str} [label="{label}", fillcolor="{color}"];')

    lines.append("")

    # Edges
    for idx_str, glyph in data.get("glyphs", {}).items():
        for dep in glyph.get("dependencies", []):
            lines.append(f"    {dep} -> {idx_str};")

    lines.append("}")
    return "\n".join(lines)


def export_to_mermaid(data: Dict) -> str:
    """Export to Mermaid diagram format."""
    lines = ["graph BT"]

    for idx_str, glyph in data.get("glyphs", {}).items():
        opcode = glyph.get("opcode", "DATA")
        stratum = glyph.get("stratum", "SUBSTRATE")
        lines.append(f"    {idx_str}[\"#{idx_str}<br/>{opcode}<br/><small>{stratum}</small>\"]")

    lines.append("")

    for idx_str, glyph in data.get("glyphs", {}).items():
        for dep in glyph.get("dependencies", []):
            lines.append(f"    {dep} --> {idx_str}")

    return "\n".join(lines)


def cmd_new(args):
    """Create new empty program."""
    program = create_empty_program(args.name)
    output_path = args.output or f"{args.name}.json"

    with open(output_path, 'w') as f:
        json.dump(program, f, indent=2)

    print(f"Created empty program: {args.name}")
    print(f"Saved to: {output_path}")


def cmd_validate(args):
    """Validate a program file."""
    with open(args.file, 'r') as f:
        data = json.load(f)

    errors = validate_program(data)
    coherence = calculate_coherence(data)

    if not errors:
        print(f"✓ {args.file} is valid")
        print(f"  Coherence: {coherence:.1f}%")
        print(f"  Glyphs: {len(data.get('glyphs', {}))}")
        return 0
    else:
        print(f"✗ {args.file} has {len(errors)} error(s):")
        for error in errors:
            print(f"  - {error}")
        return 1


def cmd_profile(args):
    """Profile program performance."""
    with open(args.file, 'r') as f:
        data = json.load(f)

    stats = get_program_stats(data)
    print(format_stats(stats))

    # Run profiler if available
    try:
        from glyph_profiler import GlyphProfiler

        print("\n" + "=" * 50)
        print("Performance Profile (simulated):")

        registry = GlyphRegistry()
        for idx_str, g in data.get("glyphs", {}).items():
            idx = int(idx_str)
            stratum = Stratum.from_value(g["stratum"])
            opcode = Opcode.from_value(g["opcode"])
            # Create minimal glyph for profiling
            from glyph_stratum.core.stratum import GlyphInfo, GlyphMetadata, ProvenanceInfo
            metadata = GlyphMetadata(
                dependencies=g.get("dependencies", []),
                rationale=g.get("rationale", "")
            )
            glyph = GlyphInfo(idx, stratum, opcode, metadata)
            registry.glyphs[idx] = glyph

        profiler = GlyphProfiler(registry, data.get("name", "program"))
        report = profiler.profile_execution(iterations=args.iterations)

        print(f"  Total Time: {report.total_time_ms:.2f}ms")
        print(f"  Avg per Glyph: {report.avg_time_per_glyph_ms:.3f}ms")

        if report.bottlenecks:
            print(f"\n  Bottlenecks: {', '.join(f'#{b}' for b in report.bottlenecks[:5])}")

    except ImportError:
        print("\n(Profiler not available)")


def cmd_export(args):
    """Export to different formats."""
    with open(args.file, 'r') as f:
        data = json.load(f)

    if args.format == "dot":
        output = export_to_dot(data)
    elif args.format == "mermaid":
        output = export_to_mermaid(data)
    elif args.format == "flame":
        # Generate profile data for flame graph
        try:
            from glyph_profiler import GlyphProfiler
            registry = GlyphRegistry()
            for idx_str, g in data.get("glyphs", {}).items():
                idx = int(idx_str)
                stratum = Stratum.from_value(g["stratum"])
                opcode = Opcode.from_value(g["opcode"])
                from glyph_stratum.core.stratum import GlyphInfo, GlyphMetadata
                metadata = GlyphMetadata(
                    dependencies=g.get("dependencies", []),
                    rationale=g.get("rationale", "")
                )
                glyph = GlyphInfo(idx, stratum, opcode, metadata)
                registry.glyphs[idx] = glyph

            profiler = GlyphProfiler(registry, data.get("name", "program"))
            report = profiler.profile_execution(iterations=args.iterations)

            from glyph_profiler import export_flame_graph_json
            output = export_flame_graph_json(report)
        except ImportError:
            print("Profiler not available for flame graph export")
            return 1
    elif args.format == "json":
        output = json.dumps(data, indent=2)
    else:
        print(f"Unknown format: {args.format}")
        return 1

    if args.output:
        with open(args.output, 'w') as f:
            f.write(output)
        print(f"Exported to: {args.output}")
    else:
        print(output)


def cmd_info(args):
    """Show program info."""
    with open(args.file, 'r') as f:
        data = json.load(f)

    stats = get_program_stats(data)
    print(format_stats(stats))

    if args.verbose:
        print("\n" + "=" * 50)
        print("Glyph Details:")
        for idx_str, glyph in sorted(data.get("glyphs", {}).items(), key=lambda x: int(x[0])):
            deps = ", ".join(str(d) for d in glyph.get("dependencies", []))
            print(f"  [{idx_str:2}] {glyph.get('stratum', '?'):10} {glyph.get('opcode', '?'):8}")
            print(f"       {glyph.get('rationale', '')[:50]}")
            if deps:
                print(f"       deps: {deps}")


def cmd_samples(args):
    """List sample programs."""
    samples_file = os.path.join(os.path.dirname(__file__), "sample_programs_loader.json")

    if not os.path.exists(samples_file):
        print("No sample programs file found")
        return

    with open(samples_file, 'r') as f:
        data = json.load(f)

    samples = data.get("samples", {})

    print("Available Sample Programs:")
    print("=" * 50)

    for name, sample in samples.items():
        glyphs = sample.get("glyphs", {})
        count = len(glyphs)
        coherence = calculate_coherence(sample)

        # Determine difficulty
        if count <= 10:
            difficulty = "easy"
        elif count <= 15:
            difficulty = "medium"
        else:
            difficulty = "hard"

        print(f"  {name:20} {count:3} glyphs  {coherence:5.1f}%  [{difficulty}]")


def cmd_visualize(args):
    """Open in graph viewer."""
    import webbrowser
    import tempfile

    viewer_path = os.path.join(os.path.dirname(__file__), "graph_viewer.html")

    if not os.path.exists(viewer_path):
        print("Graph viewer not found")
        return 1

    # Read viewer and inject data
    with open(viewer_path, 'r') as f:
        viewer_html = f.read()

    with open(args.file, 'r') as f:
        data = f.read()

    # Create temp file with embedded data
    with tempfile.NamedTemporaryFile(mode='w', suffix='.html', delete=False) as f:
        # Inject data into viewer
        injected = viewer_html.replace(
            "</body>",
            f"<script>window.autoLoadData = {data};</script></body>"
        )
        f.write(injected)
        temp_path = f.name

    webbrowser.open(f"file://{temp_path}")
    print(f"Opened in browser: {args.file}")


def cmd_generate(args):
    """Generate program from description (using template)."""
    # Simple template-based generation
    name = args.name
    desc = args.description.lower()

    glyphs = {}
    idx = 0

    # Simple heuristic generation
    if "add" in desc or "sum" in desc:
        # Addition program
        glyphs = {
            "0": {"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "operand a", "dependencies": []},
            "1": {"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "operand b", "dependencies": []},
            "2": {"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load a", "dependencies": [0]},
            "3": {"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load b", "dependencies": [1]},
            "4": {"stratum": "LOGIC", "opcode": "CALL", "rationale": "a + b", "dependencies": [2, 3]},
            "5": {"stratum": "SPEC", "opcode": "EXPORT", "rationale": "add interface", "dependencies": [4]},
            "6": {"stratum": "INTENT", "opcode": "MODULE", "rationale": "add two numbers", "dependencies": [5]}
        }
    elif "multiply" in desc:
        glyphs = {
            "0": {"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "operand a", "dependencies": []},
            "1": {"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "operand b", "dependencies": []},
            "2": {"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load a", "dependencies": [0]},
            "3": {"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load b", "dependencies": [1]},
            "4": {"stratum": "LOGIC", "opcode": "CALL", "rationale": "a * b", "dependencies": [2, 3]},
            "5": {"stratum": "SPEC", "opcode": "EXPORT", "rationale": "multiply interface", "dependencies": [4]},
            "6": {"stratum": "INTENT", "opcode": "MODULE", "rationale": "multiply two numbers", "dependencies": [5]}
        }
    else:
        # Generic empty program with INTENT
        glyphs = {
            "0": {"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "input", "dependencies": []},
            "1": {"stratum": "INTENT", "opcode": "MODULE", "rationale": desc, "dependencies": [0]}
        }

    program = {"name": name, "glyphs": glyphs}
    output_path = args.output or f"{name}.json"

    with open(output_path, 'w') as f:
        json.dump(program, f, indent=2)

    print(f"Generated program: {name}")
    print(f"  Glyphs: {len(glyphs)}")
    print(f"  Coherence: {calculate_coherence(program):.1f}%")
    print(f"  Saved to: {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="GlyphStratum CLI - Command-line interface for glyph operations",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  glyph_cli.py new my_program
  glyph_cli.py validate my_program.json
  glyph_cli.py profile my_program.json --iterations 10
  glyph_cli.py export my_program.json dot --output graph.dot
  glyph_cli.py info my_program.json --verbose
  glyph_cli.py samples
        """
    )

    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # new
    p_new = subparsers.add_parser("new", help="Create new empty program")
    p_new.add_argument("name", help="Program name")
    p_new.add_argument("-o", "--output", help="Output file path")
    p_new.set_defaults(func=cmd_new)

    # validate
    p_validate = subparsers.add_parser("validate", help="Validate a program file")
    p_validate.add_argument("file", help="Program JSON file")
    p_validate.set_defaults(func=cmd_validate)

    # profile
    p_profile = subparsers.add_parser("profile", help="Profile program performance")
    p_profile.add_argument("file", help="Program JSON file")
    p_profile.add_argument("-i", "--iterations", type=int, default=10, help="Profile iterations")
    p_profile.set_defaults(func=cmd_profile)

    # export
    p_export = subparsers.add_parser("export", help="Export to different formats")
    p_export.add_argument("file", help="Program JSON file")
    p_export.add_argument("format", choices=["json", "dot", "mermaid", "flame"], help="Export format")
    p_export.add_argument("-o", "--output", help="Output file path")
    p_export.add_argument("-i", "--iterations", type=int, default=10, help="Profile iterations (for flame)")
    p_export.set_defaults(func=cmd_export)

    # info
    p_info = subparsers.add_parser("info", help="Show program info")
    p_info.add_argument("file", help="Program JSON file")
    p_info.add_argument("-v", "--verbose", action="store_true", help="Show glyph details")
    p_info.set_defaults(func=cmd_info)

    # samples
    p_samples = subparsers.add_parser("samples", help="List sample programs")
    p_samples.set_defaults(func=cmd_samples)

    # visualize
    p_viz = subparsers.add_parser("visualize", help="Open in graph viewer")
    p_viz.add_argument("file", help="Program JSON file")
    p_viz.set_defaults(func=cmd_visualize)

    # generate
    p_gen = subparsers.add_parser("generate", help="Generate program from description")
    p_gen.add_argument("name", help="Program name")
    p_gen.add_argument("description", help="Program description (e.g., 'add two numbers')")
    p_gen.add_argument("-o", "--output", help="Output file path")
    p_gen.set_defaults(func=cmd_generate)

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 0

    return args.func(args)


if __name__ == "__main__":
    sys.exit(main() or 0)
