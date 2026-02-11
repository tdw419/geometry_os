#!/usr/bin/env python3
"""
Phase 1 Benchmark Runner for Infinite Map OS

This script executes all Phase 1 benchmarks and generates a comprehensive
analysis report including:
- Console output with real-time progress
- JSON results file for historical tracking
- Markdown report with detailed analysis

Usage:
    python3 -m systems.pixel_compiler.benchmarks.phase1_benchmark_runner
    python3 -m systems.pixel_compiler.benchmarks.phase1_benchmark_runner --grid-size 1024
    python3 -m systems.pixel_compiler.benchmarks.phase1_benchmark_runner --output custom_results.json
"""

import sys
import time
import json
import argparse
import platform
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, List, Optional

# Import Phase 1 benchmark framework
try:
    from systems.pixel_compiler.benchmarks.phase1_benchmark import (
        Phase1Benchmark,
        BenchmarkResult,
        BenchmarkSuite
    )
except ImportError:
    # Fallback for local development
    sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))
    from systems.pixel_compiler.benchmarks.phase1_benchmark import (
        Phase1Benchmark,
        BenchmarkResult,
        BenchmarkSuite
    )


# Benchmark configuration
CONFIG = {
    "iterations": 100,          # Standard iterations for fast benchmarks
    "e2e_iterations": 10,       # Fewer iterations for expensive end-to-end
    "grid_size": 2048,          # Standard grid size
    "warmup_iterations": 5,     # Warmup runs to stabilize measurements
}

# Report paths
DEFAULT_RESULTS_PATH = "benchmarks/phase1_results.json"
DEFAULT_REPORT_PATH = "docs/plans/2026-02-11-phase1-benchmark-results.md"


def get_system_info() -> Dict[str, Any]:
    """Collect system information for the benchmark report."""
    return {
        "platform": platform.platform(),
        "python_version": platform.python_version(),
        "machine": platform.machine(),
        "processor": platform.processor(),
        "hostname": platform.node(),
        "timestamp": datetime.now().isoformat(),
    }


def format_time_unit(seconds: float) -> tuple:
    """Format time in appropriate units with unit string."""
    if seconds == float('inf') or seconds < 0:
        return "ERROR", ""
    elif seconds == 0:
        return "0", "s"

    units = [
        (1e-9, "ns"),
        (1e-6, "μs"),
        (1e-3, "ms"),
        (1, "s"),
    ]

    for factor, unit in units:
        if seconds < factor * 1000:
            return f"{seconds / factor:.2f}", unit

    return f"{seconds:.2f}", "s"


def generate_markdown_report(
    suite: BenchmarkSuite,
    system_info: Dict[str, Any],
    config: Dict[str, Any]
) -> str:
    """
    Generate comprehensive markdown analysis report.

    Args:
        suite: BenchmarkSuite with results
        system_info: System information dictionary
        config: Benchmark configuration used

    Returns:
        Markdown report as string
    """
    lines = []

    # Header
    lines.append("# Phase 1 Benchmark Results - Infinite Map OS")
    lines.append("")
    lines.append(f"**Generated:** {system_info['timestamp']}")
    lines.append(f"**Platform:** {system_info['platform']}")
    lines.append(f"**Python:** {system_info['python_version']}")
    lines.append("")
    lines.append("---")
    lines.append("")

    # Executive Summary
    lines.append("## Executive Summary")
    lines.append("")
    summary = suite.get_summary()
    lines.append(f"Phase 1 benchmarking completed with **{summary['passed']}/{summary['total']}** benchmarks passing their performance targets.")
    lines.append("")
    lines.append(f"- **Pass Rate:** {summary.get('pass_rate', 0):.1f}%")
    lines.append(f"- **Total Benchmarks:** {summary['total']}")
    lines.append(f"- **Grid Size:** {config['grid_size']}x{config['grid_size']}")
    lines.append(f"- **Iterations:** {config['iterations']} (standard), {config['e2e_iterations']} (e2e)")
    lines.append("")

    # Performance Overview Table
    lines.append("## Performance Overview")
    lines.append("")
    lines.append("| Benchmark | Status | Mean Time | Target | Min | Max | Std Dev | Throughput |")
    lines.append("|-----------|--------|-----------|--------|-----|-----|---------|------------|")

    for result in suite.results:
        skipped = result.metadata.get("skipped", False)
        name = result.name.replace("_", " ").title()

        if skipped:
            status = "⊘ SKIP"
            mean_time = "N/A"
            target = "N/A"
            min_time = "N/A"
            max_time = "N/A"
            std_dev = "N/A"
            throughput = "N/A"
        else:
            status = "✓ PASS" if result.passed else "✗ FAIL"
            mean_val, mean_unit = format_time_unit(result.mean_time)
            mean_time = f"{mean_val}{mean_unit}"

            if result.target_time:
                target_val, target_unit = format_time_unit(result.target_time)
                target = f"{target_val}{target_unit}"
            else:
                target = "N/A"

            min_val, min_unit = format_time_unit(result.min_time)
            min_time = f"{min_val}{min_unit}"

            max_val, max_unit = format_time_unit(result.max_time)
            max_time = f"{max_val}{max_unit}"

            std_val, std_unit = format_time_unit(result.std_dev)
            std_dev = f"{std_val}{std_unit}"

            if result.throughput > 0:
                throughput = f"{result.throughput:,.0f} ops/s"
            else:
                throughput = "N/A"

        lines.append(f"| {name} | {status} | {mean_time} | {target} | {min_time} | {max_time} | {std_dev} | {throughput} |")

    lines.append("")

    # Detailed Results
    lines.append("## Detailed Results")
    lines.append("")

    for result in suite.results:
        lines.append(f"### {result.name.replace('_', ' ').title()}")
        lines.append("")

        skipped = result.metadata.get("skipped", False)

        if skipped:
            lines.append(f"**Status:** ⊘ SKIPPED")
            lines.append("")
            reason = result.metadata.get("reason", "Unknown reason")
            lines.append(f"**Reason:** {reason}")
        else:
            status_icon = "✓" if result.passed else "✗"
            lines.append(f"**Status:** {status_icon} {'PASS' if result.passed else 'FAIL'}")

            # Performance metrics
            lines.append("")
            lines.append("**Performance Metrics:**")

            mean_val, mean_unit = format_time_unit(result.mean_time)
            lines.append(f"- **Mean Time:** {mean_val}{mean_unit}")

            min_val, min_unit = format_time_unit(result.min_time)
            max_val, max_unit = format_time_unit(result.max_time)
            lines.append(f"- **Range:** {min_val}{min_unit} - {max_val}{max_unit}")

            std_val, std_unit = format_time_unit(result.std_dev)
            lines.append(f"- **Std Dev:** {std_val}{std_unit}")

            lines.append(f"- **Iterations:** {result.iterations}")

            if result.throughput > 0:
                lines.append(f"- **Throughput:** {result.throughput:,.0f} ops/s")

            # Target comparison
            if result.target_time:
                target_val, target_unit = format_time_unit(result.target_time)
                lines.append(f"- **Target:** {target_val}{target_unit}")

                # Calculate percentage of target
                pct = (result.mean_time / result.target_time) * 100
                if result.passed:
                    lines.append(f"- **Performance:** {pct:.1f}% of target (within budget)")
                else:
                    lines.append(f"- **Performance:** {pct:.1f}% of target (EXCEEDED by {pct - 100:.1f}%)")

            # Memory
            if result.memory_mb > 0:
                lines.append(f"- **Memory:** {result.memory_mb:.2f} MB")

        # Metadata
        if result.metadata and not skipped:
            lines.append("")
            lines.append("**Metadata:**")
            for key, value in result.metadata.items():
                if key not in ("skipped", "reason"):
                    lines.append(f"- `{key}`: {value}")

        lines.append("")

    # GPU vs CPU Analysis
    lines.append("## Performance Analysis")
    lines.append("")

    # Performance targets met
    passed_benchmarks = [r for r in suite.results if r.passed and not r.metadata.get("skipped", False)]
    failed_benchmarks = [r for r in suite.results if not r.passed and not r.metadata.get("skipped", False)]

    lines.append("### Targets Met")
    lines.append("")
    if passed_benchmarks:
        for result in passed_benchmarks:
            pct = (result.mean_time / result.target_time) * 100 if result.target_time else 0
            name = result.name.replace("_", " ").title()
            mean_val, mean_unit = format_time_unit(result.mean_time)
            lines.append(f"- ✓ **{name}:** {mean_val}{mean_unit} ({pct:.1f}% of target)")
    else:
        lines.append("No benchmarks met their targets.")
    lines.append("")

    lines.append("### Targets Missed")
    lines.append("")
    if failed_benchmarks:
        for result in failed_benchmarks:
            if result.target_time:
                pct = (result.mean_time / result.target_time) * 100
                name = result.name.replace("_", " ").title()
                mean_val, mean_unit = format_time_unit(result.mean_time)
                target_val, target_unit = format_time_unit(result.target_time)
                lines.append(f"- ✗ **{name}:** {mean_val}{mean_unit} (target: {target_val}{target_unit}, {pct:.1f}% - exceeded by {pct - 100:.1f}%)")
            else:
                name = result.name.replace("_", " ").title()
                mean_val, mean_unit = format_time_unit(result.mean_time)
                lines.append(f"- ✗ **{name}:** {mean_val}{mean_unit} (no target set)")
    else:
        lines.append("All benchmarks met their targets!")
    lines.append("")

    # Conclusions
    lines.append("## Conclusions")
    lines.append("")
    lines.append("### Achievements")
    lines.append("")

    achievements = []

    # Check for specific achievements
    hilbert_result = next((r for r in suite.results if r.name == "hilbert_lut"), None)
    if hilbert_result and hilbert_result.passed:
        achievements.append("✓ Hilbert curve LUT generation meets performance targets for real-time spatial computing")

    zero_copy_result = next((r for r in suite.results if r.name == "zero_copy_mapping"), None)
    if zero_copy_result and zero_copy_result.passed:
        achievements.append("✓ Zero-copy memory mapping enables efficient GPU access to hot zones")

    cache_result = next((r for r in suite.results if r.name == "texture_cache_hit"), None)
    if cache_result and cache_result.passed:
        achievements.append("✓ Texture cache provides sub-microsecond access for frequently-used data")

    e2e_result = next((r for r in suite.results if r.name == "end_to_end"), None)
    if e2e_result and e2e_result.passed:
        achievements.append("✓ End-to-end workflow completes within acceptable time for interactive use")

    compression_result = next((r for r in suite.results if r.name == "compression"), None)
    if compression_result and compression_result.passed:
        achievements.append("✓ Transparent compression for cold zones is performance-efficient")

    if not achievements:
        achievements.append("Phase 1 benchmark framework is operational and ready for optimization")

    for achievement in achievements:
        lines.append(achievement)
    lines.append("")

    # Optimization Opportunities
    lines.append("### Optimization Opportunities for Phase 2")
    lines.append("")

    if failed_benchmarks:
        lines.append("**Performance Improvements:**")
        lines.append("")
        for result in failed_benchmarks:
            name = result.name.replace("_", " ").title()
            if result.target_time:
                pct = ((result.mean_time / result.target_time) - 1) * 100
                lines.append(f"- **{name}:** {pct:.1f}% over target - consider optimization")
        lines.append("")

    lines.append("**Areas for Investigation:**")
    lines.append("")
    lines.append("- GPU zero-copy mapping with actual GPU APIs (CUDA, Vulkan)")
    lines.append("- SIMD optimizations for Hilbert curve generation")
    lines.append("- Cache pre-fetching strategies for spatial access patterns")
    lines.append("- Compression algorithm tuning for cold zone data")
    lines.append("- Multi-threaded VAT operations for concurrent access")
    lines.append("")

    # Next Steps
    lines.append("## Next Steps")
    lines.append("")
    lines.append("### Phase 2 Roadmap")
    lines.append("")
    lines.append("1. **GPU Zero-Copy Integration**")
    lines.append("   - Implement actual GPU memory mapping APIs")
    lines.append("   - Benchmark GPU vs CPU access patterns")
    lines.append("   - Optimize hot zone placement based on GPU memory constraints")
    lines.append("")
    lines.append("2. **Access Frequency Prediction**")
    lines.append("   - Implement ML-based access prediction")
    lines.append("   - Validate prediction accuracy")
    lines.append("   - Optimize pre-fetching strategies")
    lines.append("")
    lines.append("3. **Transparent Compression Enhancements**")
    lines.append("   - Benchmark different compression algorithms")
    lines.append("   - Implement adaptive compression based on data characteristics")
    lines.append("   - Measure real-world compression ratios")
    lines.append("")
    lines.append("4. **FUSE Integration**")
    lines.append("   - Implement FUSE filesystem interface")
    lines.append("   - Test with real workloads")
    lines.append("   - Measure filesystem operation overhead")
    lines.append("")
    lines.append("5. **Performance Regression Testing**")
    lines.append("   - Establish continuous benchmarking")
    lines.append("   - Track performance over time")
    lines.append("   - Set up CI/CD performance gates")
    lines.append("")

    # System Information
    lines.append("## System Information")
    lines.append("")
    lines.append(f"- **Platform:** {system_info['platform']}")
    lines.append(f"- **Python:** {system_info['python_version']}")
    lines.append(f"- **Machine:** {system_info['machine']}")
    lines.append(f"- **Processor:** {system_info['processor']}")
    lines.append(f"- **Hostname:** {system_info['hostname']}")
    lines.append(f"- **Timestamp:** {system_info['timestamp']}")
    lines.append("")

    # Configuration
    lines.append("## Benchmark Configuration")
    lines.append("")
    lines.append(f"- **Grid Size:** {config['grid_size']}")
    lines.append(f"- **Iterations:** {config['iterations']}")
    lines.append(f"- **E2E Iterations:** {config['e2e_iterations']}")
    lines.append(f"- **Warmup Iterations:** {config['warmup_iterations']}")
    lines.append("")

    # Footer
    lines.append("---")
    lines.append("")
    lines.append("*Report generated by Phase 1 Benchmark Runner for Infinite Map OS*")

    return "\n".join(lines)


def run_benchmarks(config: Dict[str, Any]) -> BenchmarkSuite:
    """
    Run all Phase 1 benchmarks with specified configuration.

    Args:
        config: Configuration dictionary

    Returns:
        BenchmarkSuite with all results
    """
    print("=" * 80)
    print("PHASE 1 BENCHMARK RUNNER - INFINITE MAP OS")
    print("=" * 80)
    print(f"Grid Size: {config['grid_size']}x{config['grid_size']}")
    print(f"Iterations: {config['iterations']} (standard), {config['e2e_iterations']} (e2e)")
    print(f"Warmup: {config['warmup_iterations']} iterations")
    print("=" * 80)
    print("")

    # Create benchmark runner
    benchmark = Phase1Benchmark(
        iterations=config['iterations'],
        warmup_iterations=config['warmup_iterations']
    )

    # Run all benchmarks
    start_time = time.time()
    suite = benchmark.run_all(grid_size=config['grid_size'])
    total_time = time.time() - start_time

    print(f"\nTotal benchmark time: {total_time:.2f}s")

    return suite


def save_results(
    suite: BenchmarkSuite,
    system_info: Dict[str, Any],
    json_path: str,
    markdown_path: str,
    config: Dict[str, Any]
) -> None:
    """
    Save benchmark results to JSON and markdown files.

    Args:
        suite: BenchmarkSuite with results
        system_info: System information dictionary
        json_path: Path for JSON output
        markdown_path: Path for markdown output
        config: Benchmark configuration used
    """
    # Save JSON results
    json_file = Path(json_path)
    json_file.parent.mkdir(parents=True, exist_ok=True)

    # Add system info to suite metadata
    suite.metadata["system_info"] = system_info
    suite.metadata["config"] = config
    suite.metadata["total_benchmark_time"] = suite.metadata.get("total_benchmark_time", 0)

    with open(json_file, 'w') as f:
        json.dump(suite.to_dict(), f, indent=2)

    print(f"✓ JSON results saved to {json_path}")

    # Save markdown report
    md_file = Path(markdown_path)
    md_file.parent.mkdir(parents=True, exist_ok=True)

    markdown = generate_markdown_report(suite, system_info, config)

    with open(md_file, 'w') as f:
        f.write(markdown)

    print(f"✓ Markdown report saved to {markdown_path}")


def print_completion_message(suite: BenchmarkSuite) -> None:
    """Print completion message with summary."""
    summary = suite.get_summary()

    print("\n" + "=" * 80)
    print("BENCHMARK COMPLETION SUMMARY")
    print("=" * 80)
    print(f"Total Benchmarks: {summary['total']}")
    print(f"Passed: {summary['passed']}")
    print(f"Failed: {summary['failed']}")
    print(f"Pass Rate: {summary.get('pass_rate', 0):.1f}%")
    print(f"Total Memory: {summary.get('total_memory_mb', 0):.2f} MB")
    print("=" * 80)
    print("\nPhase 1 benchmarking complete!")
    print("Check the markdown report for detailed analysis and next steps.")


def main():
    """Main entry point for Phase 1 benchmark runner."""
    parser = argparse.ArgumentParser(
        description="Phase 1 Benchmark Runner for Infinite Map OS",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                                    Run with defaults
  %(prog)s --grid-size 1024                   Use smaller grid size
  %(prog)s --iterations 50                    Fewer iterations
  %(prog)s --output custom_results.json      Custom output path
  %(prog)s --report-path docs/my_report.md    Custom report path
        """
    )

    parser.add_argument(
        "--grid-size",
        type=int,
        default=CONFIG["grid_size"],
        help=f"Grid size for benchmarks (default: {CONFIG['grid_size']})"
    )

    parser.add_argument(
        "--iterations",
        type=int,
        default=CONFIG["iterations"],
        help=f"Number of benchmark iterations (default: {CONFIG['iterations']})"
    )

    parser.add_argument(
        "--e2e-iterations",
        type=int,
        default=CONFIG["e2e_iterations"],
        help=f"Number of end-to-end benchmark iterations (default: {CONFIG['e2e_iterations']})"
    )

    parser.add_argument(
        "--warmup-iterations",
        type=int,
        default=CONFIG["warmup_iterations"],
        help=f"Number of warmup iterations (default: {CONFIG['warmup_iterations']})"
    )

    parser.add_argument(
        "--output",
        type=str,
        default=DEFAULT_RESULTS_PATH,
        help=f"Path for JSON results output (default: {DEFAULT_RESULTS_PATH})"
    )

    parser.add_argument(
        "--report-path",
        type=str,
        default=DEFAULT_REPORT_PATH,
        help=f"Path for markdown report output (default: {DEFAULT_REPORT_PATH})"
    )

    parser.add_argument(
        "--skip-report",
        action="store_true",
        help="Skip generating markdown report"
    )

    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Enable verbose output"
    )

    args = parser.parse_args()

    # Build config from args
    config = {
        "grid_size": args.grid_size,
        "iterations": args.iterations,
        "e2e_iterations": args.e2e_iterations,
        "warmup_iterations": args.warmup_iterations,
    }

    # Collect system info
    system_info = get_system_info()

    try:
        # Run benchmarks
        suite = run_benchmarks(config)

        # Print console report
        print("\n")
        benchmark = Phase1Benchmark(iterations=config['iterations'])
        benchmark.suite = suite
        benchmark.print_report()

        # Save results
        save_results(
            suite,
            system_info,
            args.output,
            args.report_path,
            config
        )

        # Print completion message
        print_completion_message(suite)

        return 0

    except Exception as e:
        print(f"\n✗ Error running benchmarks: {e}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
