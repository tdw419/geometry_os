#!/usr/bin/env python3
"""
Ouroboros Loop Validation - Empirical Proof of Phase 41
Verifies that the self-healing engine correctly reduces entropy in the brain atlas.
"""

import sys
from pathlib import Path
import numpy as np
import logging

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_brain.synaptic_bridge import OuroborosRepairEngine, Fracture

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("OuroborosTest")

def generate_corrupted_atlas(path: Path, size: int = 1024):
    """Generate an atlas with intentional high-entropy fractures."""
    # 1024x1024x4 RGBA
    data = np.zeros((size, size, 4), dtype=np.uint8)
    
    # Create 5 high-entropy fractures (Green channel > 0.6)
    for i in range(5):
        x, y = np.random.randint(100, 900, 2)
        radius = 20
        # High entropy blob
        mask = np.ogrid[-y:size-y, -x:size-x]
        dist = mask[0]**2 + mask[1]**2 <= radius**2
        
        data[dist, 0] = 128  # Mid activation
        data[dist, 1] = 230  # High entropy (0.9)
        data[dist, 2] = 50   # Sector ID
        data[dist, 3] = 255  # Full alpha
        
    with open(path, "wb") as f:
        f.write(data.tobytes())
    
    return data

def calculate_global_entropy(atlas_data: bytearray) -> float:
    """Calculate the average entropy (G channel) of the entire substrate."""
    arr = np.frombuffer(atlas_data, dtype=np.uint8).reshape((-1, 4))
    return np.mean(arr[:, 1]) / 255.0

def run_validation():
    test_atlas = Path("systems/pixel_brain/atlases/test_subject.rts.png")
    test_atlas.parent.mkdir(parents=True, exist_ok=True)
    
    logger.info("🧪 PHASE 41 VALIDATION: Closing the Ouroboros Loop")
    
    # 1. Setup corrupted substrate
    generate_corrupted_atlas(test_atlas)
    
    engine = OuroborosRepairEngine(str(test_atlas))
    engine.load_atlas()
    
    initial_entropy = calculate_global_entropy(engine.atlas_data)
    logger.info(f"Initial Substrate Entropy: {initial_entropy:.4f}")
    
    # 2. DETECT
    fractures = engine.scan_for_fractures(threshold=0.6)
    logger.info(f"Detected {len(fractures)} fractures.")
    
    if not fractures:
        logger.error("❌ Validation Failed: No fractures detected in corrupted atlas.")
        return False

    # 3. REPAIR CYCLE (Diagnose -> Prescribe -> Apply)
    logger.info("Initiating Auto-Repair Cycle...")
    result = engine.repair_cycle(threshold=0.6)
    
    # 4. VERIFY
    final_entropy = calculate_global_entropy(engine.atlas_data)
    reduction = (initial_entropy - final_entropy) / initial_entropy * 100
    
    logger.info(f"Final Substrate Entropy: {final_entropy:.4f}")
    logger.info(f"Entropy Reduction: {reduction:.2f}%")
    
    if reduction > 10.0: # Significant reduction across the whole 1024x1024 map
        logger.info("✅ OUROBOROS PROOF SUCCESSFUL: Substrate has healed.")
        return True
    else:
        logger.error("❌ Validation Failed: Entropy reduction insufficient.")
        return False

if __name__ == "__main__":
    success = run_validation()
    sys.exit(0 if success else 1)
