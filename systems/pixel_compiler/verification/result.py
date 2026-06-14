"""
Verification result types for PixelRTS verification system.

Provides VerificationStatus enum and result dataclasses for clear pass/fail reporting.
Follows patterns from infinite_map_integrity.py (IntegrityReport, IntegrityStatus).
"""

import json
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any


class VerificationStatus(Enum):
    """Status of a verification step or overall verification."""
    PASS = "pass"
    FAIL = "fail"
    WARNING = "warning"
    SKIP = "skip"


@dataclass
class StepResult:
    """Result of a single verification step."""
    step_name: str
    status: VerificationStatus
    message: str
    details: dict[str, Any] = field(default_factory=dict)
    duration_ms: float = 0.0

    def is_pass(self) -> bool:
        """Check if this step passed."""
        return self.status == VerificationStatus.PASS

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "step_name": self.step_name,
            "status": self.status.value,
            "message": self.message,
            "details": self.details,
            "duration_ms": self.duration_ms
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "StepResult":
        """Create from dictionary."""
        return cls(
            step_name=data["step_name"],
            status=VerificationStatus(data["status"]),
            message=data["message"],
            details=data.get("details", {}),
            duration_ms=data.get("duration_ms", 0.0)
        )


@dataclass
class VerificationResult:
    """
    Result of a complete verification run.

    Contains overall status and all individual step results.
    Follows IntegrityReport pattern from infinite_map_integrity.py.
    """
    overall_status: VerificationStatus
    steps: list[StepResult]
    file_path: str
    timestamp: datetime

    def is_pass(self) -> bool:
        """Check if overall verification passed."""
        return self.overall_status == VerificationStatus.PASS

    @property
    def pass_count(self) -> int:
        """Count of passing steps."""
        return sum(1 for s in self.steps if s.status == VerificationStatus.PASS)

    @property
    def fail_count(self) -> int:
        """Count of failing steps."""
        return sum(1 for s in self.steps if s.status == VerificationStatus.FAIL)

    @property
    def warning_count(self) -> int:
        """Count of warning steps."""
        return sum(1 for s in self.steps if s.status == VerificationStatus.WARNING)

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "overall_status": self.overall_status.value,
            "file_path": self.file_path,
            "timestamp": self.timestamp.isoformat(),
            "steps": [s.to_dict() for s in self.steps],
            "summary": {
                "total": len(self.steps),
                "passed": self.pass_count,
                "failed": self.fail_count,
                "warnings": self.warning_count
            }
        }

    def to_json(self, indent: int = 2) -> str:
        """Convert to JSON string."""
        return json.dumps(self.to_dict(), indent=indent)

    def format_cli(self, verbose: bool = False) -> str:
        """
        Format result for CLI output.

        Provides human-readable summary with optional verbose output.
        """
        lines = []

        # Overall status header
        status_emoji = {
            VerificationStatus.PASS: "[PASS]",
            VerificationStatus.FAIL: "[FAIL]",
            VerificationStatus.WARNING: "[WARN]",
            VerificationStatus.SKIP: "[SKIP]"
        }

        status_str = status_emoji.get(self.overall_status, "[????]")
        lines.append(f"\n{status_str} Verification: {self.file_path}")
        lines.append("=" * 60)

        # Summary
        lines.append(f"Steps: {self.pass_count}/{len(self.steps)} passed")
        if self.fail_count > 0:
            lines.append(f"  Failed: {self.fail_count}")
        if self.warning_count > 0:
            lines.append(f"  Warnings: {self.warning_count}")

        # Verbose output shows each step
        if verbose:
            lines.append("")
            lines.append("Step Details:")
            for step in self.steps:
                step_status = status_emoji.get(step.status, "[????]")
                lines.append(f"  {step_status} {step.step_name}")
                lines.append(f"       {step.message}")
                if step.details and step.status != VerificationStatus.PASS:
                    for key, value in step.details.items():
                        lines.append(f"       - {key}: {value}")
        else:
            # Non-verbose: show only failures and warnings
            issues = [s for s in self.steps
                      if s.status in (VerificationStatus.FAIL, VerificationStatus.WARNING)]
            if issues:
                lines.append("")
                lines.append("Issues:")
                for step in issues:
                    step_status = status_emoji.get(step.status, "[????]")
                    lines.append(f"  {step_status} {step.step_name}: {step.message}")

        lines.append("")
        return "\n".join(lines)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "VerificationResult":
        """Create from dictionary."""
        return cls(
            overall_status=VerificationStatus(data["overall_status"]),
            file_path=data["file_path"],
            timestamp=datetime.fromisoformat(data["timestamp"]),
            steps=[StepResult.from_dict(s) for s in data.get("steps", [])]
        )
