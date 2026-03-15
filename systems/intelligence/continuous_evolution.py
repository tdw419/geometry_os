#!/usr/bin/env python3
"""
Continuous Autonomous Evolution
The brain runs forever, continuously improving itself via LM Studio.
"""
import requests
import math
import random
import time
import sys

API_URL = "http://127.0.0.1:8769"
LM_STUDIO_URL = "http://localhost:1234"
WEIGHT_BASE = 0x1800
WEIGHT_REGION_SIZE = 128
IMPROVEMENT_INTERVAL = float(sys.argv[1]) if len(sys.argv) > 1 else 5.0

def read_region(addr, size):
    r = requests.get(f"{API_URL}/peek?addr=0x{addr:08x}&size={size}")
    return [int(h, 16) for h in r.text.strip().split()]

def write_u32(addr, value):
    requests.get(f"{API_URL}/poke?addr=0x{addr:08x}&val=0x{value:08x}")

def calc_entropy(weights):
    if not weights: return 0
    freq = {}
    for w in weights: freq[w] = freq.get(w, 0) + 1
    total, entropy = len(weights), 0
    for c in freq.values():
        p = c / total
        if p > 0: entropy -= p * math.log2(p)
    return entropy

def get_lm_mutations():
    try:
        r = requests.post(f"{LM_STUDIO_URL}/v1/chat/completions", json={
            "model": "qwen/qwen3.5-9b",
            "messages": [{"role": "user", "content":
                "Generate 3 random 32-bit hex numbers for neural weights. Format: 0xVALUE1 0xVALUE2 0xVALUE3"}],
            "max_tokens": 30, "temperature": 0.9
        }, timeout=8)
        if r.status_code == 200:
            resp = r.json()['choices'][0]['message']['content']
            return [int(w, 16) for w in resp.split()
                    if w.startswith('0x') or w.startswith('0X')][:3]
    except: pass
    return []

def main():
    print("🧠 AUTONOMOUS SELF-IMPROVEMENT DAEMON")
    print(f"Interval: {IMPROVEMENT_INTERVAL}s | Weight region: 0x{WEIGHT_BASE:04x}")
    print("="*50)

    cycle, max_entropy = 0, 0
    history = []

    while True:
        cycle += 1

        # SENSE
        weights = read_region(WEIGHT_BASE, WEIGHT_REGION_SIZE)
        entropy = calc_entropy(weights)
        unique = len(set(weights))
        history.append(entropy)
        if len(history) > 20: history.pop(0)

        # Trend
        if len(history) >= 3:
            trend = "📈" if history[-1] > history[0] else "📉"
        else: trend = "➡️"

        print(f"[{cycle}] E={entropy:.2f} U={unique:3d} {trend}", end=" ", flush=True)

        # PROMPT & ACT
        mutations = get_lm_mutations()
        if mutations:
            for val in mutations[:3]:
                off = random.randint(0, WEIGHT_REGION_SIZE-1)
                write_u32(WEIGHT_BASE + off, val)
            print("🔧LM", end="")
        else:
            for _ in range(3):
                off = random.randint(0, WEIGHT_REGION_SIZE-1)
                write_u32(WEIGHT_BASE + off, random.randint(0, 0xFFFFFFFF))
            print("🎲RND", end="")

        # VERIFY
        new_entropy = calc_entropy(read_region(WEIGHT_BASE, WEIGHT_REGION_SIZE))
        if new_entropy > max_entropy:
            max_entropy = new_entropy
            print(" ⭐PEAK")
        else:
            print()

        # Store brain state
        write_u32(0x300, cycle)
        write_u32(0x304, int(entropy * 1000))

        time.sleep(IMPROVEMENT_INTERVAL)

if __name__ == "__main__":
    try: main()
    except KeyboardInterrupt:
        print("\n\n🛑 Evolution stopped. The brain rests.")
