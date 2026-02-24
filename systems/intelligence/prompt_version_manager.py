#!/usr/bin/env python3
"""
Prompt Version Manager
======================

Git-like versioning for LLM system prompts with rollback capability.
Part of the RPE Stability Suite for safe recursive prompt evolution.

Features:
- Commit prompts with version IDs
- Rollback to previous versions
- Regression detection via metrics comparison
- Auto-save to persistent storage
"""

import json
import logging
import time
import uuid
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any

logger = logging.getLogger("PromptVersionManager")


@dataclass
class PromptVersion:
    """Represents a single prompt version."""
    id: str
    prompt: str
    timestamp: float
    message: str = ""
    metrics: Dict[str, Any] = field(default_factory=dict)
    parent_id: Optional[str] = None

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "prompt": self.prompt,
            "timestamp": self.timestamp,
            "message": self.message,
            "metrics": self.metrics,
            "parent_id": self.parent_id
        }

    @classmethod
    def from_dict(cls, data: dict) -> "PromptVersion":
        return cls(
            id=data["id"],
            prompt=data["prompt"],
            timestamp=data["timestamp"],
            message=data.get("message", ""),
            metrics=data.get("metrics", {}),
            parent_id=data.get("parent_id")
        )


@dataclass
class RollbackResult:
    """Result of a rollback operation."""
    success: bool
    version_id: Optional[str] = None
    prompt: Optional[str] = None
    message: str = ""


class PromptVersionManager:
    """
    Git-like versioning for system prompts.

    Provides:
    - Version tracking with commit/rollback
    - Regression detection via metrics
    - Persistent storage
    """

    DEFAULT_MAX_VERSIONS = 20

    def __init__(
        self,
        max_versions: int = None,
        storage_path: str = "prompt_versions.json",
        auto_save: bool = True
    ):
        """
        Initialize the version manager.

        Args:
            max_versions: Maximum versions to keep (default: 20)
            storage_path: Path to persistent storage file
            auto_save: Auto-save on every commit (default: True)
        """
        self.max_versions = max_versions if max_versions is not None else self.DEFAULT_MAX_VERSIONS
        self.storage_path = Path(storage_path) if storage_path else None
        self.auto_save = auto_save

        self._versions: List[PromptVersion] = []
        self._current_index: int = -1

        self._load_state()
        logger.info(f"PromptVersionManager initialized: {len(self._versions)} versions, max={self.max_versions}")

    def __len__(self) -> int:
        """Return number of stored versions."""
        return len(self._versions)

    def __bool__(self) -> bool:
        """Always return True - manager is valid regardless of version count."""
        return True

    def _load_state(self):
        """Load versions from persistent storage."""
        if not self.storage_path or not self.storage_path.exists():
            return

        try:
            with open(self.storage_path, 'r') as f:
                data = json.load(f)
                self._versions = [PromptVersion.from_dict(v) for v in data.get("versions", [])]
                self._current_index = data.get("current_index", -1)
                if self._versions and self._current_index < 0:
                    self._current_index = len(self._versions) - 1
            logger.debug(f"Loaded {len(self._versions)} versions from {self.storage_path}")
        except Exception as e:
            logger.error(f"Failed to load version state: {e}")

    def _save_state(self):
        """Save versions to persistent storage."""
        if not self.storage_path:
            return

        try:
            data = {
                "versions": [v.to_dict() for v in self._versions],
                "current_index": self._current_index
            }
            with open(self.storage_path, 'w') as f:
                json.dump(data, f, indent=2)
            logger.debug(f"Saved {len(self._versions)} versions to {self.storage_path}")
        except Exception as e:
            logger.error(f"Failed to save version state: {e}")

    def commit(
        self,
        prompt: str,
        metrics: Dict[str, Any] = None,
        message: str = ""
    ) -> str:
        """
        Commit a new prompt version.

        Args:
            prompt: The prompt text
            metrics: Optional metrics for regression detection
            message: Optional commit message

        Returns:
            str: Version ID of the new commit
        """
        version_id = f"v{int(time.time())}_{uuid.uuid4().hex[:8]}"

        parent_id = None
        if self._versions:
            parent_id = self._versions[-1].id

        version = PromptVersion(
            id=version_id,
            prompt=prompt,
            timestamp=time.time(),
            message=message,
            metrics=metrics or {},
            parent_id=parent_id
        )

        self._versions.append(version)
        self._current_index = len(self._versions) - 1

        # Enforce max versions limit
        while len(self._versions) > self.max_versions:
            removed = self._versions.pop(0)
            logger.debug(f"Removed old version: {removed.id}")
            self._current_index -= 1

        if self.auto_save:
            self._save_state()

        logger.info(f"Committed prompt version: {version_id}")
        return version_id

    def get_current(self) -> Optional[PromptVersion]:
        """Get the current (latest) version."""
        if not self._versions or self._current_index < 0:
            return None
        return self._versions[self._current_index]

    def get_version(self, version_id: str) -> Optional[PromptVersion]:
        """Get a specific version by ID."""
        for v in self._versions:
            if v.id == version_id:
                return v
        return None

    def list_versions(self, limit: int = 10) -> List[PromptVersion]:
        """
        List recent versions.

        Args:
            limit: Maximum number of versions to return

        Returns:
            List of PromptVersion objects (most recent first)
        """
        return list(reversed(self._versions[-limit:]))

    def rollback(self, steps: int = 1) -> RollbackResult:
        """
        Rollback to a previous version.

        Args:
            steps: Number of versions to go back (default: 1)

        Returns:
            RollbackResult with success status and version info
        """
        if not self._versions:
            return RollbackResult(
                success=False,
                message="No versions available for rollback"
            )

        target_index = self._current_index - steps

        if target_index < 0:
            return RollbackResult(
                success=False,
                message=f"Cannot rollback {steps} steps - only {self._current_index + 1} versions available"
            )

        self._current_index = target_index
        version = self._versions[self._current_index]

        if self.auto_save:
            self._save_state()

        logger.info(f"Rolled back to version: {version.id}")
        return RollbackResult(
            success=True,
            version_id=version.id,
            prompt=version.prompt,
            message=f"Rolled back to {version.id}"
        )

    def rollback_to(self, version_id: str) -> RollbackResult:
        """
        Rollback to a specific version by ID.

        Args:
            version_id: The version ID to rollback to

        Returns:
            RollbackResult with success status
        """
        for i, v in enumerate(self._versions):
            if v.id == version_id:
                self._current_index = i
                if self.auto_save:
                    self._save_state()
                logger.info(f"Rolled back to version: {version_id}")
                return RollbackResult(
                    success=True,
                    version_id=v.id,
                    prompt=v.prompt,
                    message=f"Rolled back to {version_id}"
                )

        return RollbackResult(
            success=False,
            message=f"Version not found: {version_id}"
        )

    def detect_regression(
        self,
        thresholds: Dict[str, float]
    ) -> Tuple[bool, str]:
        """
        Detect if the latest version shows regression compared to previous.

        Args:
            thresholds: Dict of metric name -> threshold value
                       (e.g., {"latency": 1000} means regression if latency > 1000ms)

        Returns:
            Tuple of (is_regression: bool, reason: str)
        """
        if len(self._versions) < 2:
            return False, "Not enough versions for comparison"

        current = self._versions[-1]
        previous = self._versions[-2]

        for metric_name, threshold in thresholds.items():
            current_val = current.metrics.get(metric_name)
            previous_val = previous.metrics.get(metric_name)

            if current_val is not None and current_val > threshold:
                return True, f"{metric_name} ({current_val}) exceeds threshold ({threshold})"

            if current_val is not None and previous_val is not None:
                # Also flag if metric got significantly worse
                if current_val > previous_val * 1.5:  # 50% worse
                    return True, f"{metric_name} degraded by >50%: {previous_val} -> {current_val}"

        return False, "No regression detected"

    def clear(self):
        """Clear all versions."""
        self._versions = []
        self._current_index = -1
        if self.auto_save:
            self._save_state()
        logger.info("Cleared all prompt versions")


def main():
    """Demo of PromptVersionManager."""
    print("📝 Prompt Version Manager Demo")
    print("=" * 40)

    manager = PromptVersionManager(max_versions=10, auto_save=False)

    # Commit some versions
    v1 = manager.commit(
        prompt="You are a helpful assistant.",
        message="Initial prompt"
    )
    print(f"Committed: {v1}")

    v2 = manager.commit(
        prompt="You are a Global Architect. Provide high-level guidance.",
        message="Added architect role",
        metrics={"response_quality": 0.85}
    )
    print(f"Committed: {v2}")

    v3 = manager.commit(
        prompt="You are a Global Architect. Be concise and helpful.",
        message="Added conciseness",
        metrics={"response_quality": 0.92}
    )
    print(f"Committed: {v3}")

    # List versions
    print("\n📋 Version History:")
    for v in manager.list_versions():
        print(f"  {v.id}: {v.message or '(no message)'}")

    # Test rollback
    print("\n⏪ Testing Rollback...")
    result = manager.rollback(1)
    if result.success:
        print(f"  Rolled back to: {result.version_id}")
        print(f"  Prompt: {result.prompt[:50]}...")

    # Current version
    current = manager.get_current()
    print(f"\n📍 Current Version: {current.id}")

    # Regression detection
    is_reg, reason = manager.detect_regression({"latency": 1000})
    print(f"\n🔍 Regression Check: {is_reg} - {reason}")

    print("\n✅ Demo complete!")


if __name__ == "__main__":
    main()
