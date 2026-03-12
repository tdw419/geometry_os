"""
Synthetic Dataset Generator for the PixelBrain Visual Training Harness.
Generates 1,000 "ALLOC_NxM_COLOR" task pairs (Prompt -> Code).
Uses Hilbert-ordered placement to ensure causal context for transformers.
"""

import os
import json
import random
import numpy as np
from PIL import Image
from pathlib import Path

# Local imports
import sys
PROJECT_ROOT = "/home/jericho/zion/projects/geometry_os/geometry_os"
sys.path.append(PROJECT_ROOT)
from systems.pixel_brain.constants import *
from core.hilbert_util import HilbertCurve

# Configuration
DATASET_DIR = Path(PROJECT_ROOT) / "data" / "pixel_brain_training"
TEXTURES_DIR = DATASET_DIR / "textures"
SEQUENCES_DIR = DATASET_DIR / "sequences"

# Ensure directories exist
TEXTURES_DIR.mkdir(parents=True, exist_ok=True)
SEQUENCES_DIR.mkdir(parents=True, exist_ok=True)

class SyntheticTaskGenerator:
    """
    Generates synthetic training pairs for the 'Allocation Seed' task.
    Uses Hilbert placement for causal sequence alignment.
    """
    
    def __init__(self, atlas_path=None):
        self.atlas_path = atlas_path or (Path(PROJECT_ROOT) / "web" / "assets" / "universal_font.rts.png")
        self.curve = HilbertCurve(order=HILBERT_ORDER)
        
        # Task Grammar
        self.sizes = [(2,2), (4,4), (8,8), (16,16), (4,8), (8,4)]
        self.colors = {
            "RED": (255, 0, 0),
            "BLUE": (0, 0, 255),
            "GREEN": (0, 255, 0),
            "YELLOW": (255, 255, 0),
            "CYAN": (0, 255, 255),
            "MAGENTA": (255, 0, 255)
        }
        self.positions = range(0, 112, 16)

    def generate_task(self):
        """Pick a random task and generate its components."""
        w, h = random.choice(self.sizes)
        color_name = random.choice(list(self.colors.keys()))
        rgb = self.colors[color_name]
        pos_x = random.choice(self.positions)
        pos_y = random.choice(self.positions)
        
        # 1. Generate Prompt String
        prompt = f"ALLOC {w}x{h} {color_name} at [{pos_x}, {pos_y}]"
        prompt_tokens = [ord(c) for c in prompt]
        
        # 2. Generate Ground Truth Codels (Atlas Indices)
        # Sequence: [Intent, Alloc, Size, Store, R, G, B, Halt]
        size_token = BYTE_LITERAL_START + (w * h)
        r_token = BYTE_LITERAL_START + rgb[0]
        g_token = BYTE_LITERAL_START + rgb[1]
        b_token = BYTE_LITERAL_START + rgb[2]
        
        intent_tokens = [GLYPH_BRAIN, GLYPH_SPIRAL]
        code_tokens = [
            OPCODE_ALLOC,
            size_token,
            OPCODE_STORE,
            r_token, g_token, b_token,
            OPCODE_HALT
        ]
        
        return {
            "prompt_tokens": prompt_tokens,
            "intent_tokens": intent_tokens,
            "code_tokens": code_tokens,
            "params": {
                "prompt": prompt,
                "w": w, "h": h, 
                "color": color_name, 
                "rgb": rgb,
                "x": pos_x, "y": pos_y
            }
        }

    def render_to_sequence(self, task):
        """Render the task directly into a 1D Hilbert sequence."""
        # Initialize with NOP (Atlas Index 200)
        sequence = np.full(TOTAL_STEPS, OPCODE_NOP, dtype=np.uint16)
        
        # Place tokens at specific Hilbert step offsets
        # This ensures they appear in the correct order for the transformer
        
        # Q0: PROMPT (offset 100 to leave some room)
        for i, token in enumerate(task["prompt_tokens"]):
            sequence[PROMPT_STEPS[0] + 100 + i] = token
            
        # Q1: INTENT
        for i, token in enumerate(task["intent_tokens"]):
            sequence[INTENT_STEPS[0] + 100 + i] = token
            
        # Q2: CODE
        for i, token in enumerate(task["code_tokens"]):
            sequence[CODE_STEPS[0] + 100 + i] = token
            
        return sequence

    def sequence_to_matrix(self, sequence):
        """Fold 1D Hilbert sequence back into 2D matrix for visualization."""
        matrix = np.full((TEXTURE_SIZE, TEXTURE_SIZE), OPCODE_NOP, dtype=np.uint16)
        for d, token in enumerate(sequence):
            if token != OPCODE_NOP:
                x, y = self.curve.d2xy(d)
                matrix[y, x] = token
        return matrix

    def save_sample(self, index, sequence, task):
        """Save the sample as .npy and .png (visualized)."""
        base_name = f"sample_{index:04d}"
        
        # 1. Save 1D sequence
        np.save(SEQUENCES_DIR / f"{base_name}.npy", sequence)
        
        # 2. Save metadata
        with open(DATASET_DIR / f"{base_name}.json", 'w') as f:
            json.dump(task, f, indent=2)
            
        # 3. Create visual representation
        matrix = self.sequence_to_matrix(sequence)
        # Use simple color mapping for visualization
        # RGB = (Token % 256, (Token // 4) % 256, 128)
        vis_image = Image.new("RGB", (TEXTURE_SIZE, TEXTURE_SIZE))
        pixels = vis_image.load()
        for y in range(TEXTURE_SIZE):
            for x in range(TEXTURE_SIZE):
                token = matrix[y, x]
                if token != OPCODE_NOP:
                    pixels[x, y] = (token % 256, (token // 4) % 256, 255)
                else:
                    pixels[x, y] = (0, 0, 0)
        
        vis_image.resize((512, 512), Image.NEAREST).save(TEXTURES_DIR / f"{base_name}.png")

def main():
    gen = SyntheticTaskGenerator()
    print(f"🚀 Generating 1,000 Hilbert-aligned tasks in {DATASET_DIR}...")
    
    for i in range(1000):
        task = gen.generate_task()
        sequence = gen.render_to_sequence(task)
        gen.save_sample(i, sequence, task)
        
        if (i + 1) % 100 == 0:
            print(f"  - Progress: {i+1}/1000")
            
    print("✅ Dataset generation complete.")

if __name__ == "__main__":
    main()
