"""
CLI Entry Point for A2A Load Testing.

Usage:
    python -m systems.pixel_compiler.a2a_load_test \
        --agents 10,50,100 \
        --messages 100,500,1000 \
        --topologies star,mesh,ring \
        --output benchmark_results.json

    # Quick test mode
    python -m systems.pixel_compiler.a2a_load_test --quick
"""

import argparse
import asyncio
import sys
from typing import List, Optional

from .benchmark_suite import BenchmarkSuite, BenchmarkConfig


def parse_args(args: Optional[List[str]] = None) -> argparse.Namespace:
    """
    Parse command line arguments.

    Args:
        args: Optional list of arguments to parse. If None, uses sys.argv.

    Returns:
        Parsed arguments namespace with:
        - command: str - Subcommand (benchmark, stress, discover)
        - router: str - Router WebSocket URL
        - agents: List[int] - Agent counts to test
        - messages: List[int] - Message counts to test
        - topologies: List[str] - Topologies to test
        - intervals: List[int] - Message intervals in ms
        - repeat: int - Repeat count
        - output: str - Output JSON file path
        - quick: bool - Quick test flag
        - profile: str - Stress test profile
        - min_agents: int - Minimum agents for discover
        - max_agents: int - Maximum agents for discover
    """
    parser = argparse.ArgumentParser(
        description="A2A Load Testing - Stress test agent-to-agent coordination",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Benchmark with custom parameters (legacy mode)
  python -m systems.pixel_compiler.a2a_load_test \\
      --agents 10,50,100 \\
      --messages 100,500,1000 \\
      --topologies star,mesh,ring \\
      --output results.json

  # Stress test with profile
  python -m systems.pixel_compiler.a2a_load_test stress --profile extreme

  # Discover scale limits
  python -m systems.pixel_compiler.a2a_load_test discover --min-agents 10 --max-agents 500
"""
    )

    subparsers = parser.add_subparsers(dest="command", help="Command to run")

    parser.add_argument(
        "--router",
        default="ws://localhost:8766",
        help="A2A router WebSocket URL (default: ws://localhost:8766)"
    )

    parser.add_argument(
        "--agents",
        default="10,50,100",
        help="Comma-separated list of agent counts to test (default: 10,50,100)"
    )

    parser.add_argument(
        "--messages",
        default="100,500,1000",
        help="Comma-separated list of message counts to test (default: 100,500,1000)"
    )

    parser.add_argument(
        "--topologies",
        default="star,mesh,ring",
        help="Comma-separated list of topologies to test (default: star,mesh,ring)"
    )

    parser.add_argument(
        "--intervals",
        default="10,100",
        help="Comma-separated list of message intervals in ms (default: 10,100)"
    )

    parser.add_argument(
        "--repeat",
        type=int,
        default=3,
        help="Number of times to repeat each configuration (default: 3)"
    )

    parser.add_argument(
        "--output",
        default="benchmark_results.json",
        help="Output JSON file for results (default: benchmark_results.json)"
    )

    parser.add_argument(
        "--quick",
        action="store_true",
        help="Run quick test with smaller agent counts and fewer messages"
    )

    # Stress subcommand
    stress_parser = subparsers.add_parser("stress", help="Run stress test with predefined profiles")
    stress_parser.add_argument(
        "--profile",
        choices=["quick", "standard", "extreme", "endurance"],
        default="quick",
        help="Stress test profile"
    )
    stress_parser.add_argument(
        "--router",
        default="ws://localhost:8766",
        help="Router URL"
    )
    stress_parser.add_argument(
        "--output",
        default="stress_report.md",
        help="Output report file"
    )

    # Discover subcommand
    discover_parser = subparsers.add_parser("discover", help="Discover scale limits")
    discover_parser.add_argument(
        "--min-agents",
        type=int,
        default=10,
        help="Minimum agent count to test"
    )
    discover_parser.add_argument(
        "--max-agents",
        type=int,
        default=1000,
        help="Maximum agent count to test"
    )
    discover_parser.add_argument(
        "--router",
        default="ws://localhost:8766",
        help="Router URL"
    )

    parsed = parser.parse_args(args)

    # Convert comma-separated strings to lists for legacy mode
    if parsed.command is None:
        if parsed.quick:
            # Quick mode uses smaller counts
            parsed.agents = [5, 10]
            parsed.messages = [50, 100]
            parsed.topologies = ["star"]
            parsed.intervals = [100]
        else:
            parsed.agents = [int(x.strip()) for x in parsed.agents.split(",")]
            parsed.messages = [int(x.strip()) for x in parsed.messages.split(",")]
            parsed.topologies = [x.strip() for x in parsed.topologies.split(",")]
            parsed.intervals = [int(x.strip()) for x in parsed.intervals.split(",")]

    return parsed


async def run_benchmark(args: argparse.Namespace) -> None:
    """
    Run the benchmark with parsed arguments.

    Args:
        args: Parsed arguments from parse_args()
    """
    config = BenchmarkConfig(
        agent_counts=args.agents,
        message_counts=args.messages,
        topologies=args.topologies,
        message_intervals_ms=args.intervals,
        repeat_count=args.repeat
    )

    print(f"\nA2A Load Test")
    print(f"Router: {args.router}")
    print(f"Agents: {args.agents}")
    print(f"Messages: {args.messages}")
    print(f"Topologies: {args.topologies}")
    print(f"Intervals (ms): {args.intervals}")
    print(f"Repeat: {args.repeat}")
    print("-" * 40)

    suite = BenchmarkSuite(
        router_url=args.router,
        config=config
    )

    results = await suite.run()

    # Print summary
    suite.print_summary()

    # Save results
    suite.save_report(args.output)
    print(f"\nResults saved to: {args.output}")


def main(args: Optional[List[str]] = None) -> int:
    """
    Main entry point for the CLI.

    Args:
        args: Optional list of arguments. If None, uses sys.argv.

    Returns:
        Exit code (0 for success, 1 for error/interruption)
    """
    parsed = parse_args(args)

    try:
        asyncio.run(run_benchmark(parsed))
        return 0
    except KeyboardInterrupt:
        print("\nInterrupted")
        return 1
    except Exception as e:
        print(f"Error: {e}")
        return 1


if __name__ == "__main__":
    sys.exit(main())
