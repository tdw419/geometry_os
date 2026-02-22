# systems/kernel/cluster_metrics.py
"""
Cluster Metrics Collection

Aggregates metrics across kernel clusters.
"""
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
from collections import defaultdict
import time
import json


@dataclass
class KernelMetricsSnapshot:
    """Point-in-time metrics for a kernel."""
    kernel_name: str
    timestamp: float
    metrics: Dict[str, Any] = field(default_factory=dict)


@dataclass
class ClusterMetrics:
    """Aggregated metrics for a cluster."""
    cluster_name: str
    kernel_count: int
    total_dispatches: int
    total_errors: int
    avg_latency_ms: float
    avg_cpu: float
    avg_memory: float
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "cluster_name": self.cluster_name,
            "kernel_count": self.kernel_count,
            "total_dispatches": self.total_dispatches,
            "total_errors": self.total_errors,
            "avg_latency_ms": self.avg_latency_ms,
            "avg_cpu": self.avg_cpu,
            "avg_memory": self.avg_memory,
            "timestamp": self.timestamp
        }


class ClusterMetricsCollector:
    """
    Collects and aggregates metrics across kernels.

    Usage:
        collector = ClusterMetricsCollector()

        # Record metrics
        collector.record("kernel-1", "dispatches", 10)
        collector.record("kernel-1", "latency_ms", 5.2)

        # Get individual
        value = collector.get("kernel-1", "dispatches")

        # Aggregate
        total = collector.aggregate("dispatches")

        # Summary
        summary = collector.get_cluster_summary()
    """

    def __init__(self, cluster_name: str = "default"):
        self.cluster_name = cluster_name
        # kernel_name -> {metric_name -> value}
        self._metrics: Dict[str, Dict[str, Any]] = defaultdict(dict)
        # History for time-series
        self._history: List[KernelMetricsSnapshot] = []

    def record(self, kernel_name: str, metric_name: str, value: Any):
        """Record a metric value for a kernel."""
        self._metrics[kernel_name][metric_name] = value

    def increment(self, kernel_name: str, metric_name: str, amount: int = 1):
        """Increment a counter metric."""
        current = self._metrics[kernel_name].get(metric_name, 0)
        self._metrics[kernel_name][metric_name] = current + amount

    def get(self, kernel_name: str, metric_name: str) -> Optional[Any]:
        """Get a metric value."""
        return self._metrics.get(kernel_name, {}).get(metric_name)

    def aggregate(self, metric_name: str) -> Any:
        """Aggregate a metric across all kernels."""
        values = [
            m[metric_name]
            for m in self._metrics.values()
            if metric_name in m
        ]

        if not values:
            return 0

        if isinstance(values[0], (int, float)):
            return sum(values)
        return values

    def average(self, metric_name: str) -> float:
        """Get average of a metric across kernels."""
        values = [
            m[metric_name]
            for m in self._metrics.values()
            if metric_name in m and isinstance(m[metric_name], (int, float))
        ]

        if not values:
            return 0.0

        return sum(values) / len(values)

    def get_snapshot(self, kernel_name: str) -> KernelMetricsSnapshot:
        """Get a metrics snapshot for a kernel."""
        return KernelMetricsSnapshot(
            kernel_name=kernel_name,
            timestamp=time.time(),
            metrics=dict(self._metrics.get(kernel_name, {}))
        )

    def get_cluster_summary(self) -> ClusterMetrics:
        """Get aggregated cluster metrics."""
        kernel_count = len(self._metrics)

        return ClusterMetrics(
            cluster_name=self.cluster_name,
            kernel_count=kernel_count,
            total_dispatches=self.aggregate("dispatches"),
            total_errors=self.aggregate("errors"),
            avg_latency_ms=self.average("latency_ms"),
            avg_cpu=self.average("cpu"),
            avg_memory=self.average("memory")
        )

    def export_prometheus(self) -> str:
        """Export metrics in Prometheus format."""
        lines = []

        for kernel_name, metrics in self._metrics.items():
            for metric_name, value in metrics.items():
                if isinstance(value, (int, float)):
                    lines.append(
                        f'kernel_{metric_name}{{kernel="{kernel_name}"}} {value}'
                    )

        return "\n".join(lines)

    def reset(self):
        """Reset all metrics."""
        self._metrics.clear()
        self._history.clear()
