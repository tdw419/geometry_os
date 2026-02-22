"""
Benchmark Suite for A2A Scale Testing.

Runs systematic benchmarks across different configurations
and generates comprehensive reports.
"""

import asyncio
import json
import time
from dataclasses import dataclass, field, asdict
from typing import Dict, List, Optional, Any
from pathlib import Path

from .load_harness import LoadTestHarness, LoadTestScenario, LoadTestResult


@dataclass
class BenchmarkConfig:
    """Configuration for benchmark suite."""

    agent_counts: List[int] = field(default_factory=lambda: [10, 50, 100])
    message_counts: List[int] = field(default_factory=lambda: [100, 500, 1000])
    topologies: List[str] = field(default_factory=lambda: ["star", "mesh", "ring"])
    message_intervals_ms: List[int] = field(default_factory=lambda: [10, 100])
    repeat_count: int = 3  # Run each config N times for statistical significance


@dataclass
class BenchmarkResult:
    """Result from a single benchmark run."""

    agent_count: int
    message_count: int
    topology: str
    message_interval_ms: int
    repeat: int
    success: bool
    error: Optional[str] = None

    # Metrics
    throughput_msg_per_sec: float = 0.0
    avg_latency_ms: float = 0.0
    p50_latency_ms: float = 0.0
    p95_latency_ms: float = 0.0
    p99_latency_ms: float = 0.0
    duration_sec: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


class BenchmarkSuite:
    """
    Runs systematic benchmarks across multiple configurations.
    """

    def __init__(
        self,
        router_url: str = "ws://localhost:8766",
        config: Optional[BenchmarkConfig] = None
    ):
        self.router_url = router_url
        self.config = config or BenchmarkConfig()
        self.results: List[BenchmarkResult] = []

    async def run(self) -> List[BenchmarkResult]:
        """
        Run all configured benchmarks.

        Returns list of all results.
        """
        self.results = []

        total_runs = (
            len(self.config.agent_counts) *
            len(self.config.message_counts) *
            len(self.config.topologies) *
            len(self.config.message_intervals_ms) *
            self.config.repeat_count
        )

        run_idx = 0
        for agent_count in self.config.agent_counts:
            for msg_count in self.config.message_counts:
                for topology in self.config.topologies:
                    for interval in self.config.message_intervals_ms:
                        for repeat in range(self.config.repeat_count):
                            run_idx += 1

                            result = await self._run_single(
                                agent_count=agent_count,
                                message_count=msg_count,
                                topology=topology,
                                message_interval_ms=interval,
                                repeat=repeat
                            )

                            self.results.append(result)

        return self.results

    async def _run_single(
        self,
        agent_count: int,
        message_count: int,
        topology: str,
        message_interval_ms: int,
        repeat: int
    ) -> BenchmarkResult:
        """Run a single benchmark configuration."""

        result = BenchmarkResult(
            agent_count=agent_count,
            message_count=message_count,
            topology=topology,
            message_interval_ms=message_interval_ms,
            repeat=repeat,
            success=False
        )

        try:
            harness = LoadTestHarness(
                router_url=self.router_url,
                agent_count=agent_count
            )

            scenario = LoadTestScenario(
                name=f"benchmark_{agent_count}_{message_count}_{topology}",
                message_count=message_count,
                message_interval_ms=message_interval_ms,
                warmup_messages=max(10, agent_count // 2),
                topology=topology
            )

            await harness.setup()
            metrics = await harness.run_scenario(scenario)
            await harness.teardown()

            result.success = True
            result.throughput_msg_per_sec = metrics.get("throughput_msg_per_sec", 0)
            result.avg_latency_ms = metrics.get("avg_latency_ms", 0)
            result.p50_latency_ms = metrics.get("p50_latency_ms", 0)
            result.p95_latency_ms = metrics.get("p95_latency_ms", 0)
            result.p99_latency_ms = metrics.get("p99_latency_ms", 0)
            result.duration_sec = metrics.get("duration_sec", 0)

        except Exception as e:
            result.error = str(e)

        return result

    def get_report(self) -> Dict[str, Any]:
        """
        Generate a summary report of all benchmark results.
        """
        if not self.results:
            return {"summary": {}, "results": [], "config": {}}

        successful = [r for r in self.results if r.success]
        failed = [r for r in self.results if not r.success]

        # Calculate summary statistics
        throughputs = [r.throughput_msg_per_sec for r in successful]
        latencies = [r.avg_latency_ms for r in successful]

        summary = {
            "total_runs": len(self.results),
            "successful": len(successful),
            "failed": len(failed),
            "avg_throughput": sum(throughputs) / len(throughputs) if throughputs else 0,
            "max_throughput": max(throughputs) if throughputs else 0,
            "min_throughput": min(throughputs) if throughputs else 0,
            "avg_latency_ms": sum(latencies) / len(latencies) if latencies else 0,
            "max_latency_ms": max(latencies) if latencies else 0,
        }

        # Group by topology
        by_topology: Dict[str, List[float]] = {}
        for r in successful:
            if r.topology not in by_topology:
                by_topology[r.topology] = []
            by_topology[r.topology].append(r.throughput_msg_per_sec)

        summary["by_topology"] = {
            t: {
                "avg_throughput": sum(v) / len(v),
                "max_throughput": max(v),
                "min_throughput": min(v)
            }
            for t, v in by_topology.items()
        }

        # Group by agent count
        by_agent_count: Dict[int, List[float]] = {}
        for r in successful:
            key = r.agent_count
            if key not in by_agent_count:
                by_agent_count[key] = []
            by_agent_count[key].append(r.throughput_msg_per_sec)

        summary["by_agent_count"] = {
            str(k): {
                "avg_throughput": sum(v) / len(v),
                "max_throughput": max(v),
                "min_throughput": min(v)
            }
            for k, v in sorted(by_agent_count.items())
        }

        return {
            "summary": summary,
            "results": [r.to_dict() for r in self.results],
            "config": asdict(self.config)
        }

    def save_report(self, path: str) -> None:
        """Save the report to a JSON file."""
        report = self.get_report()
        with open(path, "w") as f:
            json.dump(report, f, indent=2)

    def print_summary(self) -> None:
        """Print a human-readable summary."""
        report = self.get_report()
        summary = report["summary"]

        print("\n" + "=" * 60)
        print("A2A BENCHMARK SUMMARY")
        print("=" * 60)
        print(f"Total Runs:    {summary['total_runs']}")
        print(f"Successful:    {summary['successful']}")
        print(f"Failed:        {summary['failed']}")
        print("-" * 60)
        print(f"Avg Throughput: {summary['avg_throughput']:.2f} msg/s")
        print(f"Max Throughput: {summary['max_throughput']:.2f} msg/s")
        print(f"Avg Latency:    {summary['avg_latency_ms']:.2f} ms")
        print(f"Max Latency:    {summary['max_latency_ms']:.2f} ms")
        print("=" * 60)
