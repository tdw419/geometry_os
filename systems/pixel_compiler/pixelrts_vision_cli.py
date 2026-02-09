#!/usr/bin/env python3
"""
PixelRTS Vision CLI

Command-line tool for vision model analysis of PixelRTS artifacts.
"""

import sys
import argparse
import json
from pathlib import Path

from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer
from vision_model_client import ModelProvider, VisionModelClient


def parse_args(argv=None):
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Analyze PixelRTS artifacts with vision models"
    )
    parser.add_argument(
        "rts_file",
        type=Path,
        help="Path to .rts.png file"
    )
    parser.add_argument(
        "--provider",
        choices=["lm_studio", "openai", "anthropic"],
        default="lm_studio",
        help="Vision model provider (default: lm_studio)"
    )
    parser.add_argument(
        "--api-key",
        help="API key for provider"
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("./pixelrts_vision_output"),
        help="Output directory for results"
    )
    parser.add_argument(
        "--overlays-only",
        action="store_true",
        help="Only generate visualization overlays (skip vision analysis)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print what would be done without executing"
    )

    return parser.parse_args(argv)


def main():
    """Main CLI entry point."""
    args = parse_args()

    if not args.rts_file.exists():
        print(f"Error: File not found: {args.rts_file}", file=sys.stderr)
        return 1

    # Initialize analyzer
    print(f"[*] Loading PixelRTS artifact: {args.rts_file}")
    analyzer = PixelRTSVisionAnalyzer(str(args.rts_file))

    # Print summary
    summary = analyzer.get_visual_summary()
    print(f"    Dimensions: {summary['width']}x{summary['height']}")
    print(f"    Pixels: {summary['total_pixels']:,}")
    print(f"    Channels: {summary['channels']}")
    print(f"    Format: {analyzer.metadata.get('format', 'Unknown')}")

    provider = ModelProvider(args.provider)

    if args.dry_run:
        print(f"\n[*] Dry run - would perform:")
        print(f"    1. Vision analysis with {provider.value}")
        print(f"    2. Generate entropy overlay")
        print(f"    3. Parse findings and create annotated overlay")
        return 0

    # Create output directory
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    output_dir_str = str(output_dir)

    # Generate entropy overlay
    print(f"\n[*] Generating entropy overlay...")
    try:
        entropy_overlay = analyzer.generate_entropy_overlay(output_dir_str)
        print(f"    Saved: {entropy_overlay}")
    except Exception as e:
        print(f"    Warning: Could not generate entropy overlay: {e}")
        entropy_overlay = None

    if args.overlays_only:
        return 0

    # Perform vision analysis
    print(f"\n[*] Running vision model analysis...")
    print(f"    Provider: {provider.value}")

    try:
        vision_response = analyzer.analyze_with_vision_model(
            provider=provider,
            api_key=args.api_key
        )

        print(f"\n[+] Vision Analysis Results:")
        print("=" * 60)
        print(vision_response)
        print("=" * 60)

        # Save raw response
        response_path = output_dir / f"{args.rts_file.stem}_vision_analysis.txt"
        with open(response_path, 'w') as f:
            f.write(vision_response)
        print(f"\n[*] Saved analysis to: {response_path}")

        # Parse findings
        findings = analyzer.parse_vision_findings(vision_response)

        # Save parsed findings
        findings_path = output_dir / f"{args.rts_file.stem}_findings.json"
        with open(findings_path, 'w') as f:
            json.dump(findings, f, indent=2)
        print(f"[*] Saved findings to: {findings_path}")

        # Generate findings overlay
        print(f"\n[*] Generating findings overlay...")
        findings_overlay = analyzer.generate_findings_overlay(findings, output_dir_str)
        print(f"    Saved: {findings_overlay}")

    except Exception as e:
        print(f"\n[!] Vision analysis failed: {e}", file=sys.stderr)
        print(f"[*] Overlays generated successfully")
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
