"""
Feedback System Integration Module

Provides a unified interface for the complete feedback system:
- One-stop initialization
- Configuration management
- Dashboard generation
- Sprint monitoring
"""

import json
import time
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from pathlib import Path
from typing import Optional, Any, Callable
import logging

logger = logging.getLogger(__name__)


@dataclass
class FeedbackSystemConfig:
    """Configuration for the feedback system."""

    # Storage
    storage_path: Path = field(default_factory=lambda: Path.home() / ".geometry_os" / "feedback")

    # Collector settings
    auto_persist: bool = True
    max_in_memory_entries: int = 1000

    # Tracker settings
    track_positions: bool = True
    idle_timeout_seconds: float = 30.0
    event_batch_size: int = 100

    # Analyzer settings
    analysis_window_hours: int = 168  # 1 week
    min_sample_size: int = 5

    # Bridge settings
    enable_alerts: bool = True
    enable_auto_adjustments: bool = True

    # Metric thresholds
    rating_low_threshold: float = 3.0
    rating_high_threshold: float = 4.5
    error_rate_high_threshold: float = 0.05
    nps_low_threshold: float = 0
    sus_low_threshold: float = 52.0

    def to_dict(self) -> dict:
        return {
            "storage_path": str(self.storage_path),
            "auto_persist": self.auto_persist,
            "max_in_memory_entries": self.max_in_memory_entries,
            "track_positions": self.track_positions,
            "idle_timeout_seconds": self.idle_timeout_seconds,
            "event_batch_size": self.event_batch_size,
            "analysis_window_hours": self.analysis_window_hours,
            "min_sample_size": self.min_sample_size,
            "enable_alerts": self.enable_alerts,
            "enable_auto_adjustments": self.enable_auto_adjustments,
            "rating_low_threshold": self.rating_low_threshold,
            "rating_high_threshold": self.rating_high_threshold,
            "error_rate_high_threshold": self.error_rate_high_threshold,
            "nps_low_threshold": self.nps_low_threshold,
            "sus_low_threshold": self.sus_low_threshold,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "FeedbackSystemConfig":
        if "storage_path" in data:
            data["storage_path"] = Path(data["storage_path"])
        return cls(**data)


class FeedbackSystem:
    """
    Unified feedback system interface.

    Provides:
    - Complete system initialization
    - Configuration management
    - Dashboard data generation
    - Sprint monitoring and reporting
    """

    def __init__(
        self,
        config: Optional[FeedbackSystemConfig] = None,
        daemon_interface: Optional[Any] = None,
        alert_handlers: Optional[list[Callable]] = None,
    ):
        self.config = config or FeedbackSystemConfig()
        self.config.storage_path.mkdir(parents=True, exist_ok=True)

        self._daemon_interface = daemon_interface
        self._alert_handlers = alert_handlers or []
        self._initialized = False

        # Components (initialized lazily)
        self._collector = None
        self._tracker = None
        self._analyzer = None
        self._metrics = None
        self._bridge = None

        # Sprint tracking
        self._sprint_start: Optional[datetime] = None
        self._sprint_name: Optional[str] = None

    def initialize(self):
        """Initialize all feedback system components."""
        if self._initialized:
            return

        from systems.feedback.collector import FeedbackCollector
        from systems.feedback.tracker import InteractionTracker
        from systems.feedback.analyzer import InsightAnalyzer
        from systems.feedback.metrics import UsabilityMetrics
        from systems.feedback.bridge import FeedbackBridge, FeedbackHook

        # Initialize collector
        self._collector = FeedbackCollector(
            storage_path=self.config.storage_path / "collector",
            max_in_memory=self.config.max_in_memory_entries,
            auto_persist=self.config.auto_persist,
        )

        # Initialize tracker
        self._tracker = InteractionTracker(
            storage_path=self.config.storage_path / "tracker",
            track_positions=self.config.track_positions,
            idle_timeout_seconds=self.config.idle_timeout_seconds,
            auto_persist=self.config.auto_persist,
        )

        # Initialize analyzer
        self._analyzer = InsightAnalyzer(
            storage_path=self.config.storage_path / "analyzer",
            analysis_window_hours=self.config.analysis_window_hours,
            min_sample_size=self.config.min_sample_size,
        )

        # Initialize metrics
        self._metrics = UsabilityMetrics(
            storage_path=self.config.storage_path / "metrics",
        )

        # Initialize bridge
        self._bridge = FeedbackBridge(
            storage_path=self.config.storage_path / "bridge",
            daemon_interface=self._daemon_interface,
            alert_handlers=self._alert_handlers,
        )

        # Configure bridge thresholds
        self._bridge.set_threshold(
            "rating",
            self.config.rating_low_threshold,
            self.config.rating_high_threshold,
        )
        self._bridge.set_threshold(
            "error_rate",
            self.config.error_rate_high_threshold,
            0.01,
        )
        self._bridge.set_threshold(
            "nps",
            self.config.nps_low_threshold,
            50.0,
        )
        self._bridge.set_threshold(
            "sus",
            self.config.sus_low_threshold,
            85.0,
        )

        # Connect components
        self._collector.register_callback(self._bridge.process_feedback_entry)

        # Start bridge worker
        self._bridge.start()

        # Register bridge hooks for insights
        self._bridge.register_hook(
            FeedbackHook.ON_INSIGHT_GENERATED,
            self._handle_insight,
        )

        self._initialized = True
        logger.info("Feedback system initialized")

    def _handle_insight(self, action):
        """Handle an insight being generated."""
        # Could trigger additional processing or notifications
        pass

    # --- Accessors ---

    @property
    def collector(self):
        if not self._initialized:
            self.initialize()
        return self._collector

    @property
    def tracker(self):
        if not self._initialized:
            self.initialize()
        return self._tracker

    @property
    def analyzer(self):
        if not self._initialized:
            self.initialize()
        return self._analyzer

    @property
    def metrics(self):
        if not self._initialized:
            self.initialize()
        return self._metrics

    @property
    def bridge(self):
        if not self._initialized:
            self.initialize()
        return self._bridge

    # --- Convenience Methods ---

    def submit_rating(
        self,
        rating: int,
        component: Optional[str] = None,
        comment: Optional[str] = None,
    ):
        """Submit a rating through the collector."""
        return self.collector.submit_rating(rating, component, comment)

    def submit_comment(
        self,
        text: str,
        component: Optional[str] = None,
    ):
        """Submit a comment through the collector."""
        return self.collector.submit_comment(text, component)

    def submit_bug_report(
        self,
        description: str,
        component: Optional[str] = None,
        severity: str = "medium",
    ):
        """Submit a bug report."""
        from systems.feedback.collector import FeedbackSeverity
        severity_enum = FeedbackSeverity(severity)
        return self.collector.submit_bug_report(
            description=description,
            component=component,
            severity=severity_enum,
        )

    def track_event(self, *args, **kwargs):
        """Track an interaction event."""
        return self.tracker.track_event(*args, **kwargs)

    # --- Sprint Monitoring ---

    def start_sprint(self, name: str):
        """Start tracking a sprint."""
        self._sprint_start = datetime.utcnow()
        self._sprint_name = name
        logger.info(f"Started sprint: {name}")

    def end_sprint(self) -> dict:
        """End the current sprint and generate a report."""
        if not self._sprint_start:
            return {"error": "No sprint in progress"}

        sprint_end = datetime.utcnow()

        # Get all data for the sprint period
        feedback_entries = self.collector.get_entries(since=self._sprint_start, limit=10000)
        interaction_events = self.tracker.get_events(since=self._sprint_start.timestamp(), limit=10000)

        # Generate insights
        insights = self.analyzer.generate_insights(feedback_entries, interaction_events)

        # Compute metrics
        snapshot = self.metrics.compute_all_metrics(
            feedback_entries,
            interaction_events,
            time_window_hours=(sprint_end - self._sprint_start).total_seconds() / 3600,
        )

        report = {
            "sprint_name": self._sprint_name,
            "sprint_start": self._sprint_start.isoformat(),
            "sprint_end": sprint_end.isoformat(),
            "duration_hours": (sprint_end - self._sprint_start).total_seconds() / 3600,
            "feedback_summary": self.collector.get_stats(),
            "interaction_summary": self.tracker.get_session_stats(),
            "insights": [i.to_dict() for i in insights],
            "metrics": snapshot.to_dict(),
            "bridge_stats": self.bridge.get_stats(),
        }

        # Save report
        report_path = self.config.storage_path / f"sprint_report_{self._sprint_name}_{int(time.time())}.json"
        with open(report_path, "w") as f:
            json.dump(report, f, indent=2)

        logger.info(f"Sprint report saved to {report_path}")

        # Reset sprint tracking
        self._sprint_start = None
        self._sprint_name = None

        return report

    def get_sprint_status(self) -> dict:
        """Get current sprint status."""
        if not self._sprint_start:
            return {"sprint_active": False}

        now = datetime.utcnow()
        duration = now - self._sprint_start

        # Get recent data
        recent_feedback = self.collector.get_entries(since=self._sprint_start, limit=1000)
        recent_events = self.tracker.get_events(since=self._sprint_start.timestamp(), limit=1000)

        return {
            "sprint_active": True,
            "sprint_name": self._sprint_name,
            "sprint_start": self._sprint_start.isoformat(),
            "duration_hours": duration.total_seconds() / 3600,
            "feedback_count": len(recent_feedback),
            "event_count": len(recent_events),
            "unresolved_issues": self.collector.get_unresolved_count(),
        }

    # --- Dashboard ---

    def get_dashboard_data(self) -> dict:
        """Get data formatted for a feedback dashboard."""
        now = datetime.utcnow()
        day_ago = now - timedelta(hours=24)
        week_ago = now - timedelta(days=7)

        feedback_entries = self.collector.get_entries(since=week_ago, limit=10000)
        interaction_events = self.tracker.get_events(since=week_ago.timestamp(), limit=10000)

        # Generate fresh insights
        insights = self.analyzer.generate_insights(feedback_entries, interaction_events)

        # Get metrics
        metrics_snapshot = self.metrics.compute_all_metrics(
            feedback_entries,
            interaction_events,
            time_window_hours=168,
        )

        return {
            "generated_at": now.isoformat(),
            "sprint": self.get_sprint_status(),
            "overview": {
                "total_feedback": len(feedback_entries),
                "total_events": len(interaction_events),
                "unresolved_issues": self.collector.get_unresolved_count(),
                "active_insights": len(insights),
            },
            "feedback_stats": self.collector.get_stats(),
            "interaction_stats": self.tracker.get_session_stats(),
            "sentiment": self.analyzer.analyze_feedback_sentiment(feedback_entries),
            "metrics": metrics_snapshot.metrics,
            "insights": [i.to_dict() for i in insights[:10]],  # Top 10 insights
            "bridge_stats": self.bridge.get_stats(),
            "recent_feedback": [e.to_dict() for e in feedback_entries[-10:]],
            "component_usage": self.tracker.get_component_usage(since=week_ago.timestamp()),
        }

    def export_dashboard(self, output_path: Optional[Path] = None) -> Path:
        """Export dashboard data to a file."""
        output_path = output_path or (
            self.config.storage_path / f"dashboard_{int(time.time())}.json"
        )

        data = self.get_dashboard_data()
        with open(output_path, "w") as f:
            json.dump(data, f, indent=2)

        return output_path

    # --- Cleanup ---

    def shutdown(self):
        """Shutdown the feedback system gracefully."""
        if self._bridge:
            self._bridge.stop()

        if self._sprint_start:
            self.end_sprint()

        logger.info("Feedback system shutdown complete")

    def __enter__(self):
        self.initialize()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.shutdown()
        return False


# --- Quick Setup Function ---

def create_feedback_system(
    daemon_interface: Optional[Any] = None,
    alert_handler: Optional[Callable] = None,
    config_path: Optional[Path] = None,
) -> FeedbackSystem:
    """
    Create and initialize a feedback system.

    Args:
        daemon_interface: Optional daemon interface for integration
        alert_handler: Optional callback for alerts
        config_path: Optional path to load configuration from

    Returns:
        Initialized FeedbackSystem
    """
    config = None

    if config_path and config_path.exists():
        try:
            with open(config_path) as f:
                config = FeedbackSystemConfig.from_dict(json.load(f))
        except Exception as e:
            logger.warning(f"Failed to load config from {config_path}: {e}")

    alert_handlers = [alert_handler] if alert_handler else None

    system = FeedbackSystem(
        config=config,
        daemon_interface=daemon_interface,
        alert_handlers=alert_handlers,
    )

    system.initialize()
    return system
