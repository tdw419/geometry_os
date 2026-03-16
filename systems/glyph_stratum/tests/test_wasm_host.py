#!/usr/bin/env python3
"""Test WASM host functions via daemon HTTP API."""

import subprocess
import time
import requests
import sys
import os

DAEMON_URL = "http://127.0.0.1:8769"
WASM_TEST = "systems/glyph_stratum/tests/wasm/host_test.wasm"

def wait_for_daemon(timeout=10):
    """Wait for daemon to be ready."""
    for _ in range(timeout * 10):
        try:
            r = requests.get(f"{DAEMON_URL}/status", timeout=1)
            if r.status_code == 200:
                return True
        except:
            pass
        time.sleep(0.1)
    return False

def test_wasm_host_functions():
    """Test that WASM host functions work."""
    print("[TEST] Checking daemon status...")
    if not wait_for_daemon():
        print("[FAIL] Daemon not responding")
        return False

    print("[TEST] Loading WASM test binary...")
    if not os.path.exists(WASM_TEST):
        print(f"[FAIL] WASM test file not found: {WASM_TEST}")
        return False

    with open(WASM_TEST, "rb") as f:
        wasm_bytes = f.read()

    r = requests.post(
        f"{DAEMON_URL}/load?binary=0x20000",
        data=wasm_bytes,
        headers={"Content-Type": "application/octet-stream"}
    )

    if r.status_code != 200:
        print(f"[FAIL] Failed to load WASM: {r.text}")
        return False

    print("[PASS] WASM binary loaded")

    # Read substrate to verify poke worked
    print("[TEST] Reading substrate at 0x1000...")
    r = requests.get(f"{DAEMON_URL}/read?addr=0x1000&len=8")

    if r.status_code != 200:
        print(f"[FAIL] Failed to read substrate: {r.text}")
        return False

    # The WASM should have written 42 (0x2a) to 0x1000
    data = r.content
    val = int.from_bytes(data[:4], 'little')
    print(f"[TEST] Value at 0x1000: {val}")

    if val == 42:
        print("[PASS] poke(0x1000, 42) worked!")
        return True
    else:
        print(f"[FAIL] Expected 42, got {val}")
        return False

if __name__ == "__main__":
    success = test_wasm_host_functions()
    sys.exit(0 if success else 1)
