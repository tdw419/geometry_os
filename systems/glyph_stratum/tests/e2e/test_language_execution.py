#!/usr/bin/env python3
"""
End-to-end tests for language execution on GPU daemon.

Tests:
1. RISC-V binary execution
2. WASM module execution (when interpreter complete)
"""

import subprocess
import time
import requests
import pytest

DAEMON_URL = "http://127.0.0.1:8769"


def daemon_running():
    """Check if GPU daemon is running."""
    try:
        resp = requests.get(f"{DAEMON_URL}/status", timeout=1)
        return resp.status_code == 200
    except:
        return False


@pytest.fixture(scope="module")
def ensure_daemon():
    """Ensure daemon is running before tests."""
    if not daemon_running():
        pytest.skip("GPU daemon not running at http://127.0.0.1:8769")


class TestDaemonAPI:
    """Tests for daemon HTTP API."""

    def test_status_endpoint(self, ensure_daemon):
        """Test /status returns valid JSON."""
        resp = requests.get(f"{DAEMON_URL}/status", timeout=5)
        assert resp.status_code == 200
        data = resp.json()
        assert "status" in data
        assert data["status"] == "running"

    def test_poke_endpoint(self, ensure_daemon):
        """Test /poke writes to substrate."""
        resp = requests.get(f"{DAEMON_URL}/poke?addr=0x1000&value=0x42", timeout=5)
        assert resp.status_code == 200
        data = resp.json()
        assert data.get("ok") == True

    def test_read_endpoint(self, ensure_daemon):
        """Test /read returns hex data."""
        # Write a known value first
        requests.get(f"{DAEMON_URL}/poke?addr=0x1000&value=0x48656C6C", timeout=5)
        resp = requests.get(f"{DAEMON_URL}/read?addr=0x1000&len=4", timeout=5)
        assert resp.status_code == 200
        data = resp.json()
        assert "hex" in data


class TestRISCVExecution:
    """Tests for RISC-V binary execution."""

    def test_loader_script_exists(self):
        """Test that loader script exists and is executable."""
        import os
        script_path = "systems/glyph_stratum/bin/geos-riscv-load.sh"
        assert os.path.exists(script_path), f"Loader script not found: {script_path}"
        assert os.access(script_path, os.X_OK), f"Loader script not executable: {script_path}"

    def test_hello_geos_exists(self):
        """Test that test binary exists."""
        import os
        elf_path = "systems/glyph_stratum/tests/riscv/hello_geos.elf"
        # Skip if toolchain not installed
        if not os.path.exists(elf_path):
            pytest.skip("RISC-V toolchain not installed or binary not built")


class TestWASMExecution:
    """Tests for WASM module execution."""

    @pytest.mark.skip(reason="WASM interpreter not yet complete")
    def test_simple_wasm(self, ensure_daemon):
        """Test simple WASM module execution."""
        pass


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
