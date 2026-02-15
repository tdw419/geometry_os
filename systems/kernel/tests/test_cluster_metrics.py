# systems/kernel/tests/test_cluster_metrics.py
import pytest
from systems.kernel.cluster_metrics import (
    ClusterMetricsCollector,
    ClusterMetrics,
    KernelMetricsSnapshot
)


class TestClusterMetrics:
    """Tests for cluster metrics collection."""

    def test_collector_creation(self):
        """Can create metrics collector."""
        collector = ClusterMetricsCollector()

        assert collector is not None

    def test_record_kernel_metric(self):
        """Can record kernel metric."""
        collector = ClusterMetricsCollector()

        collector.record("kernel-1", "dispatches", 10)

        assert collector.get("kernel-1", "dispatches") == 10

    def test_aggregate_metrics(self):
        """Can aggregate metrics across kernels."""
        collector = ClusterMetricsCollector()

        collector.record("k1", "dispatches", 10)
        collector.record("k2", "dispatches", 20)
        collector.record("k3", "dispatches", 30)

        total = collector.aggregate("dispatches")

        assert total == 60

    def test_get_snapshot(self):
        """Can get metrics snapshot."""
        collector = ClusterMetricsCollector()

        collector.record("k1", "cpu", 0.5)
        collector.record("k1", "memory", 0.3)

        snapshot = collector.get_snapshot("k1")

        assert snapshot.metrics["cpu"] == 0.5
        assert snapshot.metrics["memory"] == 0.3

    def test_cluster_summary(self):
        """Can get cluster summary."""
        collector = ClusterMetricsCollector()

        collector.record("k1", "dispatches", 100)
        collector.record("k2", "dispatches", 200)

        summary = collector.get_cluster_summary()

        assert summary.total_dispatches == 300
        assert summary.kernel_count == 2


class TestKernelMetricsSnapshot:
    """Tests for kernel metrics snapshot."""

    def test_snapshot_creation(self):
        """Can create metrics snapshot."""
        snapshot = KernelMetricsSnapshot(
            kernel_name="test-kernel",
            timestamp=1234567890.0,
            metrics={"cpu": 0.5, "memory": 0.3}
        )

        assert snapshot.kernel_name == "test-kernel"
        assert snapshot.timestamp == 1234567890.0
        assert snapshot.metrics["cpu"] == 0.5


class TestClusterMetricsData:
    """Tests for cluster metrics data."""

    def test_cluster_metrics_creation(self):
        """Can create cluster metrics."""
        metrics = ClusterMetrics(
            cluster_name="test-cluster",
            kernel_count=3,
            total_dispatches=1000,
            total_errors=5,
            avg_latency_ms=25.5,
            avg_cpu=0.4,
            avg_memory=0.3
        )

        assert metrics.cluster_name == "test-cluster"
        assert metrics.kernel_count == 3
        assert metrics.total_dispatches == 1000

    def test_cluster_metrics_to_dict(self):
        """Can convert cluster metrics to dict."""
        metrics = ClusterMetrics(
            cluster_name="test",
            kernel_count=2,
            total_dispatches=100,
            total_errors=0,
            avg_latency_ms=10.0,
            avg_cpu=0.5,
            avg_memory=0.2,
            timestamp=1234567890.0
        )

        result = metrics.to_dict()

        assert result["cluster_name"] == "test"
        assert result["kernel_count"] == 2
        assert result["total_dispatches"] == 100
        assert result["timestamp"] == 1234567890.0


class TestClusterMetricsCollectorIncrement:
    """Tests for increment functionality."""

    def test_increment_metric(self):
        """Can increment a counter metric."""
        collector = ClusterMetricsCollector()

        collector.increment("kernel-1", "requests")
        collector.increment("kernel-1", "requests")
        collector.increment("kernel-1", "requests", amount=5)

        assert collector.get("kernel-1", "requests") == 7

    def test_increment_from_zero(self):
        """Increment starts from zero."""
        collector = ClusterMetricsCollector()

        collector.increment("new-kernel", "counter", amount=10)

        assert collector.get("new-kernel", "counter") == 10


class TestClusterMetricsCollectorAverage:
    """Tests for average functionality."""

    def test_average_metric(self):
        """Can average metrics across kernels."""
        collector = ClusterMetricsCollector()

        collector.record("k1", "cpu", 0.5)
        collector.record("k2", "cpu", 0.7)
        collector.record("k3", "cpu", 0.9)

        avg = collector.average("cpu")

        assert avg == (0.5 + 0.7 + 0.9) / 3

    def test_average_empty(self):
        """Average returns 0 when no metrics."""
        collector = ClusterMetricsCollector()

        avg = collector.average("nonexistent")

        assert avg == 0.0


class TestClusterMetricsCollectorExport:
    """Tests for Prometheus export."""

    def test_export_prometheus(self):
        """Can export metrics in Prometheus format."""
        collector = ClusterMetricsCollector()

        collector.record("kernel-1", "dispatches", 100)
        collector.record("kernel-1", "cpu", 0.5)
        collector.record("kernel-2", "dispatches", 200)

        prometheus = collector.export_prometheus()

        assert 'kernel_dispatches{kernel="kernel-1"} 100' in prometheus
        assert 'kernel_cpu{kernel="kernel-1"} 0.5' in prometheus
        assert 'kernel_dispatches{kernel="kernel-2"} 200' in prometheus

    def test_export_prometheus_empty(self):
        """Export returns empty string when no metrics."""
        collector = ClusterMetricsCollector()

        prometheus = collector.export_prometheus()

        assert prometheus == ""


class TestClusterMetricsCollectorReset:
    """Tests for reset functionality."""

    def test_reset_clears_metrics(self):
        """Reset clears all metrics."""
        collector = ClusterMetricsCollector()

        collector.record("k1", "test", 100)
        collector.reset()

        assert collector.get("k1", "test") is None
