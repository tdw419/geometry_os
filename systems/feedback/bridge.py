"""
Feedback Bridge Module

Integrates feedback collection with the Evolution Daemon for real-time adjustments:
- Event-driven feedback processing
- Adaptive system tuning
- Visual feedback integration
- Alert system for critical issues
"""

import json
import time
import threading
import queue
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Optional, Callable, Any
from collections import defaultdict
import logging

logger = logging.getLogger(__name__)


class FeedbackHook(Enum):
    """Hooks for feedback-triggered actions."""

    ON_RATING_LOW = "on_rating_low"  # Rating < 3
    ON_RATING_HIGH = "on_rating_high"  # Rating >= 4
    ON_BUG_REPORT = "on_bug_report"
    ON_FEATURE_REQUEST = "on_feature_request"
    ON_USABILITY_ISSUE = "on_usability_issue"
    ON_PERFORMANCE_ISSUE = "on_performance_issue"
    ON_ERROR_SPIKE = "on_error_spike"
    ON_NEGATIVE_SENTIMENT = "on_negative_sentiment"
    ON_INSIGHT_GENERATED = "on_insight_generated"
    ON_METRIC_THRESHOLD = "on_metric_threshold"


@dataclass
class FeedbackAction:
    """An action triggered by feedback."""

    hook: FeedbackHook
    trigger_data: dict
    action_type: str  # "adjust", "alert", "log", "notify"
    action_data: dict
    timestamp: datetime = field(default_factory=datetime.utcnow)
    executed: bool = False
    result: Optional[str] = None

    def to_dict(self) -> dict:
        return {
            "hook": self.hook.value,
            "trigger_data": self.trigger_data,
            "action_type": self.action_type,
            "action_data": self.action_data,
            "timestamp": self.timestamp.isoformat(),
            "executed": self.executed,
            "result": self.result,
        }


class FeedbackBridge:
    """
    Bridge between feedback collection and system adaptation.

    Features:
    - Real-time feedback processing
    - Configurable action triggers
    - Integration with Evolution Daemon
    - Alert escalation
    - Adaptive parameter tuning
    """

    def __init__(
        self,
        storage_path: Optional[Path] = None,
        alert_handlers: Optional[list[Callable]] = None,
        daemon_interface: Optional[Any] = None,
    ):
        self.storage_path = storage_path or (
            Path.home() / ".geometry_os" / "feedback_bridge"
        )
        self.storage_path.mkdir(parents=True, exist_ok=True)

        self._alert_handlers = alert_handlers or []
        self._daemon_interface = daemon_interface
        self._action_queue: queue.Queue = queue.Queue()
        self._hooks: dict[FeedbackHook, list[Callable]] = defaultdict(list)
        self._thresholds: dict[str, tuple[float, float]] = {}  # metric: (low, high)
        self._lock = threading.RLock()
        self._running = False
        self._worker_thread: Optional[threading.Thread] = None

        # Action history
        self._action_history: list[FeedbackAction] = []

        # Default thresholds
        self._setup_default_thresholds()

        logger.info("FeedbackBridge initialized")

    def _setup_default_thresholds(self):
        """Set up default metric thresholds."""
        self._thresholds = {
            "rating": (3.0, 4.5),  # Low if < 3, high if >= 4.5
            "error_rate": (0.05, 0.01),  # High if > 5%, low if < 1%
            "nps": (0, 50),  # Low if < 0, high if >= 50
            "sus": (52, 85),  # Low if < 52, high if >= 85
            "task_success_rate": (0.7, 0.95),  # Low if < 70%, high if >= 95%
        }

    # --- Hook Registration ---

    def register_hook(
        self,
        hook: FeedbackHook,
        callback: Callable[[FeedbackAction], None],
    ):
        """Register a callback for a specific feedback hook."""
        self._hooks[hook].append(callback)
        logger.debug(f"Registered hook: {hook.value}")

    def unregister_hook(
        self,
        hook: FeedbackHook,
        callback: Callable,
    ):
        """Unregister a callback."""
        if callback in self._hooks[hook]:
            self._hooks[hook].remove(callback)

    # --- Threshold Configuration ---

    def set_threshold(
        self,
        metric: str,
        low_threshold: float,
        high_threshold: float,
    ):
        """Set thresholds for a metric."""
        self._thresholds[metric] = (low_threshold, high_threshold)

    def check_threshold(
        self,
        metric: str,
        value: float,
    ) -> Optional[str]:
        """Check if a value crosses a threshold."""
        if metric not in self._thresholds:
            return None

        low, high = self._thresholds[metric]

        if value < low:
            return "low"
        elif value >= high:
            return "high"
        return None

    # --- Feedback Processing ---

    def process_feedback_entry(self, entry):
        """Process a feedback entry and trigger appropriate actions."""
        from systems.feedback.collector import FeedbackType

        if not hasattr(entry, "feedback_type"):
            return

        feedback_type = entry.feedback_type

        # Rating-based hooks
        if feedback_type == FeedbackType.RATING:
            rating = entry.content.get("rating", 0) if entry.content else 0

            if rating < 3:
                self._trigger_action(FeedbackHook.ON_RATING_LOW, {
                    "entry_id": entry.id,
                    "rating": rating,
                    "component": entry.context.component if entry.context else None,
                })
            elif rating >= 4:
                self._trigger_action(FeedbackHook.ON_RATING_HIGH, {
                    "entry_id": entry.id,
                    "rating": rating,
                    "component": entry.context.component if entry.context else None,
                })

        # Bug report hook
        elif feedback_type == FeedbackType.BUG_REPORT:
            severity = entry.severity.value if hasattr(entry, "severity") else "medium"
            self._trigger_action(FeedbackHook.ON_BUG_REPORT, {
                "entry_id": entry.id,
                "severity": severity,
                "description": entry.content.get("description", "") if entry.content else "",
            })

        # Feature request hook
        elif feedback_type == FeedbackType.FEATURE_REQUEST:
            self._trigger_action(FeedbackHook.ON_FEATURE_REQUEST, {
                "entry_id": entry.id,
                "title": entry.content.get("title", "") if entry.content else "",
            })

        # Usability issue hook
        elif feedback_type == FeedbackType.USABILITY_ISSUE:
            self._trigger_action(FeedbackHook.ON_USABILITY_ISSUE, {
                "entry_id": entry.id,
                "component": entry.context.component if entry.context else None,
                "issue": entry.content.get("issue", "") if entry.content else "",
            })

        # Performance issue hook
        elif feedback_type == FeedbackType.PERFORMANCE_ISSUE:
            self._trigger_action(FeedbackHook.ON_PERFORMANCE_ISSUE, {
                "entry_id": entry.id,
                "component": entry.context.component if entry.context else None,
                "metric": entry.content.get("metric", "") if entry.content else "",
            })

    def process_interaction_event(self, event):
        """Process an interaction event and trigger appropriate actions."""
        from systems.feedback.tracker import EventType

        if not hasattr(event, "event_type"):
            return

        # Error spike detection
        if event.event_type == EventType.ERROR_ENCOUNTER:
            self._check_error_spike(event)

    def process_insight(self, insight):
        """Process an insight from the analyzer."""
        self._trigger_action(FeedbackHook.ON_INSIGHT_GENERATED, {
            "insight_id": insight.id,
            "category": insight.category.value if hasattr(insight, "category") else None,
            "priority": insight.priority.value if hasattr(insight, "priority") else None,
            "title": insight.title if hasattr(insight, "title") else None,
        })

    def process_metric(self, metric_name: str, value: float, context: dict = None):
        """Process a metric value and check thresholds."""
        threshold_status = self.check_threshold(metric_name, value)

        if threshold_status:
            self._trigger_action(FeedbackHook.ON_METRIC_THRESHOLD, {
                "metric": metric_name,
                "value": value,
                "status": threshold_status,
                "context": context or {},
            })

    def _check_error_spike(self, event):
        """Check if we're seeing an error spike."""
        # This is a simplified check - in production, would track error rates over time

        # Count recent errors (simplified)
        recent_errors = getattr(self, "_recent_error_count", 0) + 1
        self._recent_error_count = recent_errors

        # Reset counter periodically
        if not hasattr(self, "_last_error_reset"):
            self._last_error_reset = time.time()

        if time.time() - self._last_error_reset > 60:  # 1 minute window
            if recent_errors > 10:  # More than 10 errors per minute
                self._trigger_action(FeedbackHook.ON_ERROR_SPIKE, {
                    "error_count": recent_errors,
                    "window_seconds": 60,
                })
            self._recent_error_count = 0
            self._last_error_reset = time.time()

    def _trigger_action(self, hook: FeedbackHook, trigger_data: dict):
        """Trigger actions for a hook."""
        action = FeedbackAction(
            hook=hook,
            trigger_data=trigger_data,
            action_type=self._determine_action_type(hook, trigger_data),
            action_data=self._determine_action_data(hook, trigger_data),
        )

        # Queue for processing
        self._action_queue.put(action)

        # Log the trigger
        logger.info(f"Feedback hook triggered: {hook.value} - {action.action_type}")

    def _determine_action_type(self, hook: FeedbackHook, trigger_data: dict) -> str:
        """Determine what type of action to take."""
        # Critical hooks get alerts
        critical_hooks = {
            FeedbackHook.ON_BUG_REPORT,
            FeedbackHook.ON_ERROR_SPIKE,
            FeedbackHook.ON_PERFORMANCE_ISSUE,
        }

        if hook in critical_hooks:
            severity = trigger_data.get("severity", "medium")
            if severity in ("high", "critical"):
                return "alert"

        # Threshold breaches get adjustments
        if hook == FeedbackHook.ON_METRIC_THRESHOLD:
            status = trigger_data.get("status")
            if status == "low":
                return "adjust"
            elif status == "high":
                return "log"

        # Default actions by hook
        default_actions = {
            FeedbackHook.ON_RATING_LOW: "alert",
            FeedbackHook.ON_RATING_HIGH: "log",
            FeedbackHook.ON_BUG_REPORT: "alert",
            FeedbackHook.ON_FEATURE_REQUEST: "log",
            FeedbackHook.ON_USABILITY_ISSUE: "adjust",
            FeedbackHook.ON_PERFORMANCE_ISSUE: "adjust",
            FeedbackHook.ON_ERROR_SPIKE: "alert",
            FeedbackHook.ON_NEGATIVE_SENTIMENT: "log",
            FeedbackHook.ON_INSIGHT_GENERATED: "log",
            FeedbackHook.ON_METRIC_THRESHOLD: "log",
        }

        return default_actions.get(hook, "log")

    def _determine_action_data(self, hook: FeedbackHook, trigger_data: dict) -> dict:
        """Determine the data for the action."""
        action_data = {
            "hook": hook.value,
            "timestamp": datetime.utcnow().isoformat(),
        }

        if hook == FeedbackHook.ON_RATING_LOW:
            action_data.update({
                "suggested_action": "review_component",
                "component": trigger_data.get("component"),
                "priority": "high",
            })

        elif hook == FeedbackHook.ON_USABILITY_ISSUE:
            action_data.update({
                "suggested_action": "ux_review",
                "component": trigger_data.get("component"),
            })

        elif hook == FeedbackHook.ON_PERFORMANCE_ISSUE:
            action_data.update({
                "suggested_action": "optimize_component",
                "component": trigger_data.get("component"),
                "metric": trigger_data.get("metric"),
            })

        elif hook == FeedbackHook.ON_ERROR_SPIKE:
            action_data.update({
                "suggested_action": "investigate_errors",
                "error_count": trigger_data.get("error_count"),
            })

        elif hook == FeedbackHook.ON_METRIC_THRESHOLD:
            action_data.update({
                "metric": trigger_data.get("metric"),
                "value": trigger_data.get("value"),
                "status": trigger_data.get("status"),
            })

        return action_data

    # --- Worker Thread ---

    def start(self):
        """Start the background worker thread."""
        if self._running:
            return

        self._running = True
        self._worker_thread = threading.Thread(target=self._worker_loop, daemon=True)
        self._worker_thread.start()
        logger.info("FeedbackBridge worker started")

    def stop(self):
        """Stop the worker thread."""
        self._running = False
        if self._worker_thread:
            self._worker_thread.join(timeout=5)
        logger.info("FeedbackBridge worker stopped")

    def _worker_loop(self):
        """Background worker loop for processing actions."""
        while self._running:
            try:
                action = self._action_queue.get(timeout=1.0)
                self._execute_action(action)
            except queue.Empty:
                continue
            except Exception as e:
                logger.error(f"Error processing action: {e}")

    def _execute_action(self, action: FeedbackAction):
        """Execute a feedback action."""
        try:
            # Execute hook callbacks
            for callback in self._hooks.get(action.hook, []):
                try:
                    callback(action)
                except Exception as e:
                    logger.error(f"Hook callback error: {e}")

            # Execute action type specific handling
            if action.action_type == "alert":
                self._handle_alert(action)
            elif action.action_type == "adjust":
                self._handle_adjustment(action)
            elif action.action_type == "notify":
                self._handle_notification(action)
            else:  # log
                self._handle_log(action)

            # Notify daemon interface if available
            if self._daemon_interface:
                self._notify_daemon(action)

            action.executed = True
            action.result = "success"

        except Exception as e:
            action.result = f"error: {e}"
            logger.error(f"Failed to execute action: {e}")

        finally:
            # Record in history
            with self._lock:
                self._action_history.append(action)
                # Keep last 1000 actions
                if len(self._action_history) > 1000:
                    self._action_history = self._action_history[-1000:]

    def _handle_alert(self, action: FeedbackAction):
        """Handle an alert action."""
        alert_data = {
            "type": "feedback_alert",
            "hook": action.hook.value,
            "trigger": action.trigger_data,
            "action_data": action.action_data,
            "timestamp": action.timestamp.isoformat(),
        }

        for handler in self._alert_handlers:
            try:
                handler(alert_data)
            except Exception as e:
                logger.error(f"Alert handler error: {e}")

        # Also log prominently
        logger.warning(
            f"⚠️ FEEDBACK ALERT: {action.hook.value} - {action.trigger_data}"
        )

    def _handle_adjustment(self, action: FeedbackAction):
        """Handle an adjustment action."""
        logger.info(f"🔧 Feedback adjustment: {action.hook.value} - {action.action_data}")

        # If daemon interface is available, send adjustment
        if self._daemon_interface:
            adjustment = {
                "type": "feedback_adjustment",
                "hook": action.hook.value,
                "data": action.action_data,
            }
            # Daemon would implement feedback_adjustment method
            if hasattr(self._daemon_interface, "apply_feedback_adjustment"):
                self._daemon_interface.apply_feedback_adjustment(adjustment)

    def _handle_notification(self, action: FeedbackAction):
        """Handle a notification action."""
        logger.info(f"📢 Feedback notification: {action.hook.value}")

    def _handle_log(self, action: FeedbackAction):
        """Handle a log action."""
        logger.debug(f"📝 Feedback log: {action.hook.value} - {action.trigger_data}")

    def _notify_daemon(self, action: FeedbackAction):
        """Notify the daemon interface of an action."""
        if not self._daemon_interface:
            return

        try:
            if hasattr(self._daemon_interface, "on_feedback_action"):
                self._daemon_interface.on_feedback_action(action.to_dict())
        except Exception as e:
            logger.error(f"Failed to notify daemon: {e}")

    # --- Query Methods ---

    def get_action_history(
        self,
        hook: Optional[FeedbackHook] = None,
        action_type: Optional[str] = None,
        limit: int = 100,
    ) -> list[FeedbackAction]:
        """Get action history with optional filters."""
        with self._lock:
            actions = list(self._action_history)

        if hook:
            actions = [a for a in actions if a.hook == hook]
        if action_type:
            actions = [a for a in actions if a.action_type == action_type]

        return actions[-limit:]

    def get_stats(self) -> dict:
        """Get bridge statistics."""
        with self._lock:
            actions = list(self._action_history)

        hook_counts = defaultdict(int)
        action_counts = defaultdict(int)

        for action in actions:
            hook_counts[action.hook.value] += 1
            action_counts[action.action_type] += 1

        return {
            "total_actions": len(actions),
            "by_hook": dict(hook_counts),
            "by_action_type": dict(action_counts),
            "queue_size": self._action_queue.qsize(),
            "running": self._running,
        }

    def export_actions(
        self,
        output_path: Optional[Path] = None,
    ) -> Path:
        """Export action history to a file."""
        output_path = output_path or (
            self.storage_path / f"actions_export_{int(time.time())}.json"
        )

        with self._lock:
            data = [a.to_dict() for a in self._action_history]

        with open(output_path, "w") as f:
            json.dump(data, f, indent=2)

        return output_path


# --- Daemon Integration Helpers ---

def create_daemon_feedback_integration(daemon_instance) -> tuple:
    """
    Create a complete feedback integration for an Evolution Daemon.

    Returns (collector, tracker, analyzer, metrics, bridge) all connected.
    """
    from systems.feedback.collector import FeedbackCollector
    from systems.feedback.tracker import InteractionTracker
    from systems.feedback.analyzer import InsightAnalyzer
    from systems.feedback.metrics import UsabilityMetrics

    # Create components
    collector = FeedbackCollector()
    tracker = InteractionTracker()
    analyzer = InsightAnalyzer()
    metrics = UsabilityMetrics()
    bridge = FeedbackBridge(daemon_interface=daemon_instance)

    # Connect bridge to collector
    collector.register_callback(bridge.process_feedback_entry)

    # Connect bridge to tracker
    from systems.feedback.tracker import EventType
    tracker.register_callback(EventType.ERROR_ENCOUNTER, bridge.process_interaction_event)

    # Start bridge worker
    bridge.start()

    logger.info("Created complete daemon feedback integration")

    return collector, tracker, analyzer, metrics, bridge
