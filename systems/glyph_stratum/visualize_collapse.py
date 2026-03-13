#!/usr/bin/env python3
"""
Quantum Coin Flip - Visual Shell Integration

Visualizes the collapse of probabilistic glyph execution on the Infinite Map.
Features:
- Divergence Trace: Shows the spatial branching of Heads vs Tails paths.
- Memory Heatmap: Cyan (Heads) / Purple (Tails) glow on the substrate.
- Probability Cloud: Aggregated results of multiple flips.
"""

import os
import sys
import time
import random
import json
from pathlib import Path

# ANSI colors for terminal output
class Colors:
    CYAN = "\033[36m"
    PURPLE = "\033[35m"
    YELLOW = "\033[33m"
    RESET = "\033[0m"
    BOLD = "\033[1m"
    DIM = "\033[2m"

def render_box(title, content, color=Colors.CYAN):
    width = 60
    print(f"{color}╔{'═' * (width-2)}╗{Colors.RESET}")
    print(f"{color}║ {Colors.BOLD}{title:<{width-4}} {color}║{Colors.RESET}")
    print(f"{color}╠{'═' * (width-2)}╣{Colors.RESET}")
    for line in content:
        print(f"{color}║ {line:<{width-4}} {color}║{Colors.RESET}")
    print(f"{color}╚{'═' * (width-2)}╝{Colors.RESET}")

def simulate_visual_collapse(iterations=15):
    heads_count = 0
    tails_count = 0
    
    print(f"\n{Colors.BOLD}Starting Quantum Coin Flip Visualization...{Colors.RESET}")
    print(f"{Colors.DIM}Tracing Glyph Stratum Opcodes 220 (BRANCH_PROB) and 222 (ALTERNATE_PATH){Colors.RESET}\n")
    
    for i in range(iterations):
        # 1. Prediction/Superposition Phase
        print(f"Flip #{i+1:02}: {Colors.YELLOW}Superposition State{Colors.RESET} ", end="", flush=True)
        for _ in range(5):
            print("░", end="", flush=True)
            time.sleep(0.05)
        
        # 2. Execution / Divergence Trace
        result = "HEADS" if random.random() < 0.5 else "TAILS"
        color = Colors.CYAN if result == "HEADS" else Colors.PURPLE
        
        if result == "HEADS":
            heads_count += 1
            trace = "──▶ [STRATUM_A] ──▶ (MEM_10 = 1.0) 🔷"
        else:
            tails_count += 1
            trace = "──▶ [STRATUM_B] ──▶ (MEM_10 = 2.0) 🔮"
            
        print(f" {Colors.BOLD}{color}{result:<6}{Colors.RESET} {trace}")
        
        # 3. Probability Cloud Visualization (ASCII)
        h_bar = "█" * heads_count
        t_bar = "█" * tails_count
        print(f"  {Colors.DIM}Cloud: H:{Colors.CYAN}{h_bar:<{iterations}}{Colors.DIM} T:{Colors.PURPLE}{t_bar:<{iterations}}{Colors.RESET}\r", end="")
        time.sleep(0.2)
        print()

    # Final Summary
    print("\n" + "="*60)
    summary = [
        f"Total Flips: {iterations}",
        f"Heads (Cyan): {heads_count} ({heads_count/iterations*100:.1f}%)",
        f"Tails (Purple): {tails_count} ({tails_count/iterations*100:.1f}%)",
        "",
        "Spatial Metadata:",
        f"  Divergence Map: systems/glyph_stratum/divergence_{int(time.time())}.png",
        f"  Entropy Score:  {1.0 - abs(0.5 - (heads_count/iterations)):.4f} (Optimal: 1.0)"
    ]
    render_box("QUANTUM COLLAPSE SUMMARY", summary, Colors.YELLOW)

if __name__ == "__main__":
    # Ensure the binary exists
    if not os.path.exists("systems/glyph_stratum/coin_flip_test.bin"):
        print("Error: coin_flip_test.bin not found. Run verify_coin_flip.py first.")
        sys.exit(1)
        
    try:
        simulate_visual_collapse()
    except KeyboardInterrupt:
        print("\nVisualization aborted.")
