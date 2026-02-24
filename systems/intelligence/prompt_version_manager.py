#!/usr/bin/env python3
"""
Prompt Version Manager
======================

Provides git-like versioning for LLM system prompts with:
- Rolling history (configurable max versions)
- Atomic commits with metadata
- Rollback to previous versions
- Quality metrics tracking
- Diff visualization

This addresses the recursive stability concern (0.88 score) in the RPE system
by ensuring no prompt change is irreversible.

Usage:
    from systems.intelligence.prompt_version_manager import PromptVersionManager

    manager = PromptVersionManager(max_versions=20)

    # Commit new prompt
    version_id = manager.commit(
        prompt="You are an optimized architect...",
        metrics={"latency_improvement": 0.15, "source": "gemini_oracle"}
    )

    # Check if rollback needed
    if current_metrics["latency"] > baseline["latency"] * 1.2:
        manager.rollback(steps=1)

    # Get diff between versions
    diff = manager.diff("v5", "v3")
"""

import os
import json
import time
import difflib
import logging
from datetime import datetime
from typing import Optional, Dict, List, Any, Tuple
from dataclasses import dataclass, field, asdict
from pathlib import Path
from collections import deque
import hashlib

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [PVM] %(message)s')
logger = logging.getLogger(__name__)


@dataclass
class PromptVersion:
    """Represents a single versioned prompt."""
    id: str
    prompt: str
    timestamp: float
    metrics: Dict[str, Any] = field(default_factory=dict)
    parent_id: Optional[str] = None
    message: str = ""
    checksum: str = ""

    def __post_init__(self):
        if not self.checksum:
            self.checksum = self._compute_checksum(self.prompt)

    @staticmethod
    def _compute_checksum(text: str) -> str:
        """Compute SHA256 checksum of prompt text."""
        return hashlib.sha256(text.encode('utf-8')).hexdigest()[:12]

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'PromptVersion':
        return cls(**data)


@dataclass
class RollbackResult:
    """Result of a rollback operation."""
    success: bool
    version_id: str
    prompt: str
    message: str
    rolled_back_from: str


class PromptVersionManager:
    """
    Manages versioned prompt history with rollback capability.

    Features:
    - Rolling history with configurable max versions
    - Atomic commits with metadata
    - Rollback to any previous version
    - Quality metrics tracking per version
    - Diff visualization between versions
    - Persistence to JSON file

    Example:
        >>> manager = PromptVersionManager(max_versions=10)
        >>> v1 = manager.commit("Original prompt", metrics={"latency": 5000})
        >>> v2 = manager.commit("Optimized prompt", metrics={"latency": 3000})
        >>> manager.rollback()  # Back to v1
    """

    DEFAULT_STORAGE_PATH = "prompt_versions.json"

    def __init__(
        self,
        max_versions: int = 20,
        storage_path: Optional[str] = None,
        auto_save: bool = True
    ):
        """
        Initialize the PromptVersionManager.

        Args:
            max_versions: Maximum number of versions to keep (rolling window)
            storage_path: Path to JSON file for persistence (None = no persistence)
            auto_save: Automatically save after each commit/rollback
        """
        self.max_versions = max_versions
        self.storage_path = Path(storage_path) if storage_path else None
        self.auto_save = auto_save

        # Version storage - use deque for rolling window
        self._versions: deque = deque(maxlen=max_versions)
        self._version_index: Dict[str, PromptVersion] = {}  # id -> version
        self._current_id: Optional[str] = None

        # Metrics tracking
        self._baseline_metrics: Dict[str, Any] = {}
        self._regression_threshold = 1.2  # 20% worse = regression

        # Load existing versions if storage exists
        if self.storage_path and self.storage_path.exists():
            self._load()

        logger.info(f"PromptVersionManager initialized (max_versions={max_versions})")

    # =========================================================================
    # CORE OPERATIONS
    # =========================================================================

    def commit(
        self,
        prompt: str,
        metrics: Optional[Dict[str, Any]] = None,
        message: str = ""
    ) -> str:
        """
        Commit a new prompt version.

        Args:
            prompt: The prompt text to version
            metrics: Optional metrics associated with this version
            message: Optional commit message describing the change

        Returns:
            str: The new version ID

        Raises:
            ValueError: If prompt is empty or identical to current version
        """
        if not prompt or not prompt.strip():
            raise ValueError("Cannot commit empty prompt")

        # Check for duplicate
        if self._current_id and self._version_index.get(self._current_id):
            current = self._version_index[self._current_id]
            if current.checksum == PromptVersion._compute_checksum(prompt):
                logger.warning("Prompt unchanged, skipping commit")
                return self._current_id

        # Generate version ID
        version_num = len(self._versions) + 1
        version_id = f"v{version_num}"

        # Create version
        version = PromptVersion(
            id=version_id,
            prompt=prompt,
            timestamp=time.time(),
            metrics=metrics or {},
            parent_id=self._current_id,
            message=message
        )

        # If at capacity, remove oldest from index
        if len(self._versions) == self.max_versions:
            oldest = self._versions[0]
            if oldest.id in self._version_index:
                del self._version_index[oldest.id]
            logger.debug(f"Evicted oldest version: {oldest.id}")

        # Add to storage
        self._versions.append(version)
        self._version_index[version_id] = version
        self._current_id = version_id

        # Set baseline if first version
        if len(self._versions) == 1 and metrics:
            self._baseline_metrics = metrics.copy()

        logger.info(f"Committed version {version_id}: {message or 'no message'}")

        # Auto-save
        if self.auto_save:
            self._save()

        return version_id

    def rollback(self, steps: int = 1) -> RollbackResult:
        """
        Rollback to a previous version.

        Args:
            steps: Number of versions to go back (default: 1)

        Returns:
            RollbackResult: Result of the rollback operation

        Raises:
            ValueError: If insufficient history or invalid steps
        """
        if steps < 1:
            raise ValueError("Steps must be >= 1")

        # Find current position
        current_idx = self._find_version_index(self._current_id)
        if current_idx is None:
            raise ValueError("No current version set")

        target_idx = current_idx - steps
        if target_idx < 0:
            raise ValueError(
                f"Cannot rollback {steps} steps: only {current_idx + 1} versions available"
            )

        # Get versions
        current_version = self._versions[current_idx]
        target_version = self._versions[target_idx]

        # Update current
        old_id = self._current_id
        self._current_id = target_version.id

        logger.info(f"Rolled back from {old_id} to {target_version.id}")

        result = RollbackResult(
            success=True,
            version_id=target_version.id,
            prompt=target_version.prompt,
            message=f"Rolled back {steps} step(s) from {old_id}",
            rolled_back_from=old_id
        )

        # Auto-save
        if self.auto_save:
            self._save()

        return result

    def rollback_to(self, version_id: str) -> RollbackResult:
        """
        Rollback to a specific version by ID.

        Args:
            version_id: The target version ID

        Returns:
            RollbackResult: Result of the rollback operation

        Raises:
            ValueError: If version not found
        """
        if version_id not in self._version_index:
            raise ValueError(f"Version not found: {version_id}")

        target_idx = self._find_version_index(version_id)
        current_idx = self._find_version_index(self._current_id)

        if current_idx is None:
            raise ValueError("No current version set")

        steps = current_idx - target_idx
        return self.rollback(steps)

    # =========================================================================
    # QUERY OPERATIONS
    # =========================================================================

    def get_current(self) -> Optional[PromptVersion]:
        """Get the current (active) version."""
        if self._current_id and self._current_id in self._version_index:
            return self._version_index[self._current_id]
        return None

    def get_current_prompt(self) -> Optional[str]:
        """Get the current prompt text."""
        current = self.get_current()
        return current.prompt if current else None

    def get_version(self, version_id: str) -> Optional[PromptVersion]:
        """Get a specific version by ID."""
        return self._version_index.get(version_id)

    def list_versions(self, limit: int = 10) -> List[PromptVersion]:
        """
        List recent versions.

        Args:
            limit: Maximum number of versions to return

        Returns:
            List of PromptVersion objects (most recent first)
        """
        versions = list(self._versions)
        versions.reverse()  # Most recent first
        return versions[:limit]

    def get_history(self) -> List[Dict[str, Any]]:
        """Get version history as list of dicts (for JSON serialization)."""
        return [v.to_dict() for v in self.list_versions(limit=self.max_versions)]

    # =========================================================================
    # DIFF OPERATIONS
    # =========================================================================

    def diff(
        self,
        version_id_a: str,
        version_id_b: str
    ) -> Dict[str, Any]:
        """
        Compute diff between two versions.

        Args:
            version_id_a: First version ID
            version_id_b: Second version ID

        Returns:
            Dict with diff details
        """
        version_a = self._version_index.get(version_id_a)
        version_b = self._version_index.get(version_id_b)

        if not version_a:
            raise ValueError(f"Version not found: {version_id_a}")
        if not version_b:
            raise ValueError(f"Version not found: {version_id_b}")

        # Compute unified diff
        lines_a = version_a.prompt.splitlines(keepends=True)
        lines_b = version_b.prompt.splitlines(keepends=True)

        diff_lines = list(difflib.unified_diff(
            lines_a,
            lines_b,
            fromfile=version_id_a,
            tofile=version_id_b,
            lineterm=''
        ))

        # Compute similarity ratio
        similarity = difflib.SequenceMatcher(
            None,
            version_a.prompt,
            version_b.prompt
        ).ratio()

        return {
            "version_a": version_id_a,
            "version_b": version_id_b,
            "diff": ''.join(diff_lines),
            "similarity": similarity,
            "added_lines": sum(1 for line in diff_lines if line.startswith('+') and not line.startswith('+++')),
            "removed_lines": sum(1 for line in diff_lines if line.startswith('-') and not line.startswith('---')),
            "timestamp_a": version_a.timestamp,
            "timestamp_b": version_b.timestamp
        }

    def diff_from_previous(self, version_id: str) -> Optional[Dict[str, Any]]:
        """Get diff between a version and its parent."""
        version = self._version_index.get(version_id)
        if not version or not version.parent_id:
            return None

        return self.diff(version.parent_id, version_id)

    # =========================================================================
    # REGRESSION DETECTION
    # =========================================================================

    def detect_regression(
        self,
        current_metrics: Dict[str, Any],
        threshold: Optional[float] = None
    ) -> Tuple[bool, str]:
        """
        Detect if current metrics indicate a regression.

        Args:
            current_metrics: Current performance metrics
            threshold: Regression threshold (default: self._regression_threshold)

        Returns:
            Tuple of (is_regression, reason)
        """
        threshold = threshold or self._regression_threshold

        if not self._baseline_metrics:
            return False, "No baseline metrics set"

        # Check latency regression
        if "latency" in current_metrics and "latency" in self._baseline_metrics:
            baseline_latency = self._baseline_metrics["latency"]
            current_latency = current_metrics["latency"]

            if current_latency > baseline_latency * threshold:
                return True, (
                    f"Latency regression: {current_latency:.0f}ms vs "
                    f"baseline {baseline_latency:.0f}ms "
                    f"(+{((current_latency/baseline_latency)-1)*100:.1f}%)"
                )

        # Check error rate regression
        if "error_rate" in current_metrics and "error_rate" in self._baseline_metrics:
            baseline_rate = self._baseline_metrics["error_rate"]
            current_rate = current_metrics["error_rate"]

            if current_rate > baseline_rate * threshold:
                return True, (
                    f"Error rate regression: {current_rate:.2%} vs "
                    f"baseline {baseline_rate:.2%}"
                )

        return False, "No regression detected"

    def auto_rollback_on_regression(
        self,
        current_metrics: Dict[str, Any],
        threshold: Optional[float] = None
    ) -> Optional[RollbackResult]:
        """
        Automatically rollback if regression detected.

        Args:
            current_metrics: Current performance metrics
            threshold: Regression threshold

        Returns:
            RollbackResult if rollback performed, None otherwise
        """
        is_regression, reason = self.detect_regression(current_metrics, threshold)

        if is_regression:
            logger.warning(f"Regression detected: {reason}")
            logger.info("Initiating automatic rollback...")
            return self.rollback(steps=1)

        return None

    # =========================================================================
    # PERSISTENCE
    # =========================================================================

    def _save(self) -> bool:
        """Save versions to JSON file."""
        if not self.storage_path:
            return False

        try:
            data = {
                "versions": [v.to_dict() for v in self._versions],
                "current_id": self._current_id,
                "baseline_metrics": self._baseline_metrics,
                "max_versions": self.max_versions,
                "saved_at": time.time()
            }

            # Atomic write: write to temp, then rename
            temp_path = self.storage_path.with_suffix('.tmp')
            with open(temp_path, 'w') as f:
                json.dump(data, f, indent=2, default=str)

            temp_path.replace(self.storage_path)
            logger.debug(f"Saved {len(self._versions)} versions to {self.storage_path}")
            return True

        except Exception as e:
            logger.error(f"Failed to save versions: {e}")
            return False

    def _load(self) -> bool:
        """Load versions from JSON file."""
        if not self.storage_path or not self.storage_path.exists():
            return False

        try:
            with open(self.storage_path, 'r') as f:
                data = json.load(f)

            # Restore versions
            self._versions.clear()
            self._version_index.clear()

            for v_data in data.get("versions", []):
                version = PromptVersion.from_dict(v_data)
                self._versions.append(version)
                self._version_index[version.id] = version

            self._current_id = data.get("current_id")
            self._baseline_metrics = data.get("baseline_metrics", {})

            logger.info(f"Loaded {len(self._versions)} versions from {self.storage_path}")
            return True

        except Exception as e:
            logger.error(f"Failed to load versions: {e}")
            return False

    def export(self, path: str) -> bool:
        """Export versions to a separate file."""
        old_path = self.storage_path
        old_auto_save = self.auto_save

        self.storage_path = Path(path)
        result = self._save()

        self.storage_path = old_path
        self.auto_save = old_auto_save

        return result

    # =========================================================================
    # UTILITY
    # =========================================================================

    def _find_version_index(self, version_id: Optional[str]) -> Optional[int]:
        """Find the index of a version in the deque."""
        if not version_id:
            return None

        for i, v in enumerate(self._versions):
            if v.id == version_id:
                return i

        return None

    def __len__(self) -> int:
        return len(self._versions)

    def __bool__(self) -> bool:
        """Always return True - manager is valid regardless of version count."""
        return True

    def __contains__(self, version_id: str) -> bool:
        return version_id in self._version_index

    def __repr__(self) -> str:
        return (
            f"PromptVersionManager("
            f"versions={len(self._versions)}, "
            f"current={self._current_id}, "
            f"max={self.max_versions})"
        )


# =============================================================================
# INTEGRATION HELPER
# =============================================================================

class HybridBridgeVersioned:
    """
    Versioned wrapper for HybridBridge prompts.

    This class wraps the HybridBridge to add version management
    to its system prompt updates.

    Usage:
        bridge = HybridBridge()
        versioned = HybridBridgeVersioned(bridge)

        # Update with versioning
        versioned.update_prompt("New optimized prompt", metrics={"latency": 3000})

        # Rollback if needed
        versioned.rollback()
    """

    def __init__(
        self,
        hybrid_bridge,
        max_versions: int = 20,
        storage_path: str = "prompt_versions.json"
    ):
        """
        Initialize versioned bridge wrapper.

        Args:
            hybrid_bridge: The HybridBridge instance to wrap
            max_versions: Maximum prompt versions to keep
            storage_path: Path for version persistence
        """
        self.bridge = hybrid_bridge
        self.version_manager = PromptVersionManager(
            max_versions=max_versions,
            storage_path=storage_path
        )

        # Commit current prompt as initial version
        current_prompt = hybrid_bridge.config.get('system_prompt', '')
        if current_prompt:
            self.version_manager.commit(
                current_prompt,
                metrics={"source": "initial"},
                message="Initial prompt from HybridBridge"
            )

    def update_prompt(
        self,
        new_prompt: str,
        metrics: Optional[Dict[str, Any]] = None,
        message: str = ""
    ) -> str:
        """
        Update the system prompt with versioning.

        Args:
            new_prompt: The new prompt text
            metrics: Metrics from evolution
            message: Commit message

        Returns:
            str: Version ID of the new prompt
        """
        # Commit to version manager
        version_id = self.version_manager.commit(
            prompt=new_prompt,
            metrics=metrics,
            message=message
        )

        # Apply to bridge
        self.bridge.update_system_prompt(new_prompt)

        logger.info(f"Applied versioned prompt: {version_id}")
        return version_id

    def rollback(self, steps: int = 1) -> RollbackResult:
        """
        Rollback to a previous prompt version.

        Args:
            steps: Number of versions to go back

        Returns:
            RollbackResult: Result of rollback
        """
        result = self.version_manager.rollback(steps)

        if result.success:
            # Apply rolled-back prompt to bridge
            self.bridge.update_system_prompt(result.prompt)
            logger.info(f"Applied rolled-back prompt: {result.version_id}")

        return result

    def auto_rollback_on_regression(
        self,
        current_metrics: Dict[str, Any]
    ) -> Optional[RollbackResult]:
        """
        Auto-rollback if metrics indicate regression.

        Args:
            current_metrics: Current performance metrics

        Returns:
            RollbackResult if rollback performed, None otherwise
        """
        result = self.version_manager.auto_rollback_on_regression(current_metrics)

        if result and result.success:
            self.bridge.update_system_prompt(result.prompt)

        return result

    def get_version_manager(self) -> PromptVersionManager:
        """Get the underlying PromptVersionManager."""
        return self.version_manager


# =============================================================================
# MAIN (Demo/Testing)
# =============================================================================

if __name__ == "__main__":
    print("=" * 60)
    print("Prompt Version Manager - Demo")
    print("=" * 60)

    # Create manager with persistence
    manager = PromptVersionManager(
        max_versions=5,
        storage_path="demo_prompt_versions.json",
        auto_save=True
    )

    # Commit some versions
    print("\n📝 Committing versions...")

    v1 = manager.commit(
        "You are a helpful AI assistant.",
        metrics={"latency": 5000, "error_rate": 0.01},
        message="Initial prompt"
    )
    print(f"  Committed: {v1}")

    v2 = manager.commit(
        "You are an optimized AI assistant focused on speed.",
        metrics={"latency": 3000, "error_rate": 0.005},
        message="Optimized for speed"
    )
    print(f"  Committed: {v2}")

    v3 = manager.commit(
        "You are a highly detailed AI assistant focused on accuracy.",
        metrics={"latency": 8000, "error_rate": 0.002},
        message="Optimized for accuracy (but slower)"
    )
    print(f"  Committed: {v3}")

    # List versions
    print("\n📋 Version History:")
    for v in manager.list_versions():
        timestamp = datetime.fromtimestamp(v.timestamp).strftime('%Y-%m-%d %H:%M:%S')
        print(f"  {v.id}: [{timestamp}] {v.message or 'no message'}")
        if v.metrics:
            print(f"       latency={v.metrics.get('latency')}ms, errors={v.metrics.get('error_rate')}")

    # Detect regression
    print("\n🔍 Regression Detection:")
    current_metrics = {"latency": 10000, "error_rate": 0.001}  # High latency!
    is_regression, reason = manager.detect_regression(current_metrics)
    print(f"  Regression: {is_regression}")
    print(f"  Reason: {reason}")

    # Auto-rollback
    print("\n⏪ Auto-Rollback on Regression:")
    result = manager.auto_rollback_on_regression(current_metrics)
    if result:
        print(f"  Rolled back to: {result.version_id}")
        print(f"  Message: {result.message}")

    # Show current
    print(f"\n📍 Current Version: {manager.get_current().id}")
    print(f"   Prompt: {manager.get_current_prompt()[:50]}...")

    # Diff
    print("\n🔍 Diff between v1 and v3:")
    diff_result = manager.diff("v1", "v3")
    print(f"  Similarity: {diff_result['similarity']:.1%}")
    print(f"  Changes: +{diff_result['added_lines']} -{diff_result['removed_lines']} lines")

    # Cleanup
    Path("demo_prompt_versions.json").unlink(missing_ok=True)
    print("\n✅ Demo complete!")
