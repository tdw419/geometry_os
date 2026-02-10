#!/usr/bin/env python3
"""
VLM Health CLI Tool for Geometry OS
------------------------------------
Command-line interface for monitoring and checking Visual Language Model
health indicators in PixelRTS v2 containers.

Commands:
- check: Perform health check on an RTS file
- monitor: Continuously monitor health over iterations
- baseline: Create a health baseline for comparison

Usage:
    python3 vlm_health_cli.py check <rts_file> [--json] [--baseline <file>]
    python3 vlm_health_cli.py monitor <rts_file> [--iterations N]
    python3 vlm_health_cli.py baseline <rts_file> [-o <output>]
"""

import sys
import json
import argparse
import time
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, Optional
import numpy as np
from PIL import Image


def calculate_vitality_score(entropy_mean: float, entropy_std: float) -> float:
    """
    Calculate a vitality score based on entropy statistics.

    The vitality score measures the "health" of the visual data:
    - High entropy with good variance = healthy, diverse structure
    - Low entropy = sparse, possibly uninitialized data
    - Very high entropy with low variance = possibly compressed/encrypted

    Args:
        entropy_mean: Mean entropy value (0-255)
        entropy_std: Standard deviation of entropy

    Returns:
        Vitality score between 0.0 and 1.0
    """
    # Normalize mean to 0-1 range
    normalized_mean = entropy_mean / 255.0

    # Normalize std to 0-1 range (assuming max reasonable std is ~64)
    normalized_std = min(entropy_std / 64.0, 1.0)

    # Calculate vitality based on characteristics
    if normalized_mean < 0.2:
        # Low entropy - sparse data
        vitality = normalized_mean * 2.0  # Scale up for very low values
    elif normalized_mean > 0.85:
        # Very high entropy - possibly compressed
        # Vitality decreases slightly for extreme values
        vitality = 1.0 - (normalized_mean - 0.85) * 2.0
    else:
        # Healthy middle range
        vitality = normalized_mean

    # Incorporate variance - higher variance usually indicates good structure
    variance_factor = 0.7 + (normalized_std * 0.3)

    # Combine factors
    vitality_score = vitality * variance_factor

    return max(0.0, min(1.0, vitality_score))


def analyze_rts_health(rts_path: Path) -> Dict[str, Any]:
    """
    Analyze the health of a PixelRTS v2 container.

    Args:
        rts_path: Path to the .rts.png file

    Returns:
        Dictionary containing health metrics
    """
    if not rts_path.exists():
        raise FileNotFoundError(f"RTS file not found: {rts_path}")

    # Load the image
    img = Image.open(rts_path)
    pixels = np.array(img)

    # Extract metadata if available
    metadata = {}
    if hasattr(img, 'text'):
        raw_meta = img.text.get('PixelRTS')
        if raw_meta:
            try:
                metadata = json.loads(raw_meta)
            except json.JSONDecodeError:
                pass

    # Calculate entropy statistics
    if pixels.ndim == 3:
        # For RGB/RGBA, use luminance
        if pixels.shape[2] == 4:
            # RGBA - use RGB channels
            rgb_pixels = pixels[:, :, :3]
        else:
            rgb_pixels = pixels
        # Convert to grayscale for entropy calculation
        gray = np.dot(rgb_pixels[..., :3], [0.2989, 0.5870, 0.1140])
    else:
        gray = pixels

    # Calculate statistics
    entropy_mean = float(np.mean(gray))
    entropy_std = float(np.std(gray))
    entropy_min = float(np.min(gray))
    entropy_max = float(np.max(gray))

    # Calculate histogram
    hist, _ = np.histogram(gray, bins=16, range=(0, 256))
    entropy_histogram = hist.tolist()

    # Calculate vitality score
    vitality = calculate_vitality_score(entropy_mean, entropy_std)

    # Determine health status
    if vitality > 0.7:
        status = "HEALTHY"
    elif vitality > 0.4:
        status = "DEGRADED"
    else:
        status = "CRITICAL"

    return {
        "file": str(rts_path),
        "dimensions": {
            "width": img.width,
            "height": img.height,
            "channels": pixels.shape[2] if pixels.ndim == 3 else 1
        },
        "entropy": {
            "mean": entropy_mean,
            "std": entropy_std,
            "min": entropy_min,
            "max": entropy_max,
            "histogram": entropy_histogram
        },
        "vitality_score": vitality,
        "status": status,
        "metadata": metadata,
        "timestamp": datetime.utcnow().isoformat() + "Z"
    }


def compare_to_baseline(health_data: Dict[str, Any], baseline: Dict[str, Any]) -> Dict[str, Any]:
    """
    Compare current health data to a baseline.

    Args:
        health_data: Current health analysis
        baseline: Baseline health data to compare against

    Returns:
        Comparison results with deviations
    """
    current_entropy = health_data["entropy"]
    baseline_entropy = baseline["entropy"]

    # Calculate deviations
    mean_deviation = current_entropy["mean"] - baseline_entropy["mean"]
    std_deviation = current_entropy["std"] - baseline_entropy["std"]
    vitality_deviation = health_data["vitality_score"] - baseline["vitality_score"]

    # Determine if deviation is significant (>10% change)
    significant_deviation = abs(vitality_deviation) > 0.1

    return {
        "mean_deviation": mean_deviation,
        "std_deviation": std_deviation,
        "vitality_deviation": vitality_deviation,
        "significant_deviation": significant_deviation,
        "baseline_timestamp": baseline.get("timestamp", "unknown")
    }


def format_health_report(health_data: Dict[str, Any], comparison: Optional[Dict] = None, verbose: bool = False) -> str:
    """Format health data as a human-readable report."""
    lines = []
    lines.append("=" * 60)
    lines.append(f"VLM HEALTH REPORT: {Path(health_data['file']).name}")
    lines.append("=" * 60)

    # Status line
    status_emoji = {"HEALTHY": "✅", "DEGRADED": "⚠️", "CRITICAL": "🔴"}
    emoji = status_emoji.get(health_data["status"], "❓")
    lines.append(f"Status: {emoji} {health_data['status']}")
    lines.append(f"Vitality Score: {health_data['vitality_score']:.3f} / 1.000")

    # Dimensions
    dim = health_data["dimensions"]
    lines.append(f"Dimensions: {dim['width']}x{dim['height']} ({dim['channels']} channels)")

    # Entropy stats
    ent = health_data["entropy"]
    lines.append(f"Entropy: mean={ent['mean']:.1f} std={ent['std']:.1f} range=[{ent['min']:.0f}, {ent['max']:.0f}]")

    # Comparison if available
    if comparison:
        lines.append("")
        lines.append("Baseline Comparison:")
        lines.append(f"  Mean deviation: {comparison['mean_deviation']:+.1f}")
        lines.append(f"  Std deviation: {comparison['std_deviation']:+.1f}")
        lines.append(f"  Vitality deviation: {comparison['vitality_deviation']:+.3f}")
        if comparison['significant_deviation']:
            lines.append("  ⚠️  Significant deviation detected!")

    # Verbose details
    if verbose:
        lines.append("")
        lines.append("Entropy Histogram:")
        hist = ent["histogram"]
        max_val = max(hist) if hist else 1
        for i, val in enumerate(hist):
            bar = "█" * int((val / max_val) * 20)
            if i % 4 == 0:
                label = f"{i*16:3d}-{min(255, (i+1)*16):3d}"
                lines.append(f"  [{label}] |{bar} {val}")

    lines.append("=" * 60)
    lines.append(f"Timestamp: {health_data['timestamp']}")
    lines.append("=" * 60)

    return "\n".join(lines)


def parse_args(args: Optional[list] = None) -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="VLM Health CLI for PixelRTS v2 containers",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s check kernel.rts.png
  %(prog)s check kernel.rts.png --json
  %(prog)s check kernel.rts.png --baseline baseline.json
  %(prog)s monitor kernel.rts.png --iterations 10
  %(prog)s baseline kernel.rts.png -o baseline.json
        """
    )

    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # Check command
    check_parser = subparsers.add_parser("check", help="Perform health check on RTS file")
    check_parser.add_argument("rts_file", help="Path to .rts.png file")
    check_parser.add_argument("--json", action="store_true", help="Output as JSON")
    check_parser.add_argument("--baseline", help="Compare against baseline file")
    check_parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

    # Monitor command
    monitor_parser = subparsers.add_parser("monitor", help="Continuously monitor health")
    monitor_parser.add_argument("rts_file", help="Path to .rts.png file")
    monitor_parser.add_argument("--iterations", "-n", type=int, default=5,
                                help="Number of monitoring iterations (default: 5)")
    monitor_parser.add_argument("--interval", "-i", type=float, default=1.0,
                                help="Seconds between iterations (default: 1.0)")

    # Baseline command
    baseline_parser = subparsers.add_parser("baseline", help="Create health baseline")
    baseline_parser.add_argument("rts_file", help="Path to .rts.png file")
    baseline_parser.add_argument("-o", "--output", default="baseline.json",
                                 help="Output baseline file (default: baseline.json)")

    return parser.parse_args(args)


def cmd_check(args: argparse.Namespace) -> int:
    """Execute the check command."""
    try:
        # Analyze health
        health_data = analyze_rts_health(Path(args.rts_file))

        # Load baseline if specified
        comparison = None
        if args.baseline:
            baseline_path = Path(args.baseline)
            if baseline_path.exists():
                with open(baseline_path, 'r') as f:
                    baseline = json.load(f)
                comparison = compare_to_baseline(health_data, baseline)
            else:
                print(f"Warning: Baseline file not found: {args.baseline}", file=sys.stderr)

        # Output
        if args.json:
            output = health_data
            if comparison:
                output["comparison"] = comparison
            print(json.dumps(output, indent=2))
        else:
            print(format_health_report(health_data, comparison, args.verbose))

        return 0

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def cmd_monitor(args: argparse.Namespace) -> int:
    """Execute the monitor command."""
    try:
        rts_path = Path(args.rts_file)
        print(f"Monitoring {rts_path.name} ({args.iterations} iterations)...")
        print("=" * 60)

        prev_vitality = None

        for i in range(args.iterations):
            health_data = analyze_rts_health(rts_path)
            vitality = health_data["vitality_score"]
            status = health_data["status"]

            # Show trend
            trend = ""
            if prev_vitality is not None:
                delta = vitality - prev_vitality
                if delta > 0.01:
                    trend = f" (+{delta:.3f} ↑)"
                elif delta < -0.01:
                    trend = f" ({delta:.3f} ↓)"
                else:
                    trend = " (stable)"

            print(f"[{i+1}/{args.iterations}] Vitality: {vitality:.3f} | Status: {status}{trend}")

            prev_vitality = vitality

            if i < args.iterations - 1:
                time.sleep(args.interval)

        print("=" * 60)
        print("Monitoring complete.")

        return 0

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def cmd_baseline(args: argparse.Namespace) -> int:
    """Execute the baseline command."""
    try:
        health_data = analyze_rts_health(Path(args.rts_file))

        # Write baseline file
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w') as f:
            json.dump(health_data, f, indent=2)

        print(f"Baseline created: {output_path}")
        print(f"Vitality Score: {health_data['vitality_score']:.3f}")
        print(f"Status: {health_data['status']}")

        return 0

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def main(args: Optional[list] = None) -> int:
    """Main entry point."""
    parsed_args = parse_args(args)

    if not parsed_args.command:
        print("Error: No command specified", file=sys.stderr)
        print("Use --help for usage information", file=sys.stderr)
        return 1

    if parsed_args.command == "check":
        return cmd_check(parsed_args)
    elif parsed_args.command == "monitor":
        return cmd_monitor(parsed_args)
    elif parsed_args.command == "baseline":
        return cmd_baseline(parsed_args)
    else:
        print(f"Error: Unknown command: {parsed_args.command}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
