#!/usr/bin/env python3
"""
Tests for Infinite Map Monitoring and Metrics System.

Comprehensive test coverage for:
- Metric and MetricStats dataclasses
- MetricCollector (recording, statistics)
- HealthChecker (registration, execution)
- AlertManager (firing, resolving)
- MonitoringManager (integration)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_monitoring.py -v
"""

import os
import sys
import json
import tempfile
import threading
import time
from pathlib import Path
from datetime import datetime, timedelta
from unittest.mock import Mock, patch

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_monitoring import (
    MetricType,
    HealthStatus,
    AlertSeverity,
    Metric,
    MetricStats,
    HealthCheckResult,
    Alert,
    MetricCollector,
    HealthChecker,
    AlertManager,
    MonitoringManager,
    Timer,
    create_monitor,
)


class TestMetricType:
    """Tests for MetricType enum."""

    def test_metric_types(self):
        """Test all metric types exist."""
        assert MetricType.COUNTER.value == "counter"
        assert MetricType.GAUGE.value == "gauge"
        assert MetricType.HISTOGRAM.value == "histogram"
        assert MetricType.SUMMARY.value == "summary"


class TestHealthStatus:
    """Tests for HealthStatus enum."""

    def test_health_statuses(self):
        """Test all health statuses exist."""
        assert HealthStatus.HEALTHY.value == "healthy"
        assert HealthStatus.DEGRADED.value == "degraded"
        assert HealthStatus.UNHEALTHY.value == "unhealthy"
        assert HealthStatus.UNKNOWN.value == "unknown"


class TestAlertSeverity:
    """Tests for AlertSeverity enum."""

    def test_alert_severities(self):
        """Test all alert severities exist."""
        assert AlertSeverity.INFO.value == "info"
        assert AlertSeverity.WARNING.value == "warning"
        assert AlertSeverity.ERROR.value == "error"
        assert AlertSeverity.CRITICAL.value == "critical"


class TestMetric:
    """Tests for Metric dataclass."""

    def test_create_metric(self):
        """Test creating a metric."""
        metric = Metric(
            name="read_latency",
            value=5.5,
            metric_type=MetricType.GAUGE,
            timestamp=datetime.now()
        )
        assert metric.name == "read_latency"
        assert metric.value == 5.5
        assert metric.metric_type == MetricType.GAUGE

    def test_metric_with_labels(self):
        """Test metric with labels."""
        metric = Metric(
            name="requests",
            value=100,
            metric_type=MetricType.COUNTER,
            timestamp=datetime.now(),
            labels={"endpoint": "/api", "method": "GET"}
        )
        assert metric.labels["endpoint"] == "/api"

    def test_metric_serialization(self):
        """Test metric serialization."""
        metric = Metric(
            name="test",
            value=42.0,
            metric_type=MetricType.GAUGE,
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            labels={"key": "value"}
        )
        data = metric.to_dict()

        assert data["name"] == "test"
        assert data["value"] == 42.0
        assert data["type"] == "gauge"
        assert data["labels"] == {"key": "value"}


class TestMetricStats:
    """Tests for MetricStats dataclass."""

    def test_create_stats(self):
        """Test creating metric stats."""
        stats = MetricStats(
            name="latency",
            count=100,
            sum_value=500.0,
            min_value=1.0,
            max_value=20.0,
            mean=5.0,
            median=4.5,
            std_dev=2.5,
            p50=4.5,
            p95=15.0,
            p99=18.0
        )
        assert stats.count == 100
        assert stats.mean == 5.0

    def test_stats_serialization(self):
        """Test stats serialization."""
        stats = MetricStats(
            name="test",
            count=10,
            sum_value=100.0,
            min_value=5.0,
            max_value=15.0,
            mean=10.0,
            median=10.0,
            std_dev=2.0,
            p50=10.0,
            p95=14.0,
            p99=15.0
        )
        data = stats.to_dict()

        assert data["count"] == 10
        assert data["mean"] == 10.0


class TestHealthCheckResult:
    """Tests for HealthCheckResult dataclass."""

    def test_create_result(self):
        """Test creating health check result."""
        result = HealthCheckResult(
            name="database",
            status=HealthStatus.HEALTHY,
            message="Database connection OK",
            timestamp=datetime.now()
        )
        assert result.status == HealthStatus.HEALTHY

    def test_result_serialization(self):
        """Test result serialization."""
        result = HealthCheckResult(
            name="cache",
            status=HealthStatus.DEGRADED,
            message="Cache latency high",
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            details={"latency_ms": 50},
            duration_ms=5.5
        )
        data = result.to_dict()

        assert data["status"] == "degraded"
        assert data["duration_ms"] == 5.5


class TestAlert:
    """Tests for Alert dataclass."""

    def test_create_alert(self):
        """Test creating an alert."""
        alert = Alert(
            alert_id="alert_001",
            name="high_latency",
            severity=AlertSeverity.WARNING,
            message="Latency exceeded threshold",
            timestamp=datetime.now()
        )
        assert alert.resolved is False

    def test_alert_serialization(self):
        """Test alert serialization."""
        alert = Alert(
            alert_id="alert_002",
            name="error_rate",
            severity=AlertSeverity.ERROR,
            message="Error rate too high",
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            resolved=True,
            resolved_at=datetime(2026, 2, 12, 12, 30, 0)
        )
        data = alert.to_dict()

        assert data["resolved"] is True
        assert data["resolved_at"] is not None


class TestMetricCollector:
    """Tests for MetricCollector class."""

    def test_create_collector(self):
        """Test creating a metric collector."""
        collector = MetricCollector()
        assert len(collector.metrics) == 0

    def test_record_gauge(self):
        """Test recording gauge metric."""
        collector = MetricCollector()
        metric = collector.record("temperature", 25.5, MetricType.GAUGE)

        assert metric.name == "temperature"
        assert metric.value == 25.5
        assert len(collector.metrics["temperature"]) == 1

    def test_record_counter(self):
        """Test recording counter metric."""
        collector = MetricCollector()

        collector.record("requests", 1.0, MetricType.COUNTER)
        collector.record("requests", 1.0, MetricType.COUNTER)
        collector.record("requests", 1.0, MetricType.COUNTER)

        assert collector.get_counter("requests") == 3.0

    def test_increment_counter(self):
        """Test incrementing counter."""
        collector = MetricCollector()
        collector.increment("requests")
        collector.increment("requests", 5.0)

        assert collector.get_counter("requests") == 6.0

    def test_set_gauge(self):
        """Test setting gauge."""
        collector = MetricCollector()
        collector.gauge("memory_mb", 100)
        collector.gauge("memory_mb", 150)

        assert collector.get_gauge("memory_mb") == 150

    def test_record_timing(self):
        """Test recording timing."""
        collector = MetricCollector()
        collector.timing("api_call", 15.5)
        collector.timing("api_call", 20.0)

        metrics = collector.get_metrics("api_call_ms")
        assert len(metrics) == 2

    def test_get_stats(self):
        """Test calculating statistics."""
        collector = MetricCollector()

        for val in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
            collector.record("values", val, MetricType.GAUGE)

        stats = collector.get_stats("values")

        assert stats.count == 10
        assert stats.min_value == 1
        assert stats.max_value == 10
        assert stats.mean == 5.5
        assert stats.median == 5.5

    def test_get_stats_empty(self):
        """Test stats for non-existent metric."""
        collector = MetricCollector()
        stats = collector.get_stats("nonexistent")

        assert stats is None

    def test_get_percentiles(self):
        """Test percentile calculation."""
        collector = MetricCollector()

        # Add 100 values from 1 to 100
        for val in range(1, 101):
            collector.record("latency", val, MetricType.GAUGE)

        stats = collector.get_stats("latency")

        assert stats.p50 == pytest.approx(50.5, rel=0.1)
        assert stats.p95 == pytest.approx(95.5, rel=0.1)
        assert stats.p99 == pytest.approx(99.5, rel=0.1)

    def test_clear_metrics(self):
        """Test clearing metrics."""
        collector = MetricCollector()
        collector.record("test", 1.0)
        collector.record("other", 2.0)

        collector.clear("test")

        assert len(collector.metrics.get("test", [])) == 0
        assert len(collector.metrics.get("other", [])) == 1

    def test_clear_all_metrics(self):
        """Test clearing all metrics."""
        collector = MetricCollector()
        collector.record("a", 1.0)
        collector.record("b", 2.0)

        collector.clear()

        assert len(collector.metrics) == 0

    def test_max_history(self):
        """Test history limit."""
        collector = MetricCollector(max_history=10)

        for i in range(20):
            collector.record("test", i)

        metrics = collector.get_metrics("test")
        assert len(metrics) == 10
        assert metrics[0].value == 10  # First 10 were trimmed

    def test_thread_safety(self):
        """Test thread-safe recording."""
        collector = MetricCollector()
        errors = []

        def record_values(start):
            try:
                for i in range(start, start + 100):
                    collector.record("test", i)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=record_values, args=(i * 100,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(collector.metrics["test"]) == 300


class TestHealthChecker:
    """Tests for HealthChecker class."""

    def test_create_checker(self):
        """Test creating a health checker."""
        checker = HealthChecker()
        assert len(checker.checks) == 0

    def test_register_check(self):
        """Test registering a health check."""
        checker = HealthChecker()

        def my_check():
            return HealthCheckResult(
                name="test",
                status=HealthStatus.HEALTHY,
                message="OK",
                timestamp=datetime.now()
            )

        checker.register_check("test", my_check)
        assert "test" in checker.checks

    def test_run_check(self):
        """Test running a health check."""
        checker = HealthChecker()

        def my_check():
            return HealthCheckResult(
                name="test",
                status=HealthStatus.HEALTHY,
                message="All good",
                timestamp=datetime.now()
            )

        checker.register_check("test", my_check)
        result = checker.run_check("test")

        assert result.status == HealthStatus.HEALTHY
        assert result.name == "test"

    def test_run_check_with_exception(self):
        """Test running a check that throws exception."""
        checker = HealthChecker()

        def bad_check():
            raise Exception("Check failed!")

        checker.register_check("bad", bad_check)
        result = checker.run_check("bad")

        assert result.status == HealthStatus.UNHEALTHY
        assert "failed" in result.message.lower()

    def test_run_all_checks(self):
        """Test running all checks."""
        checker = HealthChecker()

        checker.register_check("a", lambda: HealthCheckResult(
            name="a", status=HealthStatus.HEALTHY, message="", timestamp=datetime.now()
        ))
        checker.register_check("b", lambda: HealthCheckResult(
            name="b", status=HealthStatus.DEGRADED, message="", timestamp=datetime.now()
        ))

        results = checker.run_all_checks()

        assert len(results) == 2

    def test_get_overall_status(self):
        """Test getting overall status."""
        checker = HealthChecker()

        checker.register_check("healthy", lambda: HealthCheckResult(
            name="healthy", status=HealthStatus.HEALTHY, message="", timestamp=datetime.now()
        ))
        checker.run_all_checks()

        assert checker.get_overall_status() == HealthStatus.HEALTHY

        checker.register_check("unhealthy", lambda: HealthCheckResult(
            name="unhealthy", status=HealthStatus.UNHEALTHY, message="", timestamp=datetime.now()
        ))
        checker.run_all_checks()

        assert checker.get_overall_status() == HealthStatus.UNHEALTHY

    def test_unregister_check(self):
        """Test unregistering a check."""
        checker = HealthChecker()
        checker.register_check("test", lambda: None)
        checker.unregister_check("test")

        assert "test" not in checker.checks


class TestAlertManager:
    """Tests for AlertManager class."""

    def test_create_manager(self):
        """Test creating an alert manager."""
        manager = AlertManager()
        assert len(manager.alerts) == 0

    def test_fire_alert(self):
        """Test firing an alert."""
        manager = AlertManager()
        alert = manager.fire("high_cpu", AlertSeverity.WARNING, "CPU usage > 80%")

        assert alert.name == "high_cpu"
        assert alert.severity == AlertSeverity.WARNING
        assert len(manager.alerts) == 1
        assert len(manager.active_alerts) == 1

    def test_resolve_alert(self):
        """Test resolving an alert."""
        manager = AlertManager()
        alert = manager.fire("test", AlertSeverity.INFO, "Test")

        result = manager.resolve(alert.alert_id)

        assert result is True
        assert alert.resolved is True
        assert len(manager.active_alerts) == 0

    def test_resolve_nonexistent(self):
        """Test resolving nonexistent alert."""
        manager = AlertManager()
        result = manager.resolve("nonexistent")
        assert result is False

    def test_resolve_all(self):
        """Test resolving all alerts."""
        manager = AlertManager()
        manager.fire("a", AlertSeverity.INFO, "A")
        manager.fire("b", AlertSeverity.WARNING, "B")

        count = manager.resolve_all()

        assert count == 2
        assert len(manager.active_alerts) == 0

    def test_get_active_alerts(self):
        """Test getting active alerts."""
        manager = AlertManager()
        manager.fire("active", AlertSeverity.INFO, "Active")
        alert = manager.fire("to_resolve", AlertSeverity.INFO, "To resolve")
        manager.resolve(alert.alert_id)

        active = manager.get_active_alerts()
        assert len(active) == 1
        assert active[0].name == "active"

    def test_get_alerts_filtered(self):
        """Test getting alerts with filter."""
        manager = AlertManager()
        manager.fire("a", AlertSeverity.ERROR, "A")
        manager.fire("b", AlertSeverity.WARNING, "B")
        manager.fire("c", AlertSeverity.ERROR, "C")

        errors = manager.get_alerts(severity=AlertSeverity.ERROR)
        assert len(errors) == 2

    def test_alert_handlers(self):
        """Test alert handlers."""
        manager = AlertManager()
        received = []

        def handler(alert):
            received.append(alert)

        manager.add_handler(handler)
        manager.fire("test", AlertSeverity.INFO, "Test")

        assert len(received) == 1
        assert received[0].name == "test"

    def test_get_stats(self):
        """Test getting alert statistics."""
        manager = AlertManager()
        manager.fire("a", AlertSeverity.ERROR, "A")
        manager.fire("b", AlertSeverity.WARNING, "B")

        stats = manager.get_stats()

        assert stats["total_alerts"] == 2
        assert stats["active_alerts"] == 2


class TestMonitoringManager:
    """Tests for MonitoringManager class."""

    @pytest.fixture
    def manager(self):
        """Create a monitoring manager."""
        return MonitoringManager()

    def test_create_manager(self, manager):
        """Test creating a monitoring manager."""
        assert manager.collector is not None
        assert manager.health_checker is not None
        assert manager.alert_manager is not None

    def test_record_metric(self, manager):
        """Test recording a metric."""
        metric = manager.record_metric("test", 42.0)

        assert metric.value == 42.0

    def test_increment_counter(self, manager):
        """Test incrementing a counter."""
        manager.increment_counter("requests")
        manager.increment_counter("requests")

        assert manager.get_counter("requests") == 2.0

    def test_record_timing(self, manager):
        """Test recording timing."""
        manager.record_timing("api", 15.5)

        stats = manager.get_metric_stats("api_ms")
        assert stats is not None
        assert stats.mean == 15.5

    def test_set_gauge(self, manager):
        """Test setting gauge."""
        manager.set_gauge("memory", 1024)

        assert manager.get_gauge("memory") == 1024

    def test_register_health_check(self, manager):
        """Test registering health check."""
        def my_check():
            return HealthCheckResult(
                name="custom",
                status=HealthStatus.HEALTHY,
                message="OK",
                timestamp=datetime.now()
            )

        manager.register_health_check("custom", my_check)
        results = manager.run_health_check("custom")

        assert "custom" in results

    def test_run_all_health_checks(self, manager):
        """Test running all health checks."""
        results = manager.run_health_check()

        # Should include default checks
        assert len(results) >= 2

    def test_get_overall_health(self, manager):
        """Test getting overall health."""
        manager.run_health_check()
        status = manager.get_overall_health()

        assert status in [HealthStatus.HEALTHY, HealthStatus.DEGRADED, HealthStatus.UNHEALTHY]

    def test_fire_alert(self, manager):
        """Test firing an alert."""
        alert = manager.fire_alert("test", AlertSeverity.WARNING, "Test alert")

        assert alert.name == "test"
        assert len(manager.get_active_alerts()) == 1

    def test_resolve_alert(self, manager):
        """Test resolving an alert."""
        alert = manager.fire_alert("test", AlertSeverity.INFO, "Test")
        result = manager.resolve_alert(alert.alert_id)

        assert result is True

    def test_export_prometheus(self, manager):
        """Test Prometheus export."""
        manager.record_metric("cpu", 50.0)
        manager.record_metric("memory", 1024.0)

        output = manager.export_prometheus()

        assert "cpu" in output
        assert "memory" in output
        assert "# TYPE" in output
        assert "# HELP" in output

    def test_export_json(self, manager):
        """Test JSON export."""
        manager.record_metric("test", 1.0)
        manager.run_health_check()

        data = manager.export_json()

        assert "timestamp" in data
        assert "metrics" in data
        assert "health" in data
        assert "alerts" in data

    def test_save_metrics(self):
        """Test saving metrics to file."""
        with tempfile.TemporaryDirectory() as d:
            path = Path(d) / "metrics.json"
            manager = MonitoringManager(metrics_path=str(path))

            manager.record_metric("test", 42.0)
            manager.save_metrics()

            assert path.exists()

            with open(path) as f:
                data = json.load(f)

            assert "metrics" in data

    def test_get_dashboard_data(self, manager):
        """Test getting dashboard data."""
        manager.record_metric("test", 1.0)
        manager.run_health_check()

        data = manager.get_dashboard_data()

        assert "uptime" in data
        assert "overall_health" in data
        assert "health_checks" in data


class TestTimer:
    """Tests for Timer context manager."""

    def test_timer(self):
        """Test timing context manager."""
        manager = MonitoringManager()

        with Timer(manager, "operation"):
            time.sleep(0.01)  # 10ms

        stats = manager.get_metric_stats("operation_ms")
        assert stats is not None
        assert stats.min_value >= 10  # At least 10ms


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_create_monitor(self):
        """Test create_monitor function."""
        with tempfile.TemporaryDirectory() as d:
            os.chdir(d)
            manager = create_monitor("test")

            assert manager.metrics_path is not None


class TestIntegration:
    """Integration tests for the monitoring system."""

    def test_full_workflow(self):
        """Test complete monitoring workflow."""
        with tempfile.TemporaryDirectory() as d:
            metrics_path = Path(d) / "metrics.json"
            manager = MonitoringManager(metrics_path=str(metrics_path))

            # Record various metrics
            for i in range(10):
                manager.record_metric("latency_ms", 10 + i)
                manager.increment_counter("requests")
            manager.set_gauge("connections", 5)

            # Register custom health check
            def db_check():
                return HealthCheckResult(
                    name="database",
                    status=HealthStatus.HEALTHY,
                    message="Database connected",
                    timestamp=datetime.now()
                )
            manager.register_health_check("database", db_check)

            # Run health checks
            health = manager.run_health_check()

            # Fire alert
            manager.fire_alert("high_latency", AlertSeverity.WARNING, "P99 > 100ms")

            # Get statistics
            stats = manager.get_metric_stats("latency_ms")
            assert stats.count == 10

            # Save
            manager.save_metrics()

            # Verify export
            prometheus = manager.export_prometheus()
            assert "latency_ms" in prometheus

            json_export = manager.export_json()
            assert json_export["alerts"]["active_alerts"] == 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
