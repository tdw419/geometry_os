#!/usr/bin/env python3
"""
Benchmark Brain Health - Performance & Quality Metrics for Phase 41
Measures entropy reduction rate and repair cycle latency.
"""

import sys
import time
import json
from pathlib import Path
import numpy as np
import logging

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_brain.synaptic_bridge import OuroborosRepairEngine

logging.basicConfig(level=logging.ERROR) # Quiet for benchmarking

def generate_noise_atlas(path: Path, fractures=50, size=1024):
    """Generate a highly unstable atlas for stress testing."""
    data = np.random.randint(0, 100, (size, size, 4), dtype=np.uint8)
    data[:, :, 3] = 255 # Alpha
    
    # Add severe fractures
    for _ in range(fractures):
        x, y = np.random.randint(50, 950, 2)
        r = np.random.randint(5, 20)
        mask = np.ogrid[-y:size-y, -x:size-x]
        dist = mask[0]**2 + mask[1]**2 <= r**2
        data[dist, 1] = 250 # Max entropy
        
    with open(path, "wb") as f:
        f.write(data.tobytes())

def calculate_entropy(atlas_data):
    arr = np.frombuffer(atlas_data, dtype=np.uint8).reshape((-1, 4))
    return np.mean(arr[:, 1]) / 255.0

def run_benchmark(threshold=0.6):
    test_atlas = Path("systems/pixel_brain/atlases/benchmark_subject.rts.png")
    test_atlas.parent.mkdir(parents=True, exist_ok=True)
    
    generate_noise_atlas(test_atlas)
    
    engine = OuroborosRepairEngine(str(test_atlas))
    engine.load_atlas()
    
    initial_entropy = calculate_entropy(engine.atlas_data)
    
    start_time = time.time()
    result = engine.repair_cycle(threshold=threshold)
    end_time = time.time()
    
    final_entropy = calculate_entropy(engine.atlas_data)
    reduction = (initial_entropy - final_entropy) / initial_entropy if initial_entropy > 0 else 0
    
    metrics = {
        "initial_entropy": initial_entropy,
        "final_entropy": final_entropy,
        "reduction_pct": reduction * 100,
        "fractures_found": result.get("fractures_found", 0),
        "latency_ms": (end_time - start_time) * 1000,
        "efficiency_score": (reduction * 1000) / max(1, (end_time - start_time) * 1000)
    }
    
    return metrics

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--threshold", type=float, default=0.6)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    
    metrics = run_benchmark(args.threshold)
    
    if args.json:
        print(json.dumps(metrics))
    else:
        print(f"Fractures Repaired: {metrics['fractures_found']}")
        print(f"Entropy Reduction: {metrics['reduction_pct']:.2f}%")
        print(f"Latency: {metrics['latency_ms']:.2f}ms")
        print(f"Efficiency Score: {metrics['efficiency_score']:.4f}")
