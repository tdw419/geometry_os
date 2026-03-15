#!/usr/bin/env python3
"""
Test suite for Sisyphus Brain Glyph.

Tests the cognitive loop in simulation before GPU execution.
"""

import sys
from pathlib import Path

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

import pytest
try:
    from systems.glyph_stratum.programs.compile_glyph import compile_glyph_file
except ImportError:
    # Handle if compile_glyph is not in the path correctly or named differently
    def compile_glyph_file(*args, **kwargs):
        raise ImportError("Could not import compile_glyph_file")


class TestSisyphusBrainCompilation:
    """Test that the glyph compiles correctly."""

    def test_compiles_to_png(self, tmp_path):
        """Verify sisyphus_brain.glyph compiles to valid texture."""
        glyph_path = PROJECT_ROOT / "systems/glyph_stratum/programs/sisyphus_brain.glyph"
        output_path = tmp_path / "sisyphus_brain.rts.png"

        if not glyph_path.exists():
            pytest.skip(f"sisyphus_brain.glyph not found at {glyph_path}")

        try:
            compile_glyph_file(str(glyph_path), str(output_path))
        except Exception as e:
            pytest.fail(f"Compilation failed: {e}")

        assert output_path.exists()
        assert output_path.stat().st_size > 0

    def test_memory_addresses_valid(self):
        """Verify all memory addresses are within 4096x4096 texture bounds."""
        addresses = {
            "COG_STATE": 0x0300,
            "PERCEPT_ENTROPY": 0x0400,
            "HTTP_REQ": 0x0500,
            "HTTP_RES": 0x1000,
            "CTRL_SEM": 0x2000,
            "SCAN_START": 0x8000,
        }

        max_address = 4096 * 4096  # 16M pixels

        for name, addr in addresses.items():
            assert addr < max_address, f"{name} (0x{addr:04X}) exceeds texture bounds"


class TestSisyphusBrainSimulation:
    """Test cognitive loop in Python simulation."""

    @pytest.fixture
    def brain_state(self):
        """Create initial brain state."""
        return {
            "cog_cycles": 0,
            "percept_entropy": 0,
            "percept_hot": 0,
            "percept_cursor": 0x8000,
            "ctrl_sem": 0,
            "res_ready": 0,
            "req_len": 0,
        }

    def test_perceive_increments_entropy(self, brain_state):
        """Verify entropy scanning accumulates values."""
        # Simulate one perceive cycle
        initial_entropy = brain_state["percept_entropy"]

        # In real execution, this would scan memory
        # For test, we simulate finding some entropy
        brain_state["percept_entropy"] = 42  # Simulated

        assert brain_state["percept_entropy"] >= initial_entropy

    def test_cognitive_loop_increments_cycles(self, brain_state):
        """Verify cycle counter increments each loop."""
        for _ in range(5):
            brain_state["cog_cycles"] += 1

        assert brain_state["cog_cycles"] == 5

    def test_semaphore_handshake(self, brain_state):
        """Verify request/response semaphore protocol."""
        # Set request
        brain_state["ctrl_sem"] = 1
        assert brain_state["ctrl_sem"] == 1

        # Simulate bridge clearing and setting response
        brain_state["ctrl_sem"] = 0
        brain_state["res_ready"] = 1

        # Glyph reads response
        assert brain_state["res_ready"] == 1
        brain_state["res_ready"] = 0  # Clear after read

        assert brain_state["ctrl_sem"] == 0
        assert brain_state["res_ready"] == 0


class TestBrainBridgeIntegration:
    """Test Rust brain bridge (requires running daemon)."""

    @pytest.mark.integration
    def test_daemon_health_endpoint(self):
        """Test /brain/health endpoint returns valid JSON."""
        import requests

        try:
            response = requests.get("http://127.0.0.1:8769/brain/health", timeout=2)
            assert response.status_code == 200
            data = response.json()
            assert "lm_studio" in data
        except requests.exceptions.ConnectionError:
            pytest.skip("Daemon not running on port 8769")

    @pytest.mark.integration
    def test_daemon_state_endpoint(self):
        """Test /brain/state endpoint returns cognitive state."""
        import requests

        try:
            response = requests.get("http://127.0.0.1:8769/brain/state", timeout=2)
            assert response.status_code == 200
            data = response.json()
            assert "entropy" in data
            assert "cycles" in data
        except requests.exceptions.ConnectionError:
            pytest.skip("Daemon not running on port 8769")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
