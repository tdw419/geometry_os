"""
Evolution Daemon V11 - Data Structures

Core data types for the Full Safety Pipeline:
- EvolutionProposal: Describes a proposed code change
- SandboxResult: Results of sandbox validation
- GuardianVerdict: AI review decision
- MonitoringResult: Post-commit health check results
- RecoveryAction: Actions to take on regression
- EvolutionResult: Final outcome of evolution attempt
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Dict, Optional, Any


class RecoveryAction(Enum):
    """Actions to take when a regression is detected"""
    AUTO_REVERT = "auto_revert"      # Immediately rollback the commit
    ALERT_PAUSE = "alert_pause"      # Alert Guardian, pause evolutions
    ESCALATE = "escalate"            # Human notification required


class EvolutionResult(Enum):
    """Final outcome of an evolution attempt"""
    SUCCESS = "success"                          # Evolution completed successfully
    REJECTED_SANDBOX = "rejected_sandbox"        # Failed sandbox validation
    REJECTED_GUARDIAN = "rejected_guardian"      # Guardian denied approval
    AWAITING_HUMAN_REVIEW = "awaiting_review"    # Tier 3, PR created
    REVERTED = "reverted"                        # Committed but rolled back
    ERROR = "error"                              # Unexpected error


@dataclass
class EvolutionProposal:
    """
    Describes a proposed code change from the evolution daemon.

    This is the primary artifact that flows through the safety pipeline.
    """
    proposal_id: str                              # Unique identifier
    goal: str                                     # What the evolution aims to achieve
    target_files: List[str]                       # Files to be modified
    diff_content: str                             # Unified diff of changes
    lines_changed: int = 0                        # Total lines added/removed
    author: str = "evolution_daemon"              # Source of the proposal
    created_at: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Calculate lines_changed from diff if not provided"""
        if self.lines_changed == 0 and self.diff_content:
            # Count lines starting with + or - (excluding ---/+++ headers)
            self.lines_changed = sum(
                1 for line in self.diff_content.split('\n')
                if line.startswith(('+', '-')) and not line.startswith(('+++', '---'))
            )


@dataclass
class SandboxResult:
    """
    Results of sandbox validation.

    The sandbox is an isolated environment where proposed changes are
    tested before being allowed into the main codebase.
    """
    passed: bool                                  # Did validation pass?
    proposal_id: str                              # Reference to proposal
    syntax_valid: bool = True                     # Python syntax check
    imports_valid: bool = True                    # Can all imports resolve?
    heartbeat_tests_passed: int = 0               # Number of heartbeat tests passed
    heartbeat_tests_total: int = 0                # Total heartbeat tests run
    errors: List[str] = field(default_factory=list)
    warnings: List[str] = field(default_factory=list)
    sandbox_path: Optional[str] = None            # Path to sandbox directory
    duration_ms: int = 0                          # Validation duration

    @property
    def heartbeat_pass_rate(self) -> float:
        """Calculate heartbeat test pass rate"""
        if self.heartbeat_tests_total == 0:
            return 1.0  # No tests = assume pass
        return self.heartbeat_tests_passed / self.heartbeat_tests_total


@dataclass
class GuardianVerdict:
    """
    AI-powered review decision from the Guardian agent.

    The Guardian evaluates proposals for security, correctness, and
    alignment with Geometry OS principles.
    """
    approved: bool                                # Is this proposal approved?
    proposal_id: str                              # Reference to proposal
    risk_level: str = "low"                       # low, medium, high
    confidence: float = 0.8                       # 0.0 to 1.0
    issues_found: List[str] = field(default_factory=list)
    recommendations: List[str] = field(default_factory=list)
    reviewer: str = "guardian"                    # AI agent name
    reviewed_at: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )
    requires_human_review: bool = False           # Escalate to human?
    reasoning: str = ""                           # Explanation of decision

    def __post_init__(self):
        """Set requires_human_review based on risk level"""
        if self.risk_level == "high":
            self.requires_human_review = True


@dataclass
class MonitoringResult:
    """
    Results of post-commit health monitoring.

    After an evolution is committed, the system monitors for regressions
    using tests, visual checks, and performance metrics.
    """
    healthy: bool                                 # Is the system healthy?
    commit_sha: str                               # Git commit being monitored
    tier: int = 1                                 # Monitoring tier (1, 2, or 3)

    # Regression test results
    regression_tests_passed: bool = True
    regression_failures: List[str] = field(default_factory=list)

    # Visual monitoring (Tier 2+)
    visual_healthy: bool = True
    visual_anomalies: List[str] = field(default_factory=list)

    # Performance metrics
    performance_ok: bool = True
    performance_degradations: List[str] = field(default_factory=list)

    # Overall details
    details: Dict[str, Any] = field(default_factory=dict)
    monitored_at: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )

    @property
    def issues(self) -> List[str]:
        """Collect all issues found"""
        issues = []
        issues.extend(self.regression_failures)
        issues.extend(self.visual_anomalies)
        issues.extend(self.performance_degradations)
        return issues


# Type aliases for clarity
Tier = int  # 1, 2, or 3
CommitSHA = str  # Git commit hash
