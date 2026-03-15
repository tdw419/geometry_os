#!/usr/bin/env python3
"""
Autonomous Self-Improvement Loop
The brain continuously prompts LM Studio to analyze and improve itself.

This implements the SELF_HOSTING loop:
1. SENSE - Read substrate state (entropy, weights, mutations)
2. PROMPT - Send state to LM Studio for analysis
3. ACT - Apply suggested improvements
4. VERIFY - Check if improvement helped
"""

import requests
import time
import random
import json

API_URL = "http://127.0.0.1:8769"
LM_STUDIO_URL = "http://localhost:1234"

# Memory addresses
CTRL_SEMAPHORE = 0x2000
RESPONSE_READY = 0x2004
REQUEST_LENGTH = 0x2008
HTTP_REQUEST = 0x0500
HTTP_RESPONSE = 0x1000
WEIGHT_BASE = 0x1800
BRAIN_STATE = 0x0300
ACTION_BUF = 0x8000

# Evolution parameters
IMPROVEMENT_INTERVAL = 5.0  # seconds between improvement cycles
WEIGHT_REGION_SIZE = 128
MUTATION_RATE = 0.1
ENTROPY_HISTORY = []

def read_u32(addr):
    """Read a 32-bit value from GPU memory."""
    r = requests.get(f"{API_URL}/peek?addr=0x{addr:08x}&size=1")
    if r.status_code != 200:
        return 0
    return int(r.text.strip(), 16)

def read_region(addr, size):
    """Read multiple 32-bit values from GPU memory."""
    r = requests.get(f"{API_URL}/peek?addr=0x{addr:08x}&size={size}")
    if r.status_code != 200:
        return [0] * size
    hex_vals = r.text.strip().split()
    return [int(h, 16) for h in hex_vals]

def write_u32(addr, value):
    """Write a 32-bit value to GPU memory."""
    requests.get(f"{API_URL}/poke?addr=0x{addr:08x}&val=0x{value:08x}")

def write_region(addr, values):
    """Write multiple 32-bit values to GPU memory."""
    hex_data = " ".join(f"{v:08x}" for v in values)
    requests.post(f"{API_URL}/write?addr=0x{addr:08x}", data=hex_data)

def calculate_entropy(weights):
    """Calculate entropy of weight region."""
    if not weights:
        return 0

    # Simple entropy: count unique values and calculate information
    unique = len(set(weights))
    total = len(weights)

    # Normalized entropy (0-1 scale)
    if total == 0:
        return 0

    # Use log2 for bits of information
    import math
    if unique <= 1:
        return 0

    # Shannon entropy approximation
    freq = {}
    for w in weights:
        freq[w] = freq.get(w, 0) + 1

    entropy = 0
    for count in freq.values():
        p = count / total
        if p > 0:
            entropy -= p * math.log2(p)

    return entropy

def prompt_lm_studio(state_summary):
    """Send substrate state to LM Studio and get improvement suggestions."""

    system_prompt = """You are the Sisyphus Brain of Geometry OS, a self-improving operating system.

Your role is to analyze the substrate state and suggest improvements.

You can respond with these commands:
- MUTATE <addr> <value> - Modify a weight at address (hex)
- RESET - Reset all weights to zero
- EXPLORE - Increase entropy with random mutations
- FOCUS <addr> - Concentrate mutations on specific region
- CONTINUE - No changes needed, keep running

Respond with ONE command per line. Example:
MUTATE 0x1800 0x12345678
MUTATE 0x1804 0x87654321
CONTINUE

Keep responses brief and actionable."""

    user_prompt = f"""Current substrate state:
- Cycle: {state_summary['cycle']}
- Entropy: {state_summary['entropy']:.3f}
- Unique weights: {state_summary['unique_weights']}
- Mutation count: {state_summary['mutations']}
- Weight sample: {state_summary['weight_sample'][:8]}

Goal: IMPROVE - Analyze and suggest mutations to optimize the transformer.

Respond with commands to improve the system."""

    try:
        r = requests.post(f"{LM_STUDIO_URL}/v1/chat/completions", json={
            "model": "qwen/qwen3.5-9b",
            "messages": [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            "max_tokens": 200,
            "temperature": 0.7
        }, timeout=10)

        if r.status_code == 200:
            return r.json()['choices'][0]['message']['content']
        else:
            return "CONTINUE"
    except Exception as e:
        print(f"  ⚠️  LM Studio error: {e}")
        return "CONTINUE"

def parse_and_execute(response):
    """Parse LM Studio response and execute commands."""
    commands_executed = 0

    for line in response.strip().split('\n'):
        line = line.strip().upper()

        if line.startswith('MUTATE'):
            parts = line.split()
            if len(parts) >= 3:
                try:
                    addr = int(parts[1], 16)
                    value = int(parts[2], 16)

                    # Validate address is in weight region
                    if WEIGHT_BASE <= addr < WEIGHT_BASE + WEIGHT_REGION_SIZE:
                        write_u32(addr, value)
                        print(f"  🔧 MUTATE 0x{addr:04x} = 0x{value:08x}")
                        commands_executed += 1
                except ValueError:
                    pass

        elif line.startswith('RESET'):
            # Reset weights to zero
            zeros = [0] * WEIGHT_REGION_SIZE
            write_region(WEIGHT_BASE, zeros)
            print("  🔄 RESET - Weights cleared")
            commands_executed += 1

        elif line.startswith('EXPLORE'):
            # Add random mutations
            for _ in range(5):
                addr = WEIGHT_BASE + random.randint(0, WEIGHT_REGION_SIZE - 1)
                value = random.randint(0, 0xFFFFFFFF)
                write_u32(addr, value)
            print("  🎲 EXPLORE - Random mutations applied")
            commands_executed += 1

        elif line.startswith('FOCUS'):
            parts = line.split()
            if len(parts) >= 2:
                try:
                    focus_addr = int(parts[1], 16)
                    # Mutate around focus address
                    for offset in range(-2, 3):
                        addr = focus_addr + offset
                        if WEIGHT_BASE <= addr < WEIGHT_BASE + WEIGHT_REGION_SIZE:
                            value = random.randint(0, 0xFFFFFFFF)
                            write_u32(addr, value)
                    print(f"  🎯 FOCUS on 0x{focus_addr:04x}")
                    commands_executed += 1
                except ValueError:
                    pass

        elif line.startswith('CONTINUE'):
            print("  ▶️  CONTINUE - No changes")

    return commands_executed

def main():
    print("🧠 Autonomous Self-Improvement Loop")
    print("=" * 50)
    print(f"Monitoring weight region: 0x{WEIGHT_BASE:04x}")
    print(f"Improvement interval: {IMPROVEMENT_INTERVAL}s")
    print()

    cycle = 0
    total_mutations = 0

    while True:
        cycle += 1
        print(f"\n[CYCLE {cycle}] SENSE → PROMPT → ACT → VERIFY")
        print("-" * 40)

        # SENSE: Read current substrate state
        weights = read_region(WEIGHT_BASE, WEIGHT_REGION_SIZE)
        entropy = calculate_entropy(weights)
        unique_weights = len(set(weights))

        # Track entropy history
        ENTROPY_HISTORY.append(entropy)
        if len(ENTROPY_HISTORY) > 10:
            ENTROPY_HISTORY.pop(0)

        # Calculate entropy trend
        if len(ENTROPY_HISTORY) >= 3:
            trend = "📈 rising" if ENTROPY_HISTORY[-1] > ENTROPY_HISTORY[0] else "📉 falling"
        else:
            trend = "➡️  stable"

        state_summary = {
            'cycle': cycle,
            'entropy': entropy,
            'unique_weights': unique_weights,
            'mutations': total_mutations,
            'weight_sample': [f"0x{w:08x}" for w in weights[:16]]
        }

        print(f"  📊 Entropy: {entropy:.3f} {trend}")
        print(f"  📊 Unique weights: {unique_weights}/{WEIGHT_REGION_SIZE}")
        print(f"  📊 Total mutations: {total_mutations}")

        # PROMPT: Ask LM Studio for improvements
        print(f"\n  🧠 Consulting LM Studio...")
        response = prompt_lm_studio(state_summary)
        print(f"  📝 Response: {response[:100]}...")

        # ACT: Execute suggested commands
        print(f"\n  ⚡ Executing commands...")
        commands_run = parse_and_execute(response)
        total_mutations += commands_run

        # VERIFY: Read new state
        new_weights = read_region(WEIGHT_BASE, WEIGHT_REGION_SIZE)
        new_entropy = calculate_entropy(new_weights)

        print(f"\n  ✅ New entropy: {new_entropy:.3f}")
        print(f"  ✅ Commands executed: {commands_run}")

        # Update brain state in substrate
        write_u32(BRAIN_STATE, cycle)
        write_u32(BRAIN_STATE + 1, int(entropy * 1000))
        write_u32(BRAIN_STATE + 2, total_mutations)

        # Wait for next cycle
        print(f"\n  💤 Sleeping {IMPROVEMENT_INTERVAL}s...")
        time.sleep(IMPROVEMENT_INTERVAL)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n🛑 Self-improvement loop stopped.")
        print(f"Final stats: Check BRAIN_STATE at 0x{BRAIN_STATE:04x}")
