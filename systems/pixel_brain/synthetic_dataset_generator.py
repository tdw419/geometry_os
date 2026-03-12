# systems/pixel_brain/synthetic_dataset_generator.py
"""Synthetic Dataset Generator for PixelBrain Visual Training.

Generates "Allocation Seed" tasks for Phase 1 training.
"""

import random
from dataclasses import dataclass
from typing import List, Dict, Any, Tuple, Optional
import numpy as np

from systems.pixel_brain.constants import (
    OPCODE_ALLOC,
    OPCODE_HALT,
    OPCODE_DATA,
    OPCODE_NOP,
    COLORS,
    ALLOC_SIZES,
    ALLOC_COLORS,
    ALLOC_POSITIONS,
    TEXTURE_SIZE,
    QUADRANT_PIXELS,
)
from systems.pixel_brain.atlas_tokenizer import (
    AtlasTokenizer,
    ascii_to_index,
    byte_to_index,
)
from systems.pixel_brain.hilbert_encoder import HilbertEncoder


@dataclass
class AllocationTask:
    """A single ALLOC_NxM_COLOR task."""
    size: Tuple[int, int]
    color: str
    position: Tuple[int, int]

    def to_prompt(self) -> str:
        """Generate the prompt string."""
        w, h = self.size
        x, y = self.position
        return f"ALLOC {w}x{h} {self.color} at [{x},{y}]"

    def to_ground_truth(self) -> np.ndarray:
        """Generate 2D atlas index texture."""
        texture = np.zeros((TEXTURE_SIZE, TEXTURE_SIZE), dtype=np.uint16)
        x, y = self.position
        w, h = self.size
        
        texture[y, x] = OPCODE_ALLOC
        texture[y, x+1] = byte_to_index(w)
        texture[y, x+2] = byte_to_index(h)
        
        rgb = COLORS[self.color]
        for dy in range(h):
            for dx in range(w):
                texture[y+dy, x+dx+3] = byte_to_index(rgb[2])
                
        texture[y+h, x+w+3] = OPCODE_HALT
        return texture


class SyntheticDatasetGenerator:
    """Generates synthetic training datasets with local random state."""

    def __init__(self, seed: Optional[int] = None):
        self.tokenizer = AtlasTokenizer()
        self.encoder = HilbertEncoder(grid_size=TEXTURE_SIZE)
        self.rng = random.Random(seed)
        self.np_rng = np.random.default_rng(seed)

    def generate_tasks(self, count: int) -> List[AllocationTask]:
        """Generate random allocation tasks."""
        tasks = []
        for _ in range(count):
            size = self.rng.choice(ALLOC_SIZES)
            color = self.rng.choice(ALLOC_COLORS)
            pos_x = self.rng.choice(ALLOC_POSITIONS)
            pos_y = self.rng.choice(ALLOC_POSITIONS)
            tasks.append(AllocationTask(size, color, (pos_x, pos_y)))
        return tasks

    def generate_training_pair(self, task: AllocationTask) -> Dict[str, Any]:
        """Generate indices for all quadrants and the ground truth texture."""
        gt_texture = task.to_ground_truth()
        
        prompt_indices = [OPCODE_NOP] * QUADRANT_PIXELS
        intent_indices = [OPCODE_NOP] * QUADRANT_PIXELS
        code_indices = self.encoder.encode_quadrant(gt_texture, quadrant=2)
        terminus_indices = [OPCODE_NOP] * QUADRANT_PIXELS
        
        prompt_str = task.to_prompt()
        prompt_tokens = self.tokenizer.tokenize_prompt(prompt_str)
        for i, token in enumerate(prompt_tokens):
            if i < QUADRANT_PIXELS:
                prompt_indices[i] = token
                
        intent_str = f"Intent: {task.color} block"
        intent_tokens = [ascii_to_index(c) for c in intent_str]
        for i, token in enumerate(intent_tokens):
            if i < QUADRANT_PIXELS:
                intent_indices[i] = token

        return {
            "prompt_indices": prompt_indices,
            "intent_indices": intent_indices,
            "code_indices": code_indices,
            "terminus_indices": terminus_indices,
            "ground_truth": gt_texture
        }

    def generate_dataset(self, count: int) -> List[Dict[str, Any]]:
        """Generate a full dataset of training pairs."""
        tasks = self.generate_tasks(count)
        return [self.generate_training_pair(t) for t in tasks]


def generate_allocation_seed_dataset(count: int = 1000, seed: int = 42) -> List[Dict[str, Any]]:
    """Convenience function to generate the Phase 1 dataset."""
    gen = SyntheticDatasetGenerator(seed=seed)
    return gen.generate_dataset(count)
