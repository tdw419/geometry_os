"""
Usability Metrics Module

Computes and tracks usability KPIs:
- Task success rate
- Time on task
- Error rate
- System Usability Score (SUS)
- Net Promoter Score (NPS)
- Engagement metrics
"""

import json
import time
from dataclasses import dataclass
from datetime import datetime, timedelta
from pathlib import Path
from typing import Optional
from collections import defaultdict
import logging

logger = logging.getLogger(__name__)


@dataclass
class MetricSnapshot:
    """A snapshot of metrics at a point in time."""

    timestamp: datetime
    metrics: dict
    period_start: datetime
    period_end: datetime
    sample_size: int

    def to_dict(self) -> dict:
        return {
            "timestamp": self.timestamp.isoformat(),
            "metrics": self.metrics,
            "period_start": self.period_start.isoformat(),
            "period_end": self.period_end.isoformat(),
            "sample_size": self.sample_size,
        }


class UsabilityMetrics:
    """
    Computes and tracks usability KPIs.

    Features:
    - Standard UX metrics (SUS, NPS, task success)
    - Engagement metrics
    - Error tracking
    - Time-based analysis
    - Trend tracking
    """

    def __init__(
        self,
        storage_path: Optional[Path] = None,
        history_days: int = 30,
    ):
        self.storage_path = storage_path or (
            Path.home() / ".geometry_os" / "metrics"
        )
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self.history_days = history_days
        self._snapshots: list[MetricSnapshot] = []

        # Load historical snapshots
        self._load_history()

    def _load_history(self):
        """Load historical metric snapshots."""
        history_file = self.storage_path / "metrics_history.json"
        if not history_file.exists():
            return

        try:
            with open(history_file) as f:
                data = json.load(f)

            cutoff = datetime.utcnow() - timedelta(days=self.history_days)
            for item in data:
                snapshot = MetricSnapshot(
                    timestamp=datetime.fromisoformat(item["timestamp"]),
                    metrics=item["metrics"],
                    period_start=datetime.fromisoformat(item["period_start"]),
                    period_end=datetime.fromisoformat(item["period_end"]),
                    sample_size=item["sample_size"],
                )
                if snapshot.timestamp >= cutoff:
                    self._snapshots.append(snapshot)

            logger.info(f"Loaded {len(self._snapshots)} metric snapshots")
        except Exception as e:
            logger.error(f"Failed to load metrics history: {e}")

    def _save_history(self):
        """Save metric snapshots to history."""
        history_file = self.storage_path / "metrics_history.json"

        try:
            data = [s.to_dict() for s in self._snapshots]
            with open(history_file, "w") as f:
                json.dump(data, f, indent=2)
        except Exception as e:
            logger.error(f"Failed to save metrics history: {e}")

    # --- Core Metric Computations ---

    def compute_task_success_rate(
        self,
        interaction_events: list,
    ) -> dict:
        """
        Compute task success rate.

        Success = tasks completed without errors / total tasks started
        """
        tasks_started = defaultdict(list)
        tasks_ended = defaultdict(list)
        task_errors = defaultdict(int)

        for event in interaction_events:
            if not hasattr(event, "event_type"):
                continue

            event_type = event.event_type.value
            data = getattr(event, "data", {}) or {}

            if event_type == "task_start":
                task_id = data.get("task_id")
                task_name = data.get("task_name", "unknown")
                if task_id:
                    tasks_started[task_name].append(task_id)

            elif event_type == "task_end":
                task_id = data.get("task_id")
                success = data.get("success", True)
                if task_id:
                    tasks_ended[task_name].append((task_id, success))

            elif event_type == "error_encounter":
                component = getattr(event, "component", "unknown")
                task_errors[component] += 1

        # Calculate success rates
        task_metrics = {}
        for task_name, started_ids in tasks_started.items():
            ended = tasks_ended.get(task_name, [])
            successful = sum(1 for _, s in ended if s)
            total_started = len(started_ids)
            total_ended = len(ended)

            task_metrics[task_name] = {
                "started": total_started,
                "completed": total_ended,
                "successful": successful,
                "success_rate": successful / total_started if total_started > 0 else 0,
                "completion_rate": total_ended / total_started if total_started > 0 else 0,
                "errors": task_errors.get(task_name, 0),
            }

        # Overall metrics
        total_started = sum(len(ids) for ids in tasks_started.values())
        total_successful = sum(
            sum(1 for _, s in ended if s)
            for ended in tasks_ended.values()
        )

        return {
            "overall_success_rate": total_successful / total_started if total_started > 0 else 0,
            "tasks": task_metrics,
        }

    def compute_time_on_task(
        self,
        interaction_events: list,
    ) -> dict:
        """
        Compute time spent on tasks.

        Returns average, median, and distribution.
        """
        task_durations = defaultdict(list)

        for event in interaction_events:
            if not hasattr(event, "event_type"):
                continue

            if event.event_type.value == "task_end":
                duration_ms = getattr(event, "duration_ms", None)
                data = getattr(event, "data", {}) or {}
                task_name = data.get("task_name", "unknown")

                if duration_ms:
                    task_durations[task_name].append(duration_ms)

        task_metrics = {}
        all_durations = []

        for task_name, durations in task_durations.items():
            if durations:
                avg = sum(durations) / len(durations)
                sorted_durations = sorted(durations)
                mid = len(sorted_durations) // 2
                median = sorted_durations[mid]

                task_metrics[task_name] = {
                    "count": len(durations),
                    "avg_ms": avg,
                    "median_ms": median,
                    "min_ms": min(durations),
                    "max_ms": max(durations),
                }
                all_durations.extend(durations)

        overall = {}
        if all_durations:
            overall = {
                "avg_ms": sum(all_durations) / len(all_durations),
                "median_ms": sorted(all_durations)[len(all_durations) // 2],
                "total_tasks": len(all_durations),
            }

        return {
            "overall": overall,
            "by_task": task_metrics,
        }

    def compute_error_rate(
        self,
        interaction_events: list,
        time_window_hours: int = 24,
    ) -> dict:
        """
        Compute error rates.

        Returns errors per session, by component, and trends.
        """
        errors_by_component = defaultdict(int)
        errors_by_session = defaultdict(int)
        errors_by_type = defaultdict(int)
        total_events = 0
        sessions_with_errors = set()

        cutoff = time.time() - (time_window_hours * 3600)

        for event in interaction_events:
            if not hasattr(event, "timestamp"):
                continue

            if event.timestamp < cutoff:
                continue

            total_events += 1

            if hasattr(event, "event_type") and event.event_type.value == "error_encounter":
                component = getattr(event, "component", "unknown")
                session_id = getattr(event, "session_id", "unknown")
                data = getattr(event, "data", {}) or {}
                error_type = data.get("error_type", "unknown")

                errors_by_component[component] += 1
                errors_by_session[session_id] += 1
                errors_by_type[error_type] += 1
                sessions_with_errors.add(session_id)

        total_errors = sum(errors_by_component.values())
        total_sessions = len(errors_by_session)

        return {
            "total_errors": total_errors,
            "total_events": total_events,
            "error_rate": total_errors / total_events if total_events > 0 else 0,
            "errors_per_session": total_errors / total_sessions if total_sessions > 0 else 0,
            "sessions_with_errors": len(sessions_with_errors),
            "by_component": dict(sorted(
                errors_by_component.items(),
                key=lambda x: -x[1],
            )[:10]),
            "by_type": dict(errors_by_type),
            "time_window_hours": time_window_hours,
        }

    def compute_nps(
        self,
        feedback_entries: list,
    ) -> dict:
        """
        Compute Net Promoter Score (NPS).

        NPS = % Promoters (9-10) - % Detractors (0-6)
        """
        nps_scores = []

        for entry in feedback_entries:
            if not hasattr(entry, "feedback_type"):
                continue

            if entry.feedback_type.value == "nps":
                content = getattr(entry, "content", {}) or {}
                score = content.get("score")
                if score is not None:
                    nps_scores.append(score)

        if not nps_scores:
            return {
                "nps": None,
                "sample_size": 0,
                "promoters": 0,
                "passives": 0,
                "detractors": 0,
            }

        promoters = sum(1 for s in nps_scores if s >= 9)
        passives = sum(1 for s in nps_scores if 7 <= s <= 8)
        detractors = sum(1 for s in nps_scores if s <= 6)

        total = len(nps_scores)
        nps = ((promoters - detractors) / total) * 100

        return {
            "nps": round(nps, 1),
            "sample_size": total,
            "promoters": promoters,
            "promoters_pct": round(promoters / total * 100, 1),
            "passives": passives,
            "passives_pct": round(passives / total * 100, 1),
            "detractors": detractors,
            "detractors_pct": round(detractors / total * 100, 1),
        }

    def compute_sus(
        self,
        feedback_entries: list,
    ) -> dict:
        """
        Compute System Usability Score (SUS).

        Standard SUS calculation from 10-question survey (0-100 scale).
        This implementation handles simplified SUS-like ratings.
        """
        # Look for SUS-specific feedback or use ratings as proxy
        ratings = []

        for entry in feedback_entries:
            if not hasattr(entry, "feedback_type"):
                continue

            if entry.feedback_type.value == "rating":
                content = getattr(entry, "content", {}) or {}
                rating = content.get("rating")
                if rating is not None:
                    ratings.append(rating)

        if not ratings:
            return {
                "sus": None,
                "sample_size": 0,
            }

        # Convert 5-star ratings to SUS-like scale (0-100)
        # This is an approximation - real SUS requires 10 specific questions
        sus_scores = [(r - 1) / 4 * 100 for r in ratings]  # 1-5 -> 0-100
        avg_sus = sum(sus_scores) / len(sus_scores)

        # Interpret SUS score
        if avg_sus >= 85:
            grade = "Excellent"
        elif avg_sus >= 72:
            grade = "Good"
        elif avg_sus >= 52:
            grade = "OK"
        else:
            grade = "Poor"

        return {
            "sus": round(avg_sus, 1),
            "sample_size": len(ratings),
            "grade": grade,
            "distribution": {
                "excellent": sum(1 for s in sus_scores if s >= 85),
                "good": sum(1 for s in sus_scores if 72 <= s < 85),
                "ok": sum(1 for s in sus_scores if 52 <= s < 72),
                "poor": sum(1 for s in sus_scores if s < 52),
            },
        }

    def compute_engagement_metrics(
        self,
        interaction_events: list,
        time_window_hours: int = 24,
    ) -> dict:
        """
        Compute user engagement metrics.

        Includes session duration, active time, feature usage.
        """
        cutoff = time.time() - (time_window_hours * 3600)

        sessions = defaultdict(list)
        feature_usage = defaultdict(int)
        view_visits = defaultdict(int)

        for event in interaction_events:
            if not hasattr(event, "timestamp"):
                continue

            if event.timestamp < cutoff:
                continue

            session_id = getattr(event, "session_id", "unknown")
            sessions[session_id].append(event)

            if hasattr(event, "event_type"):
                event_type = event.event_type.value

                if event_type == "feature_use":
                    data = getattr(event, "data", {}) or {}
                    feature = data.get("feature", "unknown")
                    feature_usage[feature] += 1

                elif event_type == "view_enter":
                    view = getattr(event, "view", "unknown")
                    view_visits[view] += 1

        # Calculate session metrics
        session_durations = []
        session_active_times = []

        for session_id, events in sessions.items():
            if len(events) < 2:
                continue

            timestamps = [e.timestamp for e in events]
            duration = max(timestamps) - min(timestamps)
            session_durations.append(duration)

            # Estimate active time (excluding idle periods)
            idle_events = [
                e for e in events
                if hasattr(e, "event_type")
                and e.event_type.value in ("idle_start", "idle_end")
            ]
            idle_time = 0
            idle_start = None
            for e in idle_events:
                if e.event_type.value == "idle_start":
                    idle_start = e.timestamp
                elif e.event_type.value == "idle_end" and idle_start:
                    idle_time += e.timestamp - idle_start
                    idle_start = None

            active_time = duration - idle_time
            session_active_times.append(active_time)

        return {
            "total_sessions": len(sessions),
            "avg_session_duration_seconds": (
                sum(session_durations) / len(session_durations)
                if session_durations else 0
            ),
            "avg_active_time_seconds": (
                sum(session_active_times) / len(session_active_times)
                if session_active_times else 0
            ),
            "top_features": dict(sorted(
                feature_usage.items(),
                key=lambda x: -x[1],
            )[:10]),
            "top_views": dict(sorted(
                view_visits.items(),
                key=lambda x: -x[1],
            )[:10]),
            "time_window_hours": time_window_hours,
        }

    # --- Comprehensive Metrics Computation ---

    def compute_all_metrics(
        self,
        feedback_entries: list,
        interaction_events: list,
        time_window_hours: int = 24,
    ) -> MetricSnapshot:
        """
        Compute all metrics and create a snapshot.
        """
        now = datetime.utcnow()
        period_start = now - timedelta(hours=time_window_hours)

        metrics = {
            "task_success": self.compute_task_success_rate(interaction_events),
            "time_on_task": self.compute_time_on_task(interaction_events),
            "error_rate": self.compute_error_rate(interaction_events, time_window_hours),
            "nps": self.compute_nps(feedback_entries),
            "sus": self.compute_sus(feedback_entries),
            "engagement": self.compute_engagement_metrics(interaction_events, time_window_hours),
        }

        snapshot = MetricSnapshot(
            timestamp=now,
            metrics=metrics,
            period_start=period_start,
            period_end=now,
            sample_size=len(feedback_entries) + len(interaction_events),
        )

        self._snapshots.append(snapshot)
        self._save_history()

        return snapshot

    # --- Trend Analysis ---

    def get_metric_trend(
        self,
        metric_path: str,
        days: int = 7,
    ) -> list[tuple[datetime, float]]:
        """
        Get trend data for a specific metric.

        Args:
            metric_path: Dot-separated path (e.g., "nps.nps", "error_rate.error_rate")
            days: Number of days to look back
        """
        cutoff = datetime.utcnow() - timedelta(days=days)
        trend = []

        for snapshot in self._snapshots:
            if snapshot.timestamp < cutoff:
                continue

            # Navigate to the metric
            value = snapshot.metrics
            for key in metric_path.split("."):
                if isinstance(value, dict) and key in value:
                    value = value[key]
                else:
                    value = None
                    break

            if value is not None and isinstance(value, (int, float)):
                trend.append((snapshot.timestamp, value))

        return sorted(trend, key=lambda x: x[0])

    def get_dashboard_data(self) -> dict:
        """
        Get data formatted for a metrics dashboard.
        """
        if not self._snapshots:
            return {"error": "No metrics available"}

        latest = self._snapshots[-1]

        return {
            "snapshot_time": latest.timestamp.isoformat(),
            "period": {
                "start": latest.period_start.isoformat(),
                "end": latest.period_end.isoformat(),
            },
            "sample_size": latest.sample_size,
            "metrics": latest.metrics,
            "trends": {
                "nps": self.get_metric_trend("nps.nps", days=7),
                "error_rate": self.get_metric_trend("error_rate.error_rate", days=7),
                "sus": self.get_metric_trend("sus.sus", days=7),
            },
        }

    def export_metrics(
        self,
        output_path: Optional[Path] = None,
        format: str = "json",
    ) -> Path:
        """Export metrics to a file."""
        output_path = output_path or (
            self.storage_path / f"metrics_export_{int(time.time())}.{format}"
        )

        if format == "json":
            data = self.get_dashboard_data()
            with open(output_path, "w") as f:
                json.dump(data, f, indent=2)

        return output_path
