#!/usr/bin/env python3
"""
Tests for Prompt Version Manager

Run with: pytest systems/intelligence/tests/test_prompt_version_manager.py -v
"""

import os
import sys
import json
import time
import tempfile
import unittest
from pathlib import Path

# Direct import from the module file to avoid package import issues
import importlib.util
spec = importlib.util.spec_from_file_location(
    "prompt_version_manager",
    os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "prompt_version_manager.py")
)
pvm = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pvm)

PromptVersionManager = pvm.PromptVersionManager
PromptVersion = pvm.PromptVersion
RollbackResult = pvm.RollbackResult
HybridBridgeVersioned = pvm.HybridBridgeVersioned


class TestPromptVersion(unittest.TestCase):
    """Tests for PromptVersion dataclass."""

    def test_create_version(self):
        """Test creating a version."""
        version = PromptVersion(
            id="v1",
            prompt="Test prompt",
            timestamp=time.time(),
            metrics={"latency": 1000}
        )

        self.assertEqual(version.id, "v1")
        self.assertEqual(version.prompt, "Test prompt")
        self.assertEqual(version.metrics["latency"], 1000)
        self.assertIsNotNone(version.checksum)

    def test_checksum_consistency(self):
        """Test that same prompt produces same checksum."""
        version1 = PromptVersion(id="v1", prompt="Same", timestamp=1.0)
        version2 = PromptVersion(id="v2", prompt="Same", timestamp=2.0)

        self.assertEqual(version1.checksum, version2.checksum)

    def test_checksum_different(self):
        """Test that different prompts produce different checksums."""
        version1 = PromptVersion(id="v1", prompt="First", timestamp=1.0)
        version2 = PromptVersion(id="v2", prompt="Second", timestamp=2.0)

        self.assertNotEqual(version1.checksum, version2.checksum)

    def test_to_dict_from_dict(self):
        """Test serialization round-trip."""
        original = PromptVersion(
            id="v1",
            prompt="Test",
            timestamp=time.time(),
            metrics={"key": "value"},
            parent_id="v0",
            message="Test message"
        )

        data = original.to_dict()
        restored = PromptVersion.from_dict(data)

        self.assertEqual(original.id, restored.id)
        self.assertEqual(original.prompt, restored.prompt)
        self.assertEqual(original.timestamp, restored.timestamp)
        self.assertEqual(original.metrics, restored.metrics)
        self.assertEqual(original.parent_id, restored.parent_id)
        self.assertEqual(original.message, restored.message)


class TestPromptVersionManager(unittest.TestCase):
    """Tests for PromptVersionManager."""

    def setUp(self):
        """Create a fresh manager for each test."""
        self.manager = PromptVersionManager(max_versions=10)

    def test_init(self):
        """Test manager initialization."""
        self.assertEqual(len(self.manager), 0)
        self.assertIsNone(self.manager.get_current())

    def test_commit_single(self):
        """Test committing a single version."""
        version_id = self.manager.commit("First prompt")

        self.assertEqual(len(self.manager), 1)
        self.assertEqual(version_id, "v1")
        self.assertEqual(self.manager.get_current_prompt(), "First prompt")

    def test_commit_multiple(self):
        """Test committing multiple versions."""
        v1 = self.manager.commit("First")
        v2 = self.manager.commit("Second")
        v3 = self.manager.commit("Third")

        self.assertEqual(len(self.manager), 3)
        self.assertEqual(v1, "v1")
        self.assertEqual(v2, "v2")
        self.assertEqual(v3, "v3")
        self.assertEqual(self.manager.get_current_prompt(), "Third")

    def test_commit_empty_prompt_raises(self):
        """Test that empty prompt raises error."""
        with self.assertRaises(ValueError):
            self.manager.commit("")

        with self.assertRaises(ValueError):
            self.manager.commit("   ")

    def test_commit_unchanged_skipped(self):
        """Test that unchanged prompt is skipped."""
        self.manager.commit("Same")
        v2 = self.manager.commit("Same")  # Should skip

        self.assertEqual(len(self.manager), 1)
        self.assertEqual(v2, "v1")  # Returns existing ID

    def test_commit_with_metrics_and_message(self):
        """Test commit with metadata."""
        version_id = self.manager.commit(
            "Test",
            metrics={"latency": 5000},
            message="Initial commit"
        )

        version = self.manager.get_version(version_id)
        self.assertEqual(version.metrics["latency"], 5000)
        self.assertEqual(version.message, "Initial commit")

    def test_rollback_single(self):
        """Test rollback one step."""
        self.manager.commit("First")
        self.manager.commit("Second")

        result = self.manager.rollback()

        self.assertTrue(result.success)
        self.assertEqual(result.version_id, "v1")
        self.assertEqual(self.manager.get_current_prompt(), "First")

    def test_rollback_multiple_steps(self):
        """Test rollback multiple steps."""
        self.manager.commit("A")
        self.manager.commit("B")
        self.manager.commit("C")
        self.manager.commit("D")

        result = self.manager.rollback(steps=2)

        self.assertEqual(result.version_id, "v2")
        self.assertEqual(self.manager.get_current_prompt(), "B")

    def test_rollback_insufficient_history(self):
        """Test rollback with insufficient history."""
        self.manager.commit("Only one")

        with self.assertRaises(ValueError):
            self.manager.rollback(steps=1)

    def test_rollback_invalid_steps(self):
        """Test rollback with invalid steps."""
        with self.assertRaises(ValueError):
            self.manager.rollback(steps=0)

        with self.assertRaises(ValueError):
            self.manager.rollback(steps=-1)

    def test_rollback_to_specific_version(self):
        """Test rollback to specific version."""
        self.manager.commit("A")
        self.manager.commit("B")
        self.manager.commit("C")

        result = self.manager.rollback_to("v1")

        self.assertEqual(result.version_id, "v1")
        self.assertEqual(self.manager.get_current_prompt(), "A")

    def test_rollback_to_nonexistent_version(self):
        """Test rollback to nonexistent version."""
        self.manager.commit("A")

        with self.assertRaises(ValueError):
            self.manager.rollback_to("v999")

    def test_rolling_window_eviction(self):
        """Test that old versions are evicted when max reached."""
        manager = PromptVersionManager(max_versions=3)

        manager.commit("A")
        manager.commit("B")
        manager.commit("C")
        manager.commit("D")  # Should evict A

        self.assertEqual(len(manager), 3)
        self.assertIsNone(manager.get_version("v1"))  # Evicted
        self.assertIsNotNone(manager.get_version("v2"))  # Still present

    def test_list_versions(self):
        """Test listing versions (most recent first)."""
        self.manager.commit("A")
        time.sleep(0.01)
        self.manager.commit("B")
        time.sleep(0.01)
        self.manager.commit("C")

        versions = self.manager.list_versions()

        self.assertEqual(len(versions), 3)
        self.assertEqual(versions[0].id, "v3")  # Most recent first
        self.assertEqual(versions[2].id, "v1")

    def test_list_versions_with_limit(self):
        """Test listing versions with limit."""
        for i in range(5):
            self.manager.commit(f"Prompt {i}")

        versions = self.manager.list_versions(limit=2)

        self.assertEqual(len(versions), 2)
        self.assertEqual(versions[0].id, "v5")

    def test_get_version(self):
        """Test getting specific version."""
        self.manager.commit("A")
        self.manager.commit("B")

        version = self.manager.get_version("v1")

        self.assertEqual(version.prompt, "A")

    def test_get_nonexistent_version(self):
        """Test getting nonexistent version."""
        version = self.manager.get_version("v999")
        self.assertIsNone(version)

    def test_diff_similar(self):
        """Test diff between similar prompts."""
        self.manager.commit("The quick brown fox")
        self.manager.commit("The quick brown dog")

        diff = self.manager.diff("v1", "v2")

        self.assertGreater(diff["similarity"], 0.8)
        self.assertIn("fox", diff["diff"])
        self.assertIn("dog", diff["diff"])

    def test_diff_different(self):
        """Test diff between very different prompts."""
        self.manager.commit("Completely different first prompt")
        self.manager.commit("Totally unrelated second text")

        diff = self.manager.diff("v1", "v2")

        self.assertLess(diff["similarity"], 0.5)

    def test_diff_from_previous(self):
        """Test diff from parent version."""
        self.manager.commit("First")
        self.manager.commit("Second")

        diff = self.manager.diff_from_previous("v2")

        self.assertIsNotNone(diff)
        self.assertEqual(diff["version_a"], "v1")
        self.assertEqual(diff["version_b"], "v2")

    def test_diff_from_first_version(self):
        """Test diff from first version (no parent)."""
        self.manager.commit("First")

        diff = self.manager.diff_from_previous("v1")

        self.assertIsNone(diff)

    def test_regression_detection_no_baseline(self):
        """Test regression detection without baseline."""
        manager = PromptVersionManager()
        manager.commit("Test")  # No metrics

        is_reg, reason = manager.detect_regression({"latency": 1000})

        self.assertFalse(is_reg)
        self.assertIn("No baseline", reason)

    def test_regression_detection_no_regression(self):
        """Test regression detection with normal metrics."""
        self.manager.commit(
            "Test",
            metrics={"latency": 5000}
        )

        is_reg, reason = manager.detect_regression({"latency": 4000})

        self.assertFalse(is_reg)

    def test_regression_detection_latency_regression(self):
        """Test latency regression detection."""
        self.manager.commit(
            "Test",
            metrics={"latency": 5000}
        )

        # 20% threshold = 6000ms max
        is_reg, reason = self.manager.detect_regression({"latency": 7000})

        self.assertTrue(is_reg)
        self.assertIn("Latency regression", reason)

    def test_regression_detection_error_rate_regression(self):
        """Test error rate regression detection."""
        self.manager.commit(
            "Test",
            metrics={"error_rate": 0.01}
        )

        is_reg, reason = self.manager.detect_regression({"error_rate": 0.05})

        self.assertTrue(is_reg)
        self.assertIn("Error rate regression", reason)

    def test_auto_rollback_on_regression(self):
        """Test automatic rollback on regression."""
        self.manager.commit(
            "Good prompt",
            metrics={"latency": 3000}
        )
        self.manager.commit(
            "Bad prompt",
            metrics={"latency": 5000}
        )

        result = self.manager.auto_rollback_on_regression({"latency": 10000})

        self.assertIsNotNone(result)
        self.assertTrue(result.success)
        self.assertEqual(result.version_id, "v1")

    def test_auto_rollback_no_regression(self):
        """Test no auto-rollback when no regression."""
        self.manager.commit(
            "Test",
            metrics={"latency": 5000}
        )

        result = self.manager.auto_rollback_on_regression({"latency": 4000})

        self.assertIsNone(result)

    def test_persistence_save_load(self):
        """Test saving and loading from file."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            # Create and save
            manager1 = PromptVersionManager(
                max_versions=10,
                storage_path=temp_path,
                auto_save=True
            )
            manager1.commit("First", metrics={"latency": 1000})
            manager1.commit("Second", metrics={"latency": 2000})

            # Load in new manager
            manager2 = PromptVersionManager(storage_path=temp_path)

            self.assertEqual(len(manager2), 2)
            self.assertEqual(manager2.get_current_prompt(), "Second")
            self.assertEqual(manager2._baseline_metrics["latency"], 1000)

        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_export(self):
        """Test exporting to separate file."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            self.manager.commit("Test")
            self.manager.export(temp_path)

            self.assertTrue(Path(temp_path).exists())

            with open(temp_path) as f:
                data = json.load(f)

            self.assertEqual(len(data["versions"]), 1)

        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_contains(self):
        """Test __contains__ method."""
        self.manager.commit("Test")

        self.assertIn("v1", self.manager)
        self.assertNotIn("v999", self.manager)

    def test_repr(self):
        """Test __repr__ method."""
        self.manager.commit("Test")

        repr_str = repr(self.manager)

        self.assertIn("versions=1", repr_str)
        self.assertIn("current=v1", repr_str)


class TestHybridBridgeVersioned(unittest.TestCase):
    """Tests for HybridBridgeVersioned wrapper."""

    def test_wrapper_initialization(self):
        """Test wrapper initialization with mock bridge."""
        # Create mock bridge
        class MockBridge:
            def __init__(self):
                self.config = {"system_prompt": "Original prompt"}

            def update_system_prompt(self, prompt):
                self.config["system_prompt"] = prompt

        bridge = MockBridge()
        versioned = HybridBridgeVersioned(bridge, max_versions=5)

        self.assertEqual(len(versioned.get_version_manager()), 1)
        self.assertEqual(bridge.config["system_prompt"], "Original prompt")

    def test_update_prompt(self):
        """Test versioned prompt update."""
        class MockBridge:
            def __init__(self):
                self.config = {"system_prompt": ""}

            def update_system_prompt(self, prompt):
                self.config["system_prompt"] = prompt

        bridge = MockBridge()
        versioned = HybridBridgeVersioned(bridge)

        version_id = versioned.update_prompt(
            "New prompt",
            metrics={"latency": 3000},
            message="Optimization"
        )

        self.assertEqual(bridge.config["system_prompt"], "New prompt")
        self.assertEqual(len(versioned.get_version_manager()), 2)

    def test_rollback(self):
        """Test versioned rollback."""
        class MockBridge:
            def __init__(self):
                self.config = {"system_prompt": "Initial"}

            def update_system_prompt(self, prompt):
                self.config["system_prompt"] = prompt

        bridge = MockBridge()
        versioned = HybridBridgeVersioned(bridge)

        versioned.update_prompt("First")
        versioned.update_prompt("Second")

        result = versioned.rollback()

        self.assertTrue(result.success)
        self.assertEqual(bridge.config["system_prompt"], "First")


if __name__ == "__main__":
    unittest.main()
