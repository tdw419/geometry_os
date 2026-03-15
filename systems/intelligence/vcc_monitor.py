import time
import requests
import numpy as np
import math
import subprocess
import sys

# Geometry OS - VCC Monitor (Vitality & Consistency Contract)
# Implements the full SELF_HOSTING loop: Analyze → Verify → Self-Correct

API_URL = "http://127.0.0.1:8769"
WEIGHT_ADDR = 0x1800
MONITOR_SIZE = 128
UNSTABLE_THRESHOLD = 0.5
CORRECTION_WINDOW = 30  # seconds of sustained instability before correction
CORRECTION_COOLDOWN = 60  # minimum seconds between corrections

def get_weights(addr, size):
    r = requests.get(f"{API_URL}/peek?addr=0x{addr:08x}&size={size}")
    if r.status_code != 200:
        return None
    # Parse hex strings to u32
    hex_vals = r.text.strip().split()
    return [int(h, 16) for h in hex_vals]

def calculate_entropy(weights):
    if not weights: return 0
    # Map u32 back to normalized float space for entropy
    floats = [((w / 0xFFFFFFFF) * 2.0) - 1.0 for w in weights]
    # Simple histogram entropy
    hist, _ = np.histogram(floats, bins=10, range=(-1, 1))
    ps = hist / len(floats)
    return -sum(p * math.log2(p) for p in ps if p > 0)

def trigger_correction(reason):
    """Self-Correction: Reset weights to stabilize the transformer."""
    print(f"\n⚠️  CORRECTION TRIGGERED: {reason}")
    print("🔄 Resetting weight region to baseline...")

    # Reset weights to zero (stable state)
    zeros = "00000000 " * MONITOR_SIZE
    r = requests.post(f"{API_URL}/write?addr=0x{WEIGHT_ADDR:08x}", data=zeros.strip())
    if r.status_code == 200:
        print("✅ Correction applied - weights reset")
        return True
    else:
        print(f"❌ Correction failed: {r.text}")
        return False

def main():
    print("🧠 VCC Monitor: Tracking Transformer Vitality...")
    print(f"Monitoring region 0x{WEIGHT_ADDR:08x} (Size: {MONITOR_SIZE} pixels)")
    print(f"Auto-correction: PAS < {UNSTABLE_THRESHOLD} for {CORRECTION_WINDOW}s")

    baseline = get_weights(WEIGHT_ADDR, MONITOR_SIZE)
    if not baseline:
        print("❌ Error: Could not reach Ouroboros HAL. Is the daemon running?")
        return

    print("✅ Baseline established.")

    unstable_start = None
    last_correction = 0

    try:
        while True:
            current = get_weights(WEIGHT_ADDR, MONITOR_SIZE)
            if not current: break

            now = time.time()

            # Detect Mutations
            diffs = sum(1 for a, b in zip(baseline, current) if a != b)
            entropy = calculate_entropy(current)

            # Phase Alignment Stability (PAS) Score
            pas_score = max(0, 1.0 - (entropy / 3.32))

            # Determine status
            if pas_score > 0.7:
                status = "HEALTHY"
                unstable_start = None
            elif pas_score > UNSTABLE_THRESHOLD:
                status = "LEARNING"
                unstable_start = None
            else:
                status = "UNSTABLE"
                if unstable_start is None:
                    unstable_start = now

            # Check for auto-correction trigger
            correction_msg = ""
            if unstable_start and (now - unstable_start) >= CORRECTION_WINDOW:
                if (now - last_correction) >= CORRECTION_COOLDOWN:
                    if trigger_correction(f"PAS={pas_score:.2f} for {CORRECTION_WINDOW}s"):
                        last_correction = now
                        unstable_start = None
                        baseline = get_weights(WEIGHT_ADDR, MONITOR_SIZE)
                else:
                    correction_msg = " [COOLDOWN]"

            # Display
            unstable_time = int(now - unstable_start) if unstable_start else 0
            print(f"\r[VCC] Mutations: {diffs:4} | Entropy: {entropy:.2f} | PAS: {pas_score:.2f} | {status}{correction_msg}", end="")

            time.sleep(1)
    except KeyboardInterrupt:
        print("\n🛑 Monitor stopped.")

if __name__ == "__main__":
    main()
