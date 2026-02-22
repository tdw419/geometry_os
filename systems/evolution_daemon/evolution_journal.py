"""
Evolution Journal Service - Data Structures

Core data types for the Evolution Journal system that auto-publishes
evolution daemon events to WordPress.

- EventType: The 3 core events we track (proposal, approval, commit)
- EvolutionEvent: Data container for event details to publish
- JournalStats: Track publishing statistics
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Dict, Optional, Any


class EventType(str, Enum):
    """Core event types tracked by the Evolution Journal."""
    PROPOSAL_CREATED = "proposal_created"
    GUARDIAN_APPROVED = "guardian_approved"
    COMMIT_MADE = "commit_made"


@dataclass
class EvolutionEvent:
    """
    Data container for evolution events to be published to WordPress.

    This is the primary artifact that flows through the journal system,
    capturing key details about evolution daemon activities.
    """
    event_type: EventType
    proposal_id: str
    title: str
    timestamp: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )
    target_files: List[str] = field(default_factory=list)
    diff_summary: str = ""
    risk_level: str = "low"
    confidence: float = 0.0
    commit_sha: str = ""
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Serialize event to dict for JSON publishing."""
        return {
            "event_type": self.event_type.value,
            "proposal_id": self.proposal_id,
            "title": self.title,
            "timestamp": self.timestamp,
            "target_files": self.target_files,
            "diff_summary": self.diff_summary,
            "risk_level": self.risk_level,
            "confidence": self.confidence,
            "commit_sha": self.commit_sha,
            "metadata": self.metadata,
        }


@dataclass
class JournalStats:
    """
    Track publishing statistics for the Evolution Journal.

    Used to monitor the health and success rate of the journal service.
    """
    events_published: int = 0
    events_failed: int = 0
    last_publish_time: Optional[str] = None

    @property
    def success_rate(self) -> float:
        """Calculate the success rate of event publishing."""
        total = self.events_published + self.events_failed
        if total == 0:
            return 1.0  # No events = assume success
        return self.events_published / total
