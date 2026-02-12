#!/usr/bin/env python3
"""
Infinite Map Monitoring and Metrics System.

Provides comprehensive monitoring, metrics collection, and
alerting for the Infinite Map filesystem.

Key Components:
- Metric: Individual metric measurement
- MetricCollector: Collects and aggregates metrics
- HealthChecker: Performs health checks
- AlertManager: Manages alerts and notifications
- MonitoringManager: Unified monitoring interface

Usage:
    from infinite_map_monitoring import MonitoringManager

    manager = MonitoringManager(metrics_path="metrics.json")

    # Record metrics
    manager.record_metric("read_latency_ms", 5.2)

    # Get statistics
    stats = manager.get_metric_stats("read_latency_ms")

    # Health check
    health = manager.run_health_check()

    # Export metrics
    manager.export_prometheus("/metrics")
"""

import os
import json
import time
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple, Callable
from datetime import datetime, timedelta
from enum import Enum
from collections import defaultdict
import logging
import statistics

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class MetricType(Enum):
    """Type of metric."""
    COUNTER = "counter"      # Monotonically increasing
    GAUGE = "gauge"          # Can go up or down
    HISTOGRAM = "histogram"  # Distribution of values
    SUMMARY = "summary"      # Similar to histogram


class HealthStatus(Enum):
    """Health check status."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    UNHEALTHY = "unhealthy"
    UNKNOWN = "unknown"


class AlertSeverity(Enum):
    """Alert severity levels."""
    INFO = "info"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


@dataclass
class Metric:
    """Single metric measurement."""
    name: str
    value: float
    metric_type: MetricType
    timestamp: datetime
    labels: Dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "value": self.value,
            "type": self.metric_type.value,
            "timestamp": self.timestamp.isoformat(),
            "labels": self.labels
        }


@dataclass
class MetricStats:
    """Statistics for a metric."""
    name: str
    count: int
    sum_value: float
    min_value: float
    max_value: float
    mean: float
    median: float
    std_dev: float
    p50: float
    p95: float
    p99: float

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "count": self.count,
            "sum": self.sum_value,
            "min": self.min_value,
            "max": self.max_value,
            "mean": self.mean,
            "median": self.median,
            "std_dev": self.std_dev,
            "p50": self.p50,
            "p95": self.p95,
            "p99": self.p99
        }


@dataclass
class HealthCheckResult:
    """Result of a health check."""
    name: str
    status: HealthStatus
    message: str
    timestamp: datetime
    details: Dict[str, Any] = field(default_factory=dict)
    duration_ms: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "status": self.status.value,
            "message": self.message,
            "timestamp": self.timestamp.isoformat(),
            "details": self.details,
            "duration_ms": self.duration_ms
        }


@dataclass
class Alert:
    """Alert definition."""
    alert_id: str
    name: str
    severity: AlertSeverity
    message: str
    timestamp: datetime
    resolved: bool = False
    resolved_at: Optional[datetime] = None
    labels: Dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "alert_id": self.alert_id,
            "name": self.name,
            "severity": self.severity.value,
            "message": self.message,
            "timestamp": self.timestamp.isoformat(),
            "resolved": self.resolved,
            "resolved_at": self.resolved_at.isoformat() if self.resolved_at else None,
            "labels": self.labels
        }


class MetricCollector:
    """
    Collects and aggregates metrics.

    Supports counters, gauges, histograms, and summaries.
    """

    def __init__(self, max_history: int = 10000):
        self.max_history = max_history
        self.metrics: Dict[str, List[Metric]] = defaultdict(list)
        self.counters: Dict[str, float] = defaultdict(float)
        self.gauges: Dict[str, float] = {}
        self.lock = threading.RLock()

    def record(
        self,
        name: str,
        value: float,
        metric_type: MetricType = MetricType.GAUGE,
        labels: Optional[Dict[str, str]] = None
    ) -> Metric:
        """Record a metric value."""
        with self.lock:
            timestamp = datetime.now()
            labels = labels or {}

            metric = Metric(
                name=name,
                value=value,
                metric_type=metric_type,
                timestamp=timestamp,
                labels=labels
            )

            # Handle different metric types
            if metric_type == MetricType.COUNTER:
                self.counters[name] += value
                metric.value = self.counters[name]
            elif metric_type == MetricType.GAUGE:
                self.gauges[name] = value

            # Store in history
            self.metrics[name].append(metric)

            # Trim history if needed
            if len(self.metrics[name]) > self.max_history:
                self.metrics[name] = self.metrics[name][-self.max_history:]

            return metric

    def increment(self, name: str, value: float = 1.0, labels: Optional[Dict[str, str]] = None) -> Metric:
        """Increment a counter metric."""
        return self.record(name, value, MetricType.COUNTER, labels)

    def gauge(self, name: str, value: float, labels: Optional[Dict[str, str]] = None) -> Metric:
        """Set a gauge metric."""
        return self.record(name, value, MetricType.GAUGE, labels)

    def timing(self, name: str, duration_ms: float, labels: Optional[Dict[str, str]] = None) -> Metric:
        """Record a timing metric."""
        return self.record(f"{name}_ms", duration_ms, MetricType.HISTOGRAM, labels)

    def get_counter(self, name: str) -> float:
        """Get current counter value."""
        with self.lock:
            return self.counters.get(name, 0.0)

    def get_gauge(self, name: str) -> Optional[float]:
        """Get current gauge value."""
        with self.lock:
            return self.gauges.get(name)

    def get_metrics(self, name: str) -> List[Metric]:
        """Get all recorded values for a metric."""
        with self.lock:
            return list(self.metrics.get(name, []))

    def get_stats(self, name: str) -> Optional[MetricStats]:
        """Calculate statistics for a metric."""
        with self.lock:
            metrics = self.metrics.get(name, [])
            if not metrics:
                return None

            values = [m.value for m in metrics]
            sorted_values = sorted(values)

            count = len(values)
            sum_val = sum(values)
            min_val = min(values)
            max_val = max(values)
            mean_val = statistics.mean(values)
            median_val = statistics.median(values)

            std_dev = statistics.stdev(values) if count > 1 else 0.0

            # Percentiles
            p50 = self._percentile(sorted_values, 50)
            p95 = self._percentile(sorted_values, 95)
            p99 = self._percentile(sorted_values, 99)

            return MetricStats(
                name=name,
                count=count,
                sum_value=sum_val,
                min_value=min_val,
                max_value=max_val,
                mean=mean_val,
                median=median_val,
                std_dev=std_dev,
                p50=p50,
                p95=p95,
                p99=p99
            )

    def _percentile(self, sorted_values: List[float], percentile: float) -> float:
        """Calculate percentile from sorted values."""
        if not sorted_values:
            return 0.0

        k = (len(sorted_values) - 1) * percentile / 100
        f = int(k)
        c = f + 1 if f + 1 < len(sorted_values) else f

        return sorted_values[f] + (k - f) * (sorted_values[c] - sorted_values[f])

    def get_all_metrics(self) -> Dict[str, List[Metric]]:
        """Get all recorded metrics."""
        with self.lock:
            return {k: list(v) for k, v in self.metrics.items()}

    def clear(self, name: Optional[str] = None):
        """Clear metrics."""
        with self.lock:
            if name:
                self.metrics.pop(name, None)
                self.counters.pop(name, None)
                self.gauges.pop(name, None)
            else:
                self.metrics.clear()
                self.counters.clear()
                self.gauges.clear()


class HealthChecker:
    """
    Performs health checks on system components.
    """

    def __init__(self):
        self.checks: Dict[str, Callable[[], HealthCheckResult]] = {}
        self.results: Dict[str, HealthCheckResult] = {}
        self.lock = threading.RLock()

    def register_check(self, name: str, check_func: Callable[[], HealthCheckResult]):
        """Register a health check function."""
        with self.lock:
            self.checks[name] = check_func

    def unregister_check(self, name: str):
        """Unregister a health check."""
        with self.lock:
            self.checks.pop(name, None)
            self.results.pop(name, None)

    def run_check(self, name: str) -> Optional[HealthCheckResult]:
        """Run a single health check."""
        with self.lock:
            check_func = self.checks.get(name)
            if not check_func:
                return None

        start_time = time.perf_counter()
        try:
            result = check_func()
            result.duration_ms = (time.perf_counter() - start_time) * 1000
        except Exception as e:
            result = HealthCheckResult(
                name=name,
                status=HealthStatus.UNHEALTHY,
                message=f"Health check failed: {str(e)}",
                timestamp=datetime.now(),
                duration_ms=(time.perf_counter() - start_time) * 1000
            )

        with self.lock:
            self.results[name] = result

        return result

    def run_all_checks(self) -> Dict[str, HealthCheckResult]:
        """Run all registered health checks."""
        results = {}
        for name in list(self.checks.keys()):
            result = self.run_check(name)
            if result:
                results[name] = result
        return results

    def get_overall_status(self) -> HealthStatus:
        """Get overall system health status."""
        with self.lock:
            if not self.results:
                return HealthStatus.UNKNOWN

            statuses = [r.status for r in self.results.values()]

            if HealthStatus.UNHEALTHY in statuses:
                return HealthStatus.UNHEALTHY
            elif HealthStatus.DEGRADED in statuses:
                return HealthStatus.DEGRADED
            elif all(s == HealthStatus.HEALTHY for s in statuses):
                return HealthStatus.HEALTHY
            else:
                return HealthStatus.UNKNOWN

    def get_result(self, name: str) -> Optional[HealthCheckResult]:
        """Get last result for a check."""
        with self.lock:
            return self.results.get(name)


class AlertManager:
    """
    Manages alerts and notifications.
    """

    def __init__(self, max_alerts: int = 1000):
        self.max_alerts = max_alerts
        self.alerts: List[Alert] = []
        self.active_alerts: Dict[str, Alert] = {}
        self.alert_handlers: List[Callable[[Alert], None]] = []
        self.lock = threading.RLock()
        self._alert_counter = 0

    def fire(
        self,
        name: str,
        severity: AlertSeverity,
        message: str,
        labels: Optional[Dict[str, str]] = None
    ) -> Alert:
        """Fire a new alert."""
        with self.lock:
            self._alert_counter += 1
            alert_id = f"alert_{self._alert_counter:06d}"

            alert = Alert(
                alert_id=alert_id,
                name=name,
                severity=severity,
                message=message,
                timestamp=datetime.now(),
                labels=labels or {}
            )

            self.alerts.append(alert)
            self.active_alerts[alert_id] = alert

            # Trim if needed
            if len(self.alerts) > self.max_alerts:
                self.alerts = self.alerts[-self.max_alerts:]

            # Notify handlers
            for handler in self.alert_handlers:
                try:
                    handler(alert)
                except Exception as e:
                    logger.error(f"Alert handler failed: {e}")

            logger.warning(f"Alert fired: [{severity.value}] {name}: {message}")
            return alert

    def resolve(self, alert_id: str) -> bool:
        """Resolve an alert."""
        with self.lock:
            if alert_id not in self.active_alerts:
                return False

            alert = self.active_alerts[alert_id]
            alert.resolved = True
            alert.resolved_at = datetime.now()
            del self.active_alerts[alert_id]

            logger.info(f"Alert resolved: {alert_id}")
            return True

    def resolve_all(self, name: Optional[str] = None) -> int:
        """Resolve all alerts (optionally by name)."""
        with self.lock:
            count = 0
            to_resolve = []

            for alert_id, alert in self.active_alerts.items():
                if name is None or alert.name == name:
                    to_resolve.append(alert_id)

            for alert_id in to_resolve:
                if self.resolve(alert_id):
                    count += 1

            return count

    def add_handler(self, handler: Callable[[Alert], None]):
        """Add an alert handler."""
        with self.lock:
            self.alert_handlers.append(handler)

    def get_active_alerts(self) -> List[Alert]:
        """Get all active alerts."""
        with self.lock:
            return list(self.active_alerts.values())

    def get_alerts(
        self,
        severity: Optional[AlertSeverity] = None,
        resolved: Optional[bool] = None,
        limit: int = 100
    ) -> List[Alert]:
        """Get alerts with optional filtering."""
        with self.lock:
            alerts = list(self.alerts)

            if severity:
                alerts = [a for a in alerts if a.severity == severity]
            if resolved is not None:
                alerts = [a for a in alerts if a.resolved == resolved]

            return alerts[-limit:]

    def get_stats(self) -> Dict[str, Any]:
        """Get alert statistics."""
        with self.lock:
            active_by_severity = defaultdict(int)
            for alert in self.active_alerts.values():
                active_by_severity[alert.severity.value] += 1

            return {
                "total_alerts": len(self.alerts),
                "active_alerts": len(self.active_alerts),
                "active_by_severity": dict(active_by_severity)
            }


class MonitoringManager:
    """
    Unified monitoring management interface.

    Coordinates metrics collection, health checks, and alerts.
    """

    def __init__(self, metrics_path: Optional[str] = None):
        self.collector = MetricCollector()
        self.health_checker = HealthChecker()
        self.alert_manager = AlertManager()
        self.metrics_path = Path(metrics_path) if metrics_path else None
        self.lock = threading.RLock()
        self._start_time = datetime.now()

        # Register default health checks
        self._register_default_checks()

    def _register_default_checks(self):
        """Register default system health checks."""
        self.health_checker.register_check(
            "metrics_collector",
            self._check_metrics_collector
        )
        self.health_checker.register_check(
            "alert_manager",
            self._check_alert_manager
        )

    def _check_metrics_collector(self) -> HealthCheckResult:
        """Check metrics collector health."""
        try:
            stats = self.collector.get_stats("dummy_health_check")
            return HealthCheckResult(
                name="metrics_collector",
                status=HealthStatus.HEALTHY,
                message="Metrics collector is operational",
                timestamp=datetime.now(),
                details={"total_metrics": len(self.collector.metrics)}
            )
        except Exception as e:
            return HealthCheckResult(
                name="metrics_collector",
                status=HealthStatus.UNHEALTHY,
                message=f"Metrics collector error: {e}",
                timestamp=datetime.now()
            )

    def _check_alert_manager(self) -> HealthCheckResult:
        """Check alert manager health."""
        try:
            stats = self.alert_manager.get_stats()
            active = stats["active_alerts"]

            status = HealthStatus.HEALTHY
            if active > 10:
                status = HealthStatus.DEGRADED
            if active > 50:
                status = HealthStatus.UNHEALTHY

            return HealthCheckResult(
                name="alert_manager",
                status=status,
                message=f"Alert manager operational, {active} active alerts",
                timestamp=datetime.now(),
                details=stats
            )
        except Exception as e:
            return HealthCheckResult(
                name="alert_manager",
                status=HealthStatus.UNHEALTHY,
                message=f"Alert manager error: {e}",
                timestamp=datetime.now()
            )

    # Metric recording methods

    def record_metric(
        self,
        name: str,
        value: float,
        metric_type: MetricType = MetricType.GAUGE,
        labels: Optional[Dict[str, str]] = None
    ) -> Metric:
        """Record a metric value."""
        return self.collector.record(name, value, metric_type, labels)

    def increment_counter(self, name: str, labels: Optional[Dict[str, str]] = None):
        """Increment a counter."""
        self.collector.increment(name, 1.0, labels)

    def record_timing(self, name: str, duration_ms: float, labels: Optional[Dict[str, str]] = None):
        """Record a timing metric."""
        self.collector.timing(name, duration_ms, labels)

    def set_gauge(self, name: str, value: float, labels: Optional[Dict[str, str]] = None):
        """Set a gauge value."""
        self.collector.gauge(name, value, labels)

    # Stats methods

    def get_metric_stats(self, name: str) -> Optional[MetricStats]:
        """Get statistics for a metric."""
        return self.collector.get_stats(name)

    def get_counter(self, name: str) -> float:
        """Get counter value."""
        return self.collector.get_counter(name)

    def get_gauge(self, name: str) -> Optional[float]:
        """Get gauge value."""
        return self.collector.get_gauge(name)

    # Health check methods

    def register_health_check(self, name: str, check_func: Callable[[], HealthCheckResult]):
        """Register a health check."""
        self.health_checker.register_check(name, check_func)

    def run_health_check(self, name: Optional[str] = None) -> Dict[str, HealthCheckResult]:
        """Run health checks."""
        if name:
            result = self.health_checker.run_check(name)
            return {name: result} if result else {}
        return self.health_checker.run_all_checks()

    def get_overall_health(self) -> HealthStatus:
        """Get overall system health."""
        return self.health_checker.get_overall_status()

    # Alert methods

    def fire_alert(
        self,
        name: str,
        severity: AlertSeverity,
        message: str,
        labels: Optional[Dict[str, str]] = None
    ) -> Alert:
        """Fire an alert."""
        return self.alert_manager.fire(name, severity, message, labels)

    def resolve_alert(self, alert_id: str) -> bool:
        """Resolve an alert."""
        return self.alert_manager.resolve(alert_id)

    def get_active_alerts(self) -> List[Alert]:
        """Get active alerts."""
        return self.alert_manager.get_active_alerts()

    # Export methods

    def export_prometheus(self) -> str:
        """Export metrics in Prometheus format."""
        lines = []

        for name, metrics in self.collector.metrics.items():
            if not metrics:
                continue

            latest = metrics[-1]
            metric_type = latest.metric_type.value

            # Add help and type
            lines.append(f"# HELP {name} Metric {name}")
            lines.append(f"# TYPE {name} {metric_type}")

            # Add metric value with labels
            labels_str = ""
            if latest.labels:
                labels_str = "{" + ",".join(f'{k}="{v}"' for k, v in latest.labels.items()) + "}"

            lines.append(f"{name}{labels_str} {latest.value}")

        return "\n".join(lines)

    def export_json(self) -> Dict[str, Any]:
        """Export metrics as JSON."""
        return {
            "timestamp": datetime.now().isoformat(),
            "uptime_seconds": (datetime.now() - self._start_time).total_seconds(),
            "metrics": {
                name: self.collector.get_stats(name).to_dict() if self.collector.get_stats(name) else None
                for name in self.collector.metrics.keys()
            },
            "health": {
                "overall": self.get_overall_health().value,
                "checks": {
                    name: result.to_dict()
                    for name, result in self.health_checker.results.items()
                }
            },
            "alerts": self.alert_manager.get_stats()
        }

    def save_metrics(self):
        """Save metrics to disk."""
        if not self.metrics_path:
            return

        with self.lock:
            data = self.export_json()
            temp_path = self.metrics_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.metrics_path)

    def get_dashboard_data(self) -> Dict[str, Any]:
        """Get data for monitoring dashboard."""
        return {
            "uptime": str(datetime.now() - self._start_time),
            "overall_health": self.get_overall_health().value,
            "total_metrics": len(self.collector.metrics),
            "total_counters": len(self.collector.counters),
            "total_gauges": len(self.collector.gauges),
            "active_alerts": len(self.alert_manager.active_alerts),
            "health_checks": {
                name: {
                    "status": result.status.value,
                    "message": result.message,
                    "duration_ms": result.duration_ms
                }
                for name, result in self.health_checker.results.items()
            },
            "alert_summary": self.alert_manager.get_stats()
        }


# Convenience functions

def create_monitor(name: str) -> MonitoringManager:
    """Create a monitoring manager with file persistence."""
    return MonitoringManager(metrics_path=f"{name}_metrics.json")


class Timer:
    """Context manager for timing operations."""

    def __init__(self, manager: MonitoringManager, name: str, labels: Optional[Dict[str, str]] = None):
        self.manager = manager
        self.name = name
        self.labels = labels
        self.start_time = None

    def __enter__(self):
        self.start_time = time.perf_counter()
        return self

    def __exit__(self, *args):
        duration_ms = (time.perf_counter() - self.start_time) * 1000
        self.manager.record_timing(self.name, duration_ms, self.labels)
