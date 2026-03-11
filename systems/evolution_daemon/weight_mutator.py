"""
Weight Sector Mutator - Hilbert-indexed mutations for brain evolution.

Enables the Evolution Daemon to physically mutate model weights in the Brain Atlas.
The Hilbert LUT maps 1D indices to 2D coordinates for spatial locality.
"""

import hashlib
import uuid
from dataclasses import dataclass

import numpy as np


@dataclass
class MutationRecord:
    """Record of a mutation operation."""
    mutation_id: str
    mutation_type: str
    hilbert_start: int
    hilbert_end: int
    pixels_affected: int
    intensity: float
    checksum_before: str
    checksum_after: str


class WeightMutator:
    """
    Mutates sectors of weights in a Hilbert-indexed atlas.

    Uses Hilbert curve indexing to preserve spatial locality during mutations.
    Nearby indices in 1D map to nearby pixels in 2D, enabling coherent
    sector-based evolution.
    """

    def __init__(self, atlas: np.ndarray, hilbert_lut: list[tuple[int, int]] = None):
        """
        Initialize the weight mutator.

        Args:
            atlas: Weight atlas array (H x W x C)
            hilbert_lut: Optional lookup table mapping 1D Hilbert indices to 2D coordinates.
                        If None, generates automatically.
        """
        self.atlas = atlas.copy()  # Work on copy to avoid mutating original
        self.grid_size = atlas.shape[0]  # Assuming square atlas

        if hilbert_lut is None:
            self.hilbert_lut = self._generate_hilbert_lut()
        else:
            self.hilbert_lut = hilbert_lut

    def _generate_hilbert_lut(self) -> list[tuple[int, int]]:
        """Generate Hilbert lookup table for the grid size."""
        try:
            from systems.evolution.HilbertEngine import HilbertEngine
            engine = HilbertEngine()
            lut = []
            for d in range(self.grid_size * self.grid_size):
                x, y = engine.d2xy(self.grid_size, d)
                lut.append((y, x))  # (row, col) for array indexing
            return lut
        except ImportError:
            # Fallback: simple row-major order
            lut = []
            for d in range(self.grid_size * self.grid_size):
                row = d // self.grid_size
                col = d % self.grid_size
                lut.append((row, col))
            return lut

    def mutate_sector(self, config: dict) -> tuple[np.ndarray, MutationRecord]:
        """
        Mutate a sector of weights in the Hilbert atlas.

        Args:
            config: Mutation configuration
                - hilbert_start: Starting index
                - hilbert_end: Ending index
                - mutation_type: "radiation" | "crossover" | "noise"
                - intensity: 0.0 - 1.0
                - source_sector: int (for crossover)

        Returns:
            (mutated_atlas, mutation_record)
        """
        # Extract and validate config
        hilbert_start = config.get("hilbert_start", 0)
        hilbert_end = config.get("hilbert_end", 100)
        mutation_type = config.get("mutation_type", "radiation")
        intensity = config.get("intensity", 0.5)

        # Clamp indices to valid range
        max_index = len(self.hilbert_lut)
        hilbert_start = max(0, min(hilbert_start, max_index - 1))
        hilbert_end = max(hilbert_start + 1, min(hilbert_end, max_index))

        # Calculate checksum before mutation
        checksum_before = self._calculate_checksum()

        # Apply mutation
        if mutation_type == "radiation":
            self._apply_radiation(hilbert_start, hilbert_end, intensity)
        elif mutation_type == "crossover":
            source_sector = config.get("source_sector")
            if source_sector is None:
                raise ValueError("source_sector required for crossover mutation")
            self._apply_crossover(hilbert_start, hilbert_end, source_sector)
        elif mutation_type == "noise":
            self._apply_noise(hilbert_start, hilbert_end, intensity)
        else:
            raise ValueError(f"Unknown mutation type: {mutation_type}")

        # Calculate checksum after mutation
        checksum_after = self._calculate_checksum()

        # Create mutation record
        pixels_affected = hilbert_end - hilbert_start
        record = MutationRecord(
            mutation_id=str(uuid.uuid4()),
            mutation_type=mutation_type,
            hilbert_start=hilbert_start,
            hilbert_end=hilbert_end,
            pixels_affected=pixels_affected,
            intensity=intensity,
            checksum_before=checksum_before,
            checksum_after=checksum_after
        )

        return self.atlas, record

    def _apply_radiation(self, start: int, end: int, intensity: float):
        """
        Apply radiation mutation: weight += randn() × intensity.
        Uses float math and clipping for uint8 robustness.
        """
        max_idx = len(self.hilbert_lut)
        for d in range(start, min(end, max_idx)):
            row, col = self.hilbert_lut[d]
            # Generate noise for each channel
            noise = np.random.normal(0, intensity, size=self.atlas.shape[2])

            # Use float32 for math to avoid uint8 wrap-around
            pixel_f32 = self.atlas[row, col].astype(np.float32)
            pixel_f32 += noise

            # Clip and cast back to uint8
            self.atlas[row, col] = np.clip(pixel_f32, 0, 255).astype(np.uint8)

    def _apply_crossover(self, start: int, end: int, source_sector: int):
        """
        Apply crossover mutation: copy from source_sector.
        """
        max_index = len(self.hilbert_lut)
        source_sector = max(0, min(source_sector, max_index - (end - start) - 1))

        # Vectorized copy for performance if possible, but keeping it simple for now
        for i, d in enumerate(range(start, min(end, max_index))):
            target_row, target_col = self.hilbert_lut[d]
            source_idx = source_sector + i
            source_row, source_col = self.hilbert_lut[source_idx]

            self.atlas[target_row, target_col] = self.source_atlas[source_row, source_col] if hasattr(self, 'source_atlas') else self.atlas[source_row, source_col]

    def _apply_noise(self, start: int, end: int, intensity: float):
        """
        Apply noise mutation: weight += randn() × intensity × 0.1.
        """
        self._apply_radiation(start, end, intensity * 0.1)

    def _calculate_checksum(self) -> str:
        """Calculate checksum of current atlas state."""
        # Use SHA256 hash of flattened array
        flat = self.atlas.tobytes()
        return hashlib.sha256(flat).hexdigest()[:16]
