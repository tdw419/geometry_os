"""
Geometry OS Benchmarks Module
Spatial locality scoring and benchmark utilities.
"""

import numpy as np
from pathlib import Path
from typing import Dict
from PIL import Image

from .core import hilbert_d2xy, hilbert_xy2d
from .types import Texture, GlyphInstruction


import json


def benchmark_sls(texture_path: str, grid_size: int = 1024) -> Dict:
    """
    Analyze Spatial Locality Score for a texture.

    Args:
        texture_path: Path to the texture PNG file
        grid_size: Grid size for Hilbert calculations

    Returns:
        Dict with SLS metrics
    """
    # Load texture
    img = Image.open(texture_path)
    pixels = np.array(img)

    # Find actual grid size
    actual_grid_size = pixels.shape[0]
    if actual_grid_size != grid_size:
        grid_size = actual_grid_size

    # Extract non-NOP instructions
    instructions = []
    for y in range(grid_size):
        for x in range(grid_size):
            r, g, b, a = pixels[y, x]
            if r != 0:  # Non-NOP
                instructions.append((r, g, b, a))

    if len(instructions) < 2:
        return {
            "sls_score": 1.0,
            "locality_ratio": 1.0,
            "instruction_count": len(instructions),
            "grid_size": grid_size,
            "density": len(instructions) / (grid_size * grid_size),
        }

    # Calculate locality for consecutive pairs
    consecutive_close = 0
    total_pairs = 0
    prev_d = None

    for i in range(len(instructions)):
        x, y = hilbert_d2xy(grid_size, i)
        d = hilbert_xy2d(grid_size, x, y)

        if prev_d is not None:
            total_pairs += 1
            if abs(d - prev_d) <= 16:
                consecutive_close += 1
        prev_d = d

    locality_ratio = consecutive_close / total_pairs if total_pairs > 0 else 1.0

    # Calculate SLS score
    if total_pairs > 0:
        sls = locality_ratio  # Simple SLS calculation
    else:
        sls = 1.0

    return {
        "sls_score": sls,
        "locality_ratio": locality_ratio,
        "instruction_count": len(instructions),
        "grid_size": grid_size,
        "density": len(instructions) / (grid_size * grid_size),
        "total_pairs": total_pairs,
        "consecutive_close": consecutive_close,
    }
