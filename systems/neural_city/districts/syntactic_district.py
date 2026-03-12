"""
Neural City Colonization - Phase 42

The Syntactic District is the first functional colony of the Legible Brain.
It establishes specialized GlyphStratum logic zones for parsing, refactoring,
synthesis, and validation.
"""

from typing import Dict, List, Tuple, TYPE_CHECKING
import logging
from pathlib import Path
import sys

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

# Lazy import to avoid circular dependency
# We only need OuroborosRepairEngine at runtime, not import time

logger = logging.getLogger("SyntacticDistrict")

class ColonyZone:
    """A specialized functional neighborhood within a district."""
    def __init__(self, name: str, center_x: int, center_y: int, radius: int, base_sector: int, base_activation: float):
        self.name = name
        self.center_x = center_x
        self.center_y = center_y
        self.radius = radius
        self.base_sector = base_sector # Maps to GlyphStratum opcodes
        self.base_activation = base_activation

class SyntacticDistrict:
    """
    The Syntactic District manages the code-generation colony.
    
    It contains 4 zones:
    1. Parser: Converts raw text/tokens to DAG structures (Embedding/Data)
    2. Refactor: Optimizes existing DAGs (Memory/Load/Store)
    3. Synthesis: Generates new logic (Logic/Call/Branch)
    4. Validation: Tests execution (Head/Export)
    """
    
    def __init__(self, repair_engine):
        """Initialize with a repair engine (duck-typed, needs atlas_data, load_atlas, write_pixel, save_atlas)."""
        self.engine = repair_engine
        
        # Define the spatial layout of the colonies on the 1024x1024 atlas
        self.zones = {
            "PARSER": ColonyZone("Parser", 200, 200, 40, base_sector=0, base_activation=0.7),     # Embedding (DATA)
            "REFACTOR": ColonyZone("Refactor", 400, 200, 50, base_sector=2, base_activation=0.6), # FFN (LOAD/STORE)
            "SYNTHESIS": ColonyZone("Synthesis", 600, 200, 60, base_sector=1, base_activation=0.9),# Attention (CALL/BRANCH)
            "VALIDATION": ColonyZone("Validation", 800, 200, 30, base_sector=4, base_activation=0.8) # Head (EXPORT)
        }

    def seed_colony(self, zone_name: str) -> Dict[str, any]:
        """
        Physically writes the functional pattern of the colony into the substrate.
        This represents the 'construction' of the neural city district.
        """
        if zone_name not in self.zones:
            return {"success": False, "error": f"Unknown zone: {zone_name}"}
            
        zone = self.zones[zone_name]
        
        if not self.engine.atlas_data and not self.engine.load_atlas():
            return {"success": False, "error": "No atlas loaded"}
            
        logger.info(f"Seeding Colony: {zone.name} at ({zone.center_x}, {zone.center_y})")
        
        pixels_modified = 0
        
        # Write the specialized pattern to the atlas
        for dy in range(-zone.radius, zone.radius + 1):
            for dx in range(-zone.radius, zone.radius + 1):
                dist = (dx * dx + dy * dy) ** 0.5
                if dist > zone.radius:
                    continue
                    
                x = zone.center_x + dx
                y = zone.center_y + dy
                
                # Structural falloff (dense center, sparse edges)
                structure_density = 1.0 - (dist / zone.radius)
                
                # Activation based on density + base
                r = min(1.0, zone.base_activation * structure_density + 0.2)
                
                # Low entropy (highly structured colony)
                g = 0.1 + (0.1 * structure_density)
                
                # Sector mapping (determines the functional opcode family)
                # B channel expects a normalized value: sector / 5.0
                b = (zone.base_sector + 0.5) / 5.0
                
                self.engine.write_pixel(x, y, r, g, b)
                pixels_modified += 1
                
        self.engine.save_atlas()
        
        return {
            "success": True,
            "zone": zone.name,
            "pixels_modified": pixels_modified,
            "coords": {"x": zone.center_x, "y": zone.center_y, "radius": zone.radius}
        }
        
    def colonize_all(self) -> Dict[str, any]:
        """Deploy all zones in the Syntactic District."""
        results = {}
        total_pixels = 0
        
        for zone_name in self.zones.keys():
            res = self.seed_colony(zone_name)
            results[zone_name] = res
            if res["success"]:
                total_pixels += res["pixels_modified"]
                
        return {
            "success": True,
            "district": "Syntactic",
            "zones_seeded": len(self.zones),
            "total_pixels_modified": total_pixels,
            "details": results
        }
