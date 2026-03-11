"""
User Feedback System for Geometry OS

This module provides a comprehensive feedback mechanism to gather user input,
track interactions, analyze trends, and improve system usability.

Components:
- FeedbackCollector: Captures direct user feedback (ratings, comments, bug reports)
- InteractionTracker: Tracks user interaction events (clicks, navigation, timing)
- InsightAnalyzer: Analyzes interaction data for trends and insights
- UsabilityMetrics: Computes usability KPIs and trends
- FeedbackBridge: Integrates with Evolution Daemon for adaptive improvements
- FeedbackSystem: Unified interface for complete feedback management

Quick Start:
    from systems.feedback import FeedbackSystem

    # Create and initialize
    system = FeedbackSystem()
    system.initialize()

    # Collect feedback
    system.submit_rating(4, component="dashboard")
    system.submit_comment("Great interface!")

    # Track interactions
    system.track_event(EventType.CLICK, component="export_button")

    # Sprint monitoring
    system.start_sprint("Sprint 42")
    # ... collect feedback ...
    report = system.end_sprint()

    # Dashboard
    dashboard = system.get_dashboard_data()

    # Cleanup
    system.shutdown()

Integration with Evolution Daemon:
    from systems.feedback import create_daemon_feedback_integration

    collector, tracker, analyzer, metrics, bridge = create_daemon_feedback_integration(daemon)
"""

# Core components
from systems.feedback.collector import (
    FeedbackCollector,
    FeedbackEntry,
    FeedbackType,
    FeedbackSeverity,
    FeedbackContext,
)
from systems.feedback.tracker import (
    InteractionTracker,
    InteractionEvent,
    EventType,
)
from systems.feedback.analyzer import (
    InsightAnalyzer,
    TrendReport,
    Insight,
    InsightCategory,
    InsightPriority,
)
from systems.feedback.metrics import (
    UsabilityMetrics,
    MetricSnapshot,
)
from systems.feedback.bridge import (
    FeedbackBridge,
    FeedbackHook,
    FeedbackAction,
    create_daemon_feedback_integration,
)
from systems.feedback.integration import (
    FeedbackSystem,
    FeedbackSystemConfig,
    create_feedback_system,
)

__all__ = [
    # Collector
    "FeedbackCollector",
    "FeedbackEntry",
    "FeedbackType",
    "FeedbackSeverity",
    "FeedbackContext",
    # Tracker
    "InteractionTracker",
    "InteractionEvent",
    "EventType",
    # Analyzer
    "InsightAnalyzer",
    "TrendReport",
    "Insight",
    "InsightCategory",
    "InsightPriority",
    # Metrics
    "UsabilityMetrics",
    "MetricSnapshot",
    # Bridge
    "FeedbackBridge",
    "FeedbackHook",
    "FeedbackAction",
    "create_daemon_feedback_integration",
    # Integration
    "FeedbackSystem",
    "FeedbackSystemConfig",
    "create_feedback_system",
]

__version__ = "1.0.0"
