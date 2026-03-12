"""
PixelSurgeon for Geometry OS.
Safely injects validated "Knowledge" (successful programs) into the PixelBrain brain atlas.
"""

import os
import numpy as np
from PIL import Image
from pathlib import Path

# Increase PIL limit for the large brain atlas
Image.MAX_IMAGE_PIXELS = None

# Local imports
import sys
PROJECT_ROOT = "/home/jericho/zion/projects/geometry_os/geometry_os"
sys.path.append(PROJECT_ROOT)
from systems.pixel_brain.constants import *

class PixelSurgeon:
    """
    Modifies PixelRTS (.rts.png) brain atlas files.
    Injects high-scoring code patterns into the dedicated Knowledge Sector.
    """
    
    # Bottom-right 256x256 region of the 1024x1024 brain atlas
    KNOWLEDGE_SECTOR_X = 768
    KNOWLEDGE_SECTOR_Y = 768
    KNOWLEDGE_SECTOR_SIZE = 256

    def inject_knowledge(self, brain_atlas_path, task_result, hilbert_offset=0):
        """
        Inject a successful program sequence into the brain atlas.
        """
        print(f"💉 PixelSurgeon: Injecting knowledge into {brain_atlas_path}")
        
        # 1. Load brain atlas (RTS.PNG)
        atlas_img = Image.open(brain_atlas_path).convert("RGBA")
        atlas_data = np.array(atlas_img)
        
        # 2. Extract Q2 Code sequence from task_result
        # For prototype, we'll just mock the injection of Atlas Indices
        code_tokens = task_result.get("code_tokens", [])
        
        # 3. Convert Atlas Indices to RGB Codel colors (discretization reversal)
        # This part depends on the Font Atlas mapping
        print(f"   - Encoding {len(code_tokens)} tokens as visual codels...")
        
        # 4. Write to the Knowledge Sector
        # For now, we'll just log the spatial coordinates
        target_x = self.KNOWLEDGE_SECTOR_X + (hilbert_offset % self.KNOWLEDGE_SECTOR_SIZE)
        target_y = self.KNOWLEDGE_SECTOR_Y + (hilbert_offset // self.KNOWLEDGE_SECTOR_SIZE)
        
        print(f"   - Injection point: [{target_x}, {target_y}]")
        
        # 5. Save modified atlas
        # atlas_img.save(brain_atlas_path)
        print("✅ Injection successful (Simulation).")
        return True

def main():
    surgeon = PixelSurgeon()
    brain_path = Path(PROJECT_ROOT) / "gpt_neo_125m_brain_fp16.rts.png"
    
    # Mock task result from evaluation
    mock_result = {
        "code_tokens": [201, 272, 204, 280, 213], # Alloc, Size, Loop, R, Halt
        "score": 0.95
    }
    
    if os.path.exists(brain_path):
        surgeon.inject_knowledge(brain_path, mock_result)
    else:
        print(f"⚠️ Brain atlas not found at {brain_path}")

if __name__ == "__main__":
    main()
