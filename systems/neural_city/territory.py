"""
Territory Mapper - Visualizes and manages citizen territories.

Territories are the "real estate" of the neural city.
Each citizen claims a region of the brain atlas as their own.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Set, Tuple
import json


@dataclass
class Territory:
    """
    A claimed region of the brain substrate.
    
    Territories have borders, resources, and can overlap.
    """
    owner_id: str
    center_x: int
    center_y: int
    radius: int
    pixels: Set[Tuple[int, int]] = field(default_factory=set)
    
    # Resources
    total_activation: float = 0.0
    average_entropy: float = 0.0
    
    # Borders
    border_pixels: Set[Tuple[int, int]] = field(default_factory=set)
    neighbors: Set[str] = field(default_factory=set)  # Neighboring territory IDs
    
    def contains(self, x: int, y: int) -> bool:
        """Check if a point is in this territory."""
        return (x, y) in self.pixels
    
    def overlaps(self, other: 'Territory') -> bool:
        """Check if territories overlap."""
        return bool(self.pixels & other.pixels)
    
    def border_with(self, other: 'Territory') -> Set[Tuple[int, int]]:
        """Get the border pixels between two territories."""
        # A border pixel is one that's adjacent to the other territory
        border = set()
        for x, y in self.pixels:
            for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                if (x + dx, y + dy) in other.pixels:
                    border.add((x, y))
                    break
        return border
    
    def to_dict(self) -> Dict:
        """Serialize territory."""
        return {
            'owner_id': self.owner_id,
            'center_x': self.center_x,
            'center_y': self.center_y,
            'radius': self.radius,
            'pixel_count': len(self.pixels),
            'total_activation': self.total_activation,
            'average_entropy': self.average_entropy,
            'border_count': len(self.border_pixels),
            'neighbors': list(self.neighbors)
        }


class TerritoryMapper:
    """
    Maps and visualizes citizen territories.
    
    The mapper maintains the territory registry and can
    render territories as overlays on the brain atlas.
    """
    
    def __init__(self, width: int = 1024, height: int = 1024):
        self.width = width
        self.height = height
        
        # Territory registry
        self.territories: Dict[str, Territory] = {}
        
        # Pixel ownership map (pixel -> owner_id)
        self.pixel_owners: Dict[Tuple[int, int], str] = {}
        
        # Conflict zones (pixels claimed by multiple citizens)
        self.conflicts: Set[Tuple[int, int]] = set()
    
    def register_territory(self, citizen_id: str, x: int, y: int, radius: int) -> Territory:
        """
        Register a new territory.
        
        Returns the territory object.
        """
        # Generate pixel set
        pixels = set()
        for dx in range(-radius, radius + 1):
            for dy in range(-radius, radius + 1):
                if dx * dx + dy * dy <= radius * radius:
                    px, py = x + dx, y + dy
                    if 0 <= px < self.width and 0 <= py < self.height:
                        pixels.add((px, py))
        
        # Create territory
        territory = Territory(
            owner_id=citizen_id,
            center_x=x,
            center_y=y,
            radius=radius,
            pixels=pixels
        )
        
        # Register pixels
        for pixel in pixels:
            if pixel in self.pixel_owners:
                # Conflict!
                self.conflicts.add(pixel)
            else:
                self.pixel_owners[pixel] = citizen_id
        
        self.territories[citizen_id] = territory
        
        return territory
    
    def update_territory(self, citizen_id: str, x: int, y: int, radius: int) -> Optional[Territory]:
        """
        Update an existing territory.
        
        Returns the updated territory, or None if not found.
        """
        if citizen_id not in self.territories:
            return None
        
        # Remove old territory
        old_territory = self.territories[citizen_id]
        for pixel in old_territory.pixels:
            if self.pixel_owners.get(pixel) == citizen_id:
                del self.pixel_owners[pixel]
            self.conflicts.discard(pixel)
        
        # Register new territory
        return self.register_territory(citizen_id, x, y, radius)
    
    def remove_territory(self, citizen_id: str) -> bool:
        """
        Remove a territory.
        
        Returns True if territory existed.
        """
        if citizen_id not in self.territories:
            return False
        
        territory = self.territories[citizen_id]
        
        # Release pixels
        for pixel in territory.pixels:
            if self.pixel_owners.get(pixel) == citizen_id:
                del self.pixel_owners[pixel]
            self.conflicts.discard(pixel)
        
        del self.territories[citizen_id]
        return True
    
    def find_neighbors(self, citizen_id: str) -> List[str]:
        """
        Find all territories adjacent to this one.
        """
        if citizen_id not in self.territories:
            return []
        
        territory = self.territories[citizen_id]
        neighbors = set()
        
        for x, y in territory.pixels:
            for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                neighbor_pixel = (x + dx, y + dy)
                if neighbor_pixel in self.pixel_owners:
                    owner = self.pixel_owners[neighbor_pixel]
                    if owner != citizen_id:
                        neighbors.add(owner)
        
        return list(neighbors)
    
    def get_territory_at(self, x: int, y: int) -> Optional[Territory]:
        """Get the territory at a specific pixel."""
        owner_id = self.pixel_owners.get((x, y))
        if owner_id:
            return self.territories.get(owner_id)
        return None
    
    def render_overlay(self) -> bytes:
        """
        Render territories as an RGBA overlay.
        
        Each territory gets a unique color based on owner's guild.
        Returns raw RGBA bytes.
        """
        overlay = bytearray(self.width * self.height * 4)
        
        # Guild colors (RGBA)
        guild_colors = {
            'attention': (0, 150, 255, 100),    # Blue
            'memory': (0, 255, 150, 100),       # Green
            'logic': (255, 200, 0, 100),        # Yellow
            'substrate': (150, 150, 150, 100),  # Gray
            'intent': (255, 100, 100, 100),     # Red
            'unknown': (100, 100, 100, 50),     # Dark gray
        }
        
        for citizen_id, territory in self.territories.items():
            # Determine color (would need guild info in practice)
            color = guild_colors['unknown']
            
            for x, y in territory.pixels:
                idx = (y * self.width + x) * 4
                overlay[idx] = color[0]
                overlay[idx + 1] = color[1]
                overlay[idx + 2] = color[2]
                overlay[idx + 3] = color[3]
            
            # Render borders brighter
            border_color = tuple(min(255, c + 100) for c in color[:3]) + (200,)
            for x, y in territory.border_pixels:
                idx = (y * self.width + x) * 4
                overlay[idx] = border_color[0]
                overlay[idx + 1] = border_color[1]
                overlay[idx + 2] = border_color[2]
                overlay[idx + 3] = border_color[3]
        
        # Render conflicts in red
        for x, y in self.conflicts:
            idx = (y * self.width + x) * 4
            overlay[idx] = 255
            overlay[idx + 1] = 0
            overlay[idx + 2] = 0
            overlay[idx + 3] = 255
        
        return bytes(overlay)
    
    def to_dict(self) -> Dict:
        """Serialize mapper state."""
        return {
            'width': self.width,
            'height': self.height,
            'territories': {k: v.to_dict() for k, v in self.territories.items()},
            'total_pixels_claimed': len(self.pixel_owners),
            'conflict_count': len(self.conflicts)
        }
