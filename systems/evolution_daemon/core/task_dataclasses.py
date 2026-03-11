"""
Evolution Daemon - Task Data Structures

Core data structures for evolution tasks and codebase analysis.

These dataclasses were extracted from the main evolution_daemon.py
for better organization and reusability.
"""

from dataclasses import dataclass, field
from datetime import datetime
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from systems.evolution_daemon.visual_verification_service import VisualIntent


@dataclass
class EvolutionTask:
    """
    A self-improvement task.

    Represents a single evolution proposal that flows through the
    safety pipeline (sandbox → guardian → tier → commit → monitor).

    Attributes:
        task_id: Unique identifier for this task
        goal: Description of what the evolution aims to achieve
        target_file: Optional specific file to modify
        priority: Task priority (1-10, higher = more important)
        status: Current status (pending, in_progress, completed, etc.)
        created_at: ISO timestamp of task creation
        result: Final result message
        changes_made: List of changes applied
        visual_verification: Optional screenshot/data for visual check
        visual_intent: V12 Journeyman Stage visual intent for self-verification
        visual_attempt: Number of visual verification retry attempts
        pas_score: V16 Agency Integration PAS score (0.0 to 1.0)
        pas_decision: PAS decision (PENDING, PROMOTE, QUARANTINE, REJECT)
    """
    task_id: str
    goal: str
    target_file: str | None = None
    priority: int = 5
    status: str = "pending"
    created_at: str = field(default_factory=lambda: datetime.now().isoformat())
    result: str | None = None
    changes_made: list[str] = field(default_factory=list)
    visual_verification: str | None = None
    visual_intent: Optional['VisualIntent'] = None
    visual_attempt: int = 0
    pas_score: float = 0.0
    pas_decision: str = "PENDING"

    def __post_init__(self):
        """Validate task after initialization."""
        if not self.task_id:
            raise ValueError("task_id is required")
        if not self.goal:
            raise ValueError("goal is required")
        if not 1 <= self.priority <= 10:
            raise ValueError("priority must be between 1 and 10")


@dataclass
class CodebaseAnalysis:
    """
    Analysis of current codebase state.

    Represents the results of scanning and analyzing the codebase
    for improvement opportunities.

    Attributes:
        total_files: Total number of files in the codebase
        python_files: Number of Python files
        test_coverage_pct: Estimated test coverage percentage
        issues_found: List of issues detected during scan
        improvement_opportunities: List of suggested improvements
        last_scan: ISO timestamp of the last scan
    """
    total_files: int = 0
    python_files: int = 0
    test_coverage_pct: float = 0.0
    issues_found: list[str] = field(default_factory=list)
    improvement_opportunities: list[str] = field(default_factory=list)
    last_scan: str = field(default_factory=lambda: datetime.now().isoformat())

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization."""
        return {
            "total_files": self.total_files,
            "python_files": self.python_files,
            "test_coverage_pct": self.test_coverage_pct,
            "issues_found": self.issues_found,
            "improvement_opportunities": self.improvement_opportunities,
            "last_scan": self.last_scan
        }
