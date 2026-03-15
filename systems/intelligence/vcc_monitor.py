import time
import requests
import numpy as np
import math

# Geometry OS - VCC Monitor (Vitality & Consistency Contract)
# Implements the "Analyze" stage of the SELF_HOSTING loop.

API_URL = "http://127.0.0.1:8769"
WEIGHT_ADDR = 0x1800
MONITOR_SIZE = 128 # monitor first 128 weights

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

def main():
    print("🧠 VCC Monitor: Tracking Transformer Vitality...")
    print(f"Monitoring region 0x{WEIGHT_ADDR:08x} (Size: {MONITOR_SIZE} pixels)")
    
    baseline = get_weights(WEIGHT_ADDR, MONITOR_SIZE)
    if not baseline:
        print("❌ Error: Could not reach Ouroboros HAL. Is the daemon running?")
        return

    print("✅ Baseline established.")
    
    try:
        while True:
            current = get_weights(WEIGHT_ADDR, MONITOR_SIZE)
            if not current: break
            
            # Detect Mutations
            diffs = sum(1 for a, b in zip(baseline, current) if a != b)
            entropy = calculate_entropy(current)
            
            # Phase Alignment Stability (PAS) Score (simplified)
            # High diffs + stable entropy = healthy learning
            # Explosive entropy = divergence
            pas_score = max(0, 1.0 - (entropy / 3.32)) # 3.32 is max bits for 10 bins
            
            status = "HEALTHY" if pas_score > 0.5 else "UNSTABLE"
            
            print(f"\r[VCC] Mutations: {diffs:4} | Entropy: {entropy:.2f} | PAS Score: {pas_score:.2f} | Status: {status}", end="")
            
            time.sleep(1)
    except KeyboardInterrupt:
        print("\nStopping monitor.")

if __name__ == "__main__":
    main()
