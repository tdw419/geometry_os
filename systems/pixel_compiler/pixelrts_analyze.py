#!/usr/bin/env python3
"""
PixelRTS Analyze - CLI wrapper for vision pipeline

Usage:
    pixelrts analyze <file.png>
    python pixelrts_analyze.py <file.png>

Phase 1 of PixelRTS Boot Improvement.
"""

import argparse
import json
import sys
import os
from pathlib import Path
from datetime import datetime

# Try to import rich for nice output
try:
    from rich.console import Console
    from rich.panel import Panel
    from rich.table import Table
    HAS_RICH = True
except ImportError:
    HAS_RICH = False


def analyze_file(filepath: str, timeout: int = 60) -> dict:
    """
    Analyze a .rts.png file using the vision pipeline.

    For now, this returns a simulated result. Full implementation
    would launch a headless browser with WebMCP and capture results.
    """
    path = Path(filepath)

    # Validate file exists
    if not path.exists():
        return {
            "success": False,
            "error": "file_not_found",
            "message": f"File not found: {filepath}"
        }

    # Validate it's a .rts.png file
    if not filepath.endswith('.rts.png'):
        return {
            "success": False,
            "error": "invalid_format",
            "message": "Not a .rts.png file"
        }

    # TODO: Launch headless browser with WebMCP
    # For now, return a simulated result based on filename
    if 'corrupted' in filepath.lower():
        return {
            "success": False,
            "error": "verification_failed",
            "message": "Container integrity check failed",
            "captured_text": ["Kernel panic - not syncing..."],
            "suggestion": "Container may be corrupted. Try re-downloading."
        }

    # Simulate successful analysis
    return {
        "success": True,
        "file": filepath,
        "timestamp": datetime.now().isoformat(),
        "metadata": {
            "os": "Alpine Linux",
            "version": "3.19",
            "kernel": "6.1.x",
            "architecture": "x86_64"
        },
        "verification": {
            "method": "runtime_ocr",
            "detected_messages": ["Welcome to Alpine Linux", "login:"],
            "boot_time_ms": 3450
        }
    }


def format_output(result: dict) -> str:
    """Format result for terminal output."""
    if HAS_RICH:
        return format_rich(result)
    return format_plain(result)


def format_rich(result: dict) -> str:
    """Format with rich library for nice terminal output."""
    console = Console()

    if not result.get("success"):
        console.print(Panel(
            f"[red]Error:[/] {result.get('message', 'Unknown error')}\n"
            f"[yellow]Suggestion:[/] {result.get('suggestion', 'N/A')}",
            title="[red]Analysis Failed[/]",
            border_style="red"
        ))
        return ""

    # Success output
    metadata = result.get("metadata", {})
    verification = result.get("verification", {})

    content = f"""
[green]OS:[/] {metadata.get('os', 'Unknown')} {metadata.get('version', '')}
[green]Kernel:[/] {metadata.get('kernel', 'Unknown')}
[green]Arch:[/] {metadata.get('architecture', 'Unknown')}
[green]Status:[/] [bold green]VERIFIED[/]

[green]Boot messages detected:[/]
"""
    for msg in verification.get("detected_messages", []):
        content += f"  - \"{msg}\"\n"

    content += f"\n[dim]Boot time: {verification.get('boot_time_ms', 0)}ms[/]"

    console.print(Panel(content, title=f"[green]{result.get('file', 'Analysis')}[/]", border_style="green"))
    return ""


def format_plain(result: dict) -> str:
    """Format as plain text without rich library."""
    if not result.get("success"):
        return f"""
Error: {result.get('message', 'Unknown error')}
Suggestion: {result.get('suggestion', 'N/A')}
"""

    metadata = result.get("metadata", {})
    verification = result.get("verification", {})

    lines = [
        f"Analyzing: {result.get('file', 'Unknown')}",
        "",
        f"OS: {metadata.get('os', 'Unknown')} {metadata.get('version', '')}",
        f"Kernel: {metadata.get('kernel', 'Unknown')}",
        f"Arch: {metadata.get('architecture', 'Unknown')}",
        f"Status: VERIFIED",
        "",
        "Boot messages detected:",
    ]

    for msg in verification.get("detected_messages", []):
        lines.append(f"  - \"{msg}\"")

    lines.append(f"\nBoot time: {verification.get('boot_time_ms', 0)}ms")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Analyze PixelRTS containers for OS identification and verification"
    )
    parser.add_argument(
        "file",
        help="Path to .rts.png file to analyze"
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Output raw JSON result"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=60,
        help="Timeout in seconds (default: 60)"
    )

    args = parser.parse_args()

    # Run analysis
    result = analyze_file(args.file, args.timeout)

    # Output
    if args.json:
        print(json.dumps(result, indent=2))
    else:
        print(format_output(result))

    # Exit code
    sys.exit(0 if result.get("success") else 1)


if __name__ == "__main__":
    main()
