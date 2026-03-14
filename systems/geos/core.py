"""
Geometry OS Core Module
Hilbert curve mathematics and spatial locality scoring.
"""

import numpy as np
from typing import Tuple
from dataclasses import dataclass


@dataclass
class HilbertCurve:
    """Hilbert curve for spatial address mapping."""
    order: int

    @property
    def grid_size(self) -> int:
        return 2 ** self.order

    def d_to_xy(self, d: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        return hilbert_d2xy(self.grid_size, d)

    def xy_to_d(self, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        return hilbert_xy2d(self.grid_size, x, y)


def hilbert_d2xy(n: int, d: int) -> Tuple[int, int]:
    """
    Convert Hilbert index to (x, y) coordinates.

    Args:
        n: Grid size (must be power of 2)
        d: Hilbert index (0 to n*n-1)

    Returns:
        (x, y) tuple of coordinates
    """
    x = y = 0
    s = 1
    t = d
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y


def hilbert_xy2d(n: int, x: int, y: int) -> int:
    """
    Convert (x, y) coordinates to Hilbert index.

    Args:
        n: Grid size (must be power of 2)
        x: X coordinate (0 to n-1)
        y: Y coordinate (0 to n-1)

    Returns:
        Hilbert index (0 to n*n-1)
    """
    d = 0
    s = n // 2
    while s > 0:
        rx = 1 if (x & s) > 0 else 0
        ry = 1 if (y & s) > 0 else 0
        d += s * s * ((3 * rx) ^ ry)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        s //= 2
    return d


def calculate_sls(
    instructions: list[Tuple[int, int, int, int]],
    grid_size: int = 4096
) -> float:
    """
    Calculate Spatial Locality Score (SLS).

    SLS measures how well instructions are laid out for GPU cache efficiency.
    A score of 1.0 means perfect locality (sequential Hilbert access).
    Score < 0.7 indicates poor cache utilization.

    Args:
        instructions: List of (opcode, stratum, p1, p2) tuples
        grid_size: Texture grid size (default 4096x4096)

    Returns:
        SLS score between 0.0 and 1.0
    """
    if len(instructions) < 2:
        return 1.0

    # Calculate Hilbert distance between consecutive instructions
    total_jump = 0
    max_jump = 0

    prev_d = 0
    for i in range(len(instructions)):
        # Simulate where this instruction would be placed
        x, y = hilbert_d2xy(grid_size, i)
        d = hilbert_xy2d(grid_size, x, y)

        if i > 0:
            jump = abs(d - prev_d)
            total_jump += jump
            max_jump = max(max_jump, jump)

        prev_d = d

    # Ideal case: consecutive instructions are 1 unit apart in Hilbert space
    # Worst case: maximum possible jumps
    ideal_total = len(instructions) - 1
    worst_total = (len(instructions) - 1) * (grid_size * grid_size // 4)

    if worst_total == 0:
        return 1.0

    # SLS = 1 - (actual_jump - ideal) / (worst - ideal)
    sls = 1.0 - (total_jump - ideal_total) / (worst_total - ideal_total)
    return max(0.0, min(1.0, sls))


def calculate_sls_from_texture(
    pixels: np.ndarray,
    ignore_nop: bool = True
) -> dict:
    """
    Calculate SLS from an existing texture.

    Args:
        pixels: numpy array of shape (H, W, 4) with RGBA pixels
        ignore_nop: If True, ignore NOP (opcode 0) instructions

    Returns:
        Dict with sls_score, instruction_count, and other metrics
    """
    grid_size = pixels.shape[0]

    # Extract non-NOP instructions if requested
    if ignore_nop:
        # Find pixels where R channel (opcode) is non-zero
        mask = pixels[:, :, 0] != 0
        instructions = []
        for y in range(grid_size):
            for x in range(grid_size):
                if mask[y, x]:
                    r, g, b, a = pixels[y, x]
                    instructions.append((int(r), int(g), int(b), int(a)))
    else:
        instructions = [
            tuple(pixels[y, x])
            for y in range(grid_size)
            for x in range(grid_size)
        ]

    if len(instructions) < 2:
        return {
            "sls_score": 1.0,
            "instruction_count": len(instructions),
            "grid_size": grid_size,
            "density": len(instructions) / (grid_size * grid_size),
        }

    # Calculate locality for consecutive pairs
    consecutive_close = 0
    total_pairs = 0

    for i, inst in enumerate(instructions):
        x, y = hilbert_d2xy(grid_size, i)
        d = hilbert_xy2d(grid_size, x, y)

        if i > 0:
            total_pairs += 1
            if abs(d - prev_d) <= 16:
                consecutive_close += 1
        prev_d = d

    locality_ratio = consecutive_close / total_pairs if total_pairs > 0 else 1.0

    return {
        "sls_score": calculate_sls(instructions, grid_size),
        "locality_ratio": locality_ratio,
        "instruction_count": len(instructions),
        "grid_size": grid_size,
        "density": len(instructions) / (grid_size * grid_size),
        "total_pairs": total_pairs,
        "consecutive_close": consecutive_close,
    }
