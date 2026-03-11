"""
Weight Grafting Protocol - Merging cognitive sectors between Hilbert-mapped brains.

Task 8: Weight Grafting Protocol implementation for Geometry OS.
Enables physically merging trained capabilities from different brain atlases.
"""

import json
import logging
import os
import sys
from pathlib import Path

import numpy as np
from PIL import Image

# Add project root to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from systems.evolution_daemon.weight_mutator import WeightMutator

logger = logging.getLogger(__name__)

class GraftingProtocol:
    """
    Orchestrates the merging of weight sectors between two .rts.png brain atlases.
    """

    def __init__(self, target_brain_path: str, source_brain_path: str):
        """
        Initialize the grafting protocol.

        Args:
            target_brain_path: Path to the base brain (recipient)
            source_brain_path: Path to the brain containing traits to graft (donor)
        """
        self.target_path = Path(target_brain_path)
        self.source_path = Path(source_brain_path)

        if not self.target_path.exists():
            raise FileNotFoundError(f"Target brain not found: {self.target_path}")
        if not self.source_path.exists():
            raise FileNotFoundError(f"Source brain not found: {self.source_path}")

        # Load target data and metadata
        self.target_atlas, self.target_meta = self._load_brain(self.target_path)
        # Load source data and metadata
        self.source_atlas, self.source_meta = self._load_brain(self.source_path)

        # Ensure grid sizes match
        if self.target_atlas.shape != self.source_atlas.shape:
            raise ValueError(
                f"Atlas dimension mismatch: Target {self.target_atlas.shape} != Source {self.source_atlas.shape}"
            )

        # Initialize mutator on target atlas
        # For performance, we generate the LUT once
        self.mutator = WeightMutator(self.target_atlas)

    def _load_brain(self, path: Path) -> tuple[np.ndarray, dict]:
        """Load brain atlas pixels and JSON metadata."""
        img = Image.open(path)
        atlas = np.array(img)

        meta_path = Path(str(path) + ".meta.json")
        if meta_path.exists():
            with open(meta_path) as f:
                meta = json.load(f)
        else:
            meta = {}

        return atlas, meta

    def graft_sector(self, hilbert_start: int, hilbert_end: int) -> int:
        """
        Copy a weight sector from source brain to target brain.

        Args:
            hilbert_start: Starting Hilbert index
            hilbert_end: Ending Hilbert index

        Returns:
            Number of pixels grafted
        """
        logger.info(f"Grafting sector {hilbert_start} to {hilbert_end} from source...")

        pixels_grafted = 0
        lut = self.mutator.hilbert_lut
        max_idx = len(lut)

        actual_start = max(0, min(hilbert_start, max_idx - 1))
        actual_end = max(actual_start + 1, min(hilbert_end, max_idx))

        # Physically copy pixels
        for d in range(actual_start, actual_end):
            row, col = lut[d]
            self.target_atlas[row, col] = self.source_atlas[row, col]
            pixels_grafted += 1

        return pixels_grafted

    def save_grafted_brain(self, output_path: str):
        """
        Save the hybrid atlas and updated metadata.
        """
        out_path = Path(output_path)

        # Save image
        img = Image.fromarray(self.target_atlas, 'RGBA')

        # Copy metadata and add grafting record
        new_meta = self.target_meta.copy()
        graft_record = {
            "type": "graft",
            "source_brain": str(self.source_path),
            "timestamp": np.datetime64('now').astype(str)
        }

        if "history" not in new_meta:
            new_meta["history"] = []
        new_meta["history"].append(graft_record)

        # Save PNG with metadata chunk
        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(new_meta))
        img.save(out_path, "PNG", pnginfo=pnginfo)

        # Save sidecar metadata
        with open(str(out_path) + ".meta.json", "w") as f:
            json.dump(new_meta, f, indent=2)

        logger.info(f"Grafted brain saved to {out_path}")
        return out_path

async def run_grafting_demo():
    """Demonstrate grafting security traits into a default brain."""
    print("🧬 GEOMETRY OS: WEIGHT GRAFTING SEQUENCE")

    # 1. Setup paths
    # We'll use our existing 125M brain as both source and target for the demo
    # but simulate grafting specific sectors.
    brain_path = "gpt_neo_125m_brain.rts.png"
    if not Path(brain_path).exists():
        print(f"❌ {brain_path} not found. Run first_thought.py first.")
        return

    print(f"📥 Loading target brain: {brain_path}")
    print(f"📥 Loading source brain: {brain_path} (Self-Graft Test)")

    protocol = GraftingProtocol(brain_path, brain_path)

    # 2. Define sectors to graft
    # Let's say we want to graft Layer 0 attention (from 38M to 43M approx)
    # Based on our layout:
    # Embeddings: 0 - 38,597,376
    # Layer 0 Attention: 38,597,376 - 43,315,968
    start = 38597376
    end = 43315968

    print("✂️  Grafting Layer 0 Attention weights...")
    grafted = protocol.graft_sector(start, end)
    print(f"✅ Grafted {grafted} weight-pixels.")

    # 3. Save
    output = "grafted_brain.rts.png"
    protocol.save_grafted_brain(output)
    print(f"✨ Grafting Complete: {output}")

if __name__ == "__main__":
    import asyncio
    asyncio.run(run_grafting_demo())
