"""
Feedback Collector Module

Captures direct user feedback through multiple channels:
- Ratings (1-5 stars, NPS scores)
- Text comments and suggestions
- Bug reports with context
- Feature requests
- Quick reactions (thumbs up/down, emojis)
"""

import json
import uuid
import time
import threading
from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Optional, Any
from collections import deque
import logging

logger = logging.getLogger(__name__)


class FeedbackType(Enum):
    """Types of feedback that can be collected."""

    RATING = "rating"  # 1-5 star rating
    NPS = "nps"  # Net Promoter Score (0-10)
    COMMENT = "comment"  # Free-form text feedback
    BUG_REPORT = "bug_report"  # Bug with context
    FEATURE_REQUEST = "feature_request"  # Feature suggestion
    QUICK_REACTION = "quick_reaction"  # Thumbs up/down, emoji
    USABILITY_ISSUE = "usability_issue"  # UX problem report
    PERFORMANCE_ISSUE = "performance_issue"  # Speed/lag report


class FeedbackSeverity(Enum):
    """Severity levels for actionable feedback."""

    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


@dataclass
class FeedbackContext:
    """Contextual information attached to feedback."""

    session_id: str
    user_id: Optional[str] = None
    component: Optional[str] = None  # Which UI component
    view: Optional[str] = None  # Which screen/view
    action: Optional[str] = None  # What action triggered feedback
    timestamp: float = field(default_factory=time.time)
    system_state: dict = field(default_factory=dict)
    custom_attributes: dict = field(default_factory=dict)

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass
class FeedbackEntry:
    """A single feedback entry from a user."""

    id: str = field(default_factory=lambda: str(uuid.uuid4()))
    feedback_type: FeedbackType = FeedbackType.COMMENT
    severity: FeedbackSeverity = FeedbackSeverity.LOW
    content: Any = None  # Type depends on feedback_type
    context: FeedbackContext = None
    tags: list = field(default_factory=list)
    resolved: bool = False
    resolution_notes: Optional[str] = None
    created_at: datetime = field(default_factory=datetime.utcnow)
    updated_at: datetime = field(default_factory=datetime.utcnow)

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "feedback_type": self.feedback_type.value,
            "severity": self.severity.value,
            "content": self.content,
            "context": self.context.to_dict() if self.context else None,
            "tags": self.tags,
            "resolved": self.resolved,
            "resolution_notes": self.resolution_notes,
            "created_at": self.created_at.isoformat(),
            "updated_at": self.updated_at.isoformat(),
        }

    @classmethod
    def from_dict(cls, data: dict) -> "FeedbackEntry":
        context = None
        if data.get("context"):
            context = FeedbackContext(**data["context"])

        return cls(
            id=data.get("id", str(uuid.uuid4())),
            feedback_type=FeedbackType(data.get("feedback_type", "comment")),
            severity=FeedbackSeverity(data.get("severity", "low")),
            content=data.get("content"),
            context=context,
            tags=data.get("tags", []),
            resolved=data.get("resolved", False),
            resolution_notes=data.get("resolution_notes"),
            created_at=datetime.fromisoformat(data["created_at"])
            if "created_at" in data
            else datetime.utcnow(),
            updated_at=datetime.fromisoformat(data["updated_at"])
            if "updated_at" in data
            else datetime.utcnow(),
        )


class FeedbackCollector:
    """
    Central collector for all user feedback.

    Features:
    - Thread-safe collection
    - Persistent storage
    - Real-time callbacks for immediate action
    - Batch export for analysis
    """

    def __init__(
        self,
        storage_path: Optional[Path] = None,
        max_in_memory: int = 1000,
        auto_persist: bool = True,
    ):
        self.storage_path = storage_path or Path.home() / ".geometry_os" / "feedback"
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self.feedback_file = self.storage_path / "feedback_log.jsonl"

        self._entries: deque[FeedbackEntry] = deque(maxlen=max_in_memory)
        self._callbacks: list = []
        self._lock = threading.RLock()
        self._auto_persist = auto_persist
        self._session_id = str(uuid.uuid4())

        # Load existing feedback
        self._load_from_disk()

        logger.info(f"FeedbackCollector initialized with session {self._session_id}")

    def _load_from_disk(self):
        """Load existing feedback from disk."""
        if not self.feedback_file.exists():
            return

        try:
            with open(self.feedback_file) as f:
                for line in f:
                    if line.strip():
                        entry = FeedbackEntry.from_dict(json.loads(line))
                        self._entries.append(entry)
            logger.info(f"Loaded {len(self._entries)} existing feedback entries")
        except Exception as e:
            logger.error(f"Failed to load feedback: {e}")

    def _persist_entry(self, entry: FeedbackEntry):
        """Persist a single entry to disk."""
        if not self._auto_persist:
            return

        try:
            with open(self.feedback_file, "a") as f:
                f.write(json.dumps(entry.to_dict()) + "\n")
        except Exception as e:
            logger.error(f"Failed to persist feedback: {e}")

    def register_callback(self, callback):
        """Register a callback for new feedback (for real-time processing)."""
        self._callbacks.append(callback)

    def _notify_callbacks(self, entry: FeedbackEntry):
        """Notify all registered callbacks of new feedback."""
        for callback in self._callbacks:
            try:
                callback(entry)
            except Exception as e:
                logger.error(f"Callback error: {e}")

    def create_context(
        self,
        component: Optional[str] = None,
        view: Optional[str] = None,
        action: Optional[str] = None,
        user_id: Optional[str] = None,
        system_state: Optional[dict] = None,
        custom_attributes: Optional[dict] = None,
    ) -> FeedbackContext:
        """Create a feedback context with current session info."""
        return FeedbackContext(
            session_id=self._session_id,
            user_id=user_id,
            component=component,
            view=view,
            action=action,
            system_state=system_state or {},
            custom_attributes=custom_attributes or {},
        )

    # --- Rating Methods ---

    def submit_rating(
        self,
        rating: int,
        component: Optional[str] = None,
        comment: Optional[str] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a 1-5 star rating."""
        if not 1 <= rating <= 5:
            raise ValueError("Rating must be between 1 and 5")

        context = self.create_context(component=component, **context_kwargs)
        content = {"rating": rating}
        if comment:
            content["comment"] = comment

        entry = FeedbackEntry(
            feedback_type=FeedbackType.RATING,
            severity=FeedbackSeverity.LOW,
            content=content,
            context=context,
            tags=[f"{rating}-star"],
        )

        return self._add_entry(entry)

    def submit_nps(
        self,
        score: int,
        reason: Optional[str] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a Net Promoter Score (0-10)."""
        if not 0 <= score <= 10:
            raise ValueError("NPS score must be between 0 and 10")

        context = self.create_context(**context_kwargs)
        content = {"score": score}
        if reason:
            content["reason"] = reason

        # Categorize NPS
        if score <= 6:
            category = "detractor"
        elif score <= 8:
            category = "passive"
        else:
            category = "promoter"

        entry = FeedbackEntry(
            feedback_type=FeedbackType.NPS,
            severity=FeedbackSeverity.LOW,
            content=content,
            context=context,
            tags=[category, f"nps-{score}"],
        )

        return self._add_entry(entry)

    # --- Text Feedback Methods ---

    def submit_comment(
        self,
        text: str,
        component: Optional[str] = None,
        tags: Optional[list] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a free-form comment."""
        context = self.create_context(component=component, **context_kwargs)

        entry = FeedbackEntry(
            feedback_type=FeedbackType.COMMENT,
            severity=FeedbackSeverity.LOW,
            content={"text": text},
            context=context,
            tags=tags or [],
        )

        return self._add_entry(entry)

    # --- Issue Reporting Methods ---

    def submit_bug_report(
        self,
        description: str,
        steps_to_reproduce: Optional[list] = None,
        expected_behavior: Optional[str] = None,
        actual_behavior: Optional[str] = None,
        severity: FeedbackSeverity = FeedbackSeverity.MEDIUM,
        screenshots: Optional[list] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a bug report with full context."""
        context = self.create_context(**context_kwargs)

        content = {
            "description": description,
            "steps_to_reproduce": steps_to_reproduce or [],
            "expected_behavior": expected_behavior,
            "actual_behavior": actual_behavior,
            "screenshots": screenshots or [],
        }

        entry = FeedbackEntry(
            feedback_type=FeedbackType.BUG_REPORT,
            severity=severity,
            content=content,
            context=context,
            tags=["bug", severity.value],
        )

        return self._add_entry(entry)

    def submit_feature_request(
        self,
        title: str,
        description: str,
        priority: str = "medium",
        use_case: Optional[str] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a feature request."""
        context = self.create_context(**context_kwargs)

        content = {
            "title": title,
            "description": description,
            "priority": priority,
            "use_case": use_case,
        }

        entry = FeedbackEntry(
            feedback_type=FeedbackType.FEATURE_REQUEST,
            severity=FeedbackSeverity.LOW,
            content=content,
            context=context,
            tags=["feature-request", priority],
        )

        return self._add_entry(entry)

    def submit_usability_issue(
        self,
        component: str,
        issue: str,
        impact: str = "medium",
        suggestion: Optional[str] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a usability issue report."""
        context = self.create_context(component=component, **context_kwargs)

        severity = FeedbackSeverity.HIGH if impact == "high" else FeedbackSeverity.MEDIUM

        content = {
            "component": component,
            "issue": issue,
            "impact": impact,
            "suggestion": suggestion,
        }

        entry = FeedbackEntry(
            feedback_type=FeedbackType.USABILITY_ISSUE,
            severity=severity,
            content=content,
            context=context,
            tags=["usability", component, impact],
        )

        return self._add_entry(entry)

    def submit_performance_issue(
        self,
        component: str,
        metric: str,
        value: float,
        threshold: float,
        impact: str = "medium",
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a performance issue report."""
        context = self.create_context(component=component, **context_kwargs)

        severity = (
            FeedbackSeverity.HIGH
            if impact == "high"
            else FeedbackSeverity.MEDIUM
            if impact == "medium"
            else FeedbackSeverity.LOW
        )

        content = {
            "component": component,
            "metric": metric,
            "value": value,
            "threshold": threshold,
            "impact": impact,
        }

        entry = FeedbackEntry(
            feedback_type=FeedbackType.PERFORMANCE_ISSUE,
            severity=severity,
            content=content,
            context=context,
            tags=["performance", component, metric],
        )

        return self._add_entry(entry)

    # --- Quick Feedback Methods ---

    def submit_quick_reaction(
        self,
        reaction: str,
        component: Optional[str] = None,
        **context_kwargs,
    ) -> FeedbackEntry:
        """Submit a quick reaction (thumbs up/down, emoji, etc.)."""
        context = self.create_context(component=component, **context_kwargs)

        # Determine sentiment
        positive_reactions = ["thumbs_up", "👍", "love", "❤️", "😊", "great"]
        negative_reactions = ["thumbs_down", "👎", "confused", "😕", "sad", "😢"]

        if reaction in positive_reactions:
            sentiment = "positive"
        elif reaction in negative_reactions:
            sentiment = "negative"
        else:
            sentiment = "neutral"

        entry = FeedbackEntry(
            feedback_type=FeedbackType.QUICK_REACTION,
            severity=FeedbackSeverity.LOW,
            content={"reaction": reaction, "sentiment": sentiment},
            context=context,
            tags=["quick", sentiment, reaction],
        )

        return self._add_entry(entry)

    def _add_entry(self, entry: FeedbackEntry) -> FeedbackEntry:
        """Add entry to collection and notify callbacks."""
        with self._lock:
            self._entries.append(entry)
            self._persist_entry(entry)

        self._notify_callbacks(entry)
        logger.info(f"Collected feedback: {entry.feedback_type.value} - {entry.id[:8]}")

        return entry

    # --- Query Methods ---

    def get_entries(
        self,
        feedback_type: Optional[FeedbackType] = None,
        severity: Optional[FeedbackSeverity] = None,
        resolved: Optional[bool] = None,
        since: Optional[datetime] = None,
        limit: int = 100,
    ) -> list[FeedbackEntry]:
        """Query feedback entries with optional filters."""
        with self._lock:
            entries = list(self._entries)

        if feedback_type:
            entries = [e for e in entries if e.feedback_type == feedback_type]
        if severity:
            entries = [e for e in entries if e.severity == severity]
        if resolved is not None:
            entries = [e for e in entries if e.resolved == resolved]
        if since:
            entries = [e for e in entries if e.created_at >= since]

        return entries[-limit:]

    def get_unresolved_count(self) -> int:
        """Get count of unresolved high/critical issues."""
        with self._lock:
            return sum(
                1
                for e in self._entries
                if not e.resolved
                and e.severity in (FeedbackSeverity.HIGH, FeedbackSeverity.CRITICAL)
            )

    def resolve_feedback(
        self, entry_id: str, resolution_notes: str
    ) -> Optional[FeedbackEntry]:
        """Mark feedback as resolved."""
        with self._lock:
            for entry in self._entries:
                if entry.id == entry_id:
                    entry.resolved = True
                    entry.resolution_notes = resolution_notes
                    entry.updated_at = datetime.utcnow()
                    return entry
        return None

    def export_feedback(
        self,
        output_path: Optional[Path] = None,
        format: str = "json",
        **query_kwargs,
    ) -> Path:
        """Export feedback to a file for analysis."""
        entries = self.get_entries(**query_kwargs, limit=10000)
        output_path = output_path or (
            self.storage_path / f"feedback_export_{int(time.time())}.{format}"
        )

        if format == "json":
            data = [e.to_dict() for e in entries]
            with open(output_path, "w") as f:
                json.dump(data, f, indent=2)
        elif format == "jsonl":
            with open(output_path, "w") as f:
                for entry in entries:
                    f.write(json.dumps(entry.to_dict()) + "\n")
        elif format == "csv":
            import csv

            with open(output_path, "w", newline="") as f:
                writer = csv.writer(f)
                writer.writerow(
                    [
                        "id",
                        "type",
                        "severity",
                        "content",
                        "component",
                        "resolved",
                        "created_at",
                    ]
                )
                for entry in entries:
                    writer.writerow(
                        [
                            entry.id,
                            entry.feedback_type.value,
                            entry.severity.value,
                            str(entry.content),
                            entry.context.component if entry.context else "",
                            entry.resolved,
                            entry.created_at.isoformat(),
                        ]
                    )

        logger.info(f"Exported {len(entries)} feedback entries to {output_path}")
        return output_path

    def get_stats(self) -> dict:
        """Get statistics about collected feedback."""
        with self._lock:
            entries = list(self._entries)

        if not entries:
            return {"total": 0}

        type_counts = {}
        severity_counts = {}
        ratings = []
        unresolved = 0

        for entry in entries:
            type_counts[entry.feedback_type.value] = (
                type_counts.get(entry.feedback_type.value, 0) + 1
            )
            severity_counts[entry.severity.value] = (
                severity_counts.get(entry.severity.value, 0) + 1
            )
            if not entry.resolved:
                unresolved += 1
            if entry.feedback_type == FeedbackType.RATING:
                ratings.append(entry.content.get("rating", 0))

        return {
            "total": len(entries),
            "by_type": type_counts,
            "by_severity": severity_counts,
            "unresolved": unresolved,
            "average_rating": sum(ratings) / len(ratings) if ratings else None,
            "session_id": self._session_id,
        }
