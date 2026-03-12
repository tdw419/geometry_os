"""
Citizen Spawner - Detects high-activation clusters and spawns citizens.

The spawner is the "birth mechanism" of the neural city.
It monitors the brain atlas for activity patterns and creates
new citizens when conditions are met.
"""

import time
import logging
from typing import Dict, List, Optional, Set, Tuple
from dataclasses import dataclass

from .citizen import NeuralCitizen, CitizenState, GuildType

logger = logging.getLogger("NeuralCity")


# Opcode mapping based on sector (B channel)
SECTOR_OPCODES = {
    0: ("DATA", GuildType.SUBSTRATE),
    1: ("CALL", GuildType.ATTENTION),
    2: ("LOAD", GuildType.MEMORY),
    3: ("TYPE", GuildType.LOGIC),
    4: ("EXPORT", GuildType.INTENT),
}

# Stratum based on activation level
ACTIVITY_STRATA = [
    (0.8, "Intent"),
    (0.6, "Logic"),
    (0.4, "Memory"),
    (0.2, "Spec"),
    (0.0, "Substrate"),
]


@dataclass
class Cluster:
    """A detected activity cluster that may spawn a citizen."""
    x: int
    y: int
    activation: float
    entropy: float
    sector: int
    size: int  # Number of pixels in cluster
    peak_intensity: float


class CitizenSpawner:
    """
    Detects activity clusters and spawns neural citizens.
    
    The spawner monitors the brain atlas and creates citizens when:
    1. Activation exceeds spawn threshold
    2. Cluster is large enough to support a citizen
    3. No existing citizen claims the territory
    """
    
    def __init__(
        self,
        spawn_threshold: float = 0.7,
        min_cluster_size: int = 16,
        entropy_penalty: float = 0.3,
        citizen_spacing: int = 32
    ):
        self.spawn_threshold = spawn_threshold
        self.min_cluster_size = min_cluster_size
        self.entropy_penalty = entropy_penalty
        self.citizen_spacing = citizen_spacing
        
        self.citizens: Dict[str, NeuralCitizen] = {}
        self.claimed_territory: Set[Tuple[int, int]] = set()
        self.spawn_history: List[Dict] = []
        
        self.stats = {
            'total_spawned': 0,
            'total_died': 0,
            'current_population': 0
        }
    
    def scan_for_clusters(
        self,
        atlas_data: bytes,
        width: int,
        height: int,
        sample_step: int = 8
    ) -> List[Cluster]:
        """
        Scan the atlas for activity clusters.
        
        Args:
            atlas_data: Raw RGBA bytes
            width: Atlas width
            height: Atlas height
            sample_step: Sampling step size
            
        Returns list of detected clusters.
        """
        clusters = []
        visited = set()
        
        for y in range(0, height, sample_step):
            for x in range(0, width, sample_step):
                if (x, y) in visited:
                    continue
                
                # Sample pixel
                idx = (y * width + x) * 4
                if idx + 3 >= len(atlas_data):
                    continue
                
                r = atlas_data[idx] / 255.0
                g = atlas_data[idx + 1] / 255.0
                b = atlas_data[idx + 2] / 255.0
                
                # Check if above threshold
                effective_activation = r - (g * self.entropy_penalty)
                if effective_activation < self.spawn_threshold:
                    continue
                
                # Flood-fill to find cluster
                cluster_pixels = self._flood_fill(
                    atlas_data, width, height, x, y,
                    sample_step, visited, self.spawn_threshold
                )
                
                if len(cluster_pixels) < self.min_cluster_size:
                    continue
                
                # Find cluster center and properties
                cx = sum(p[0] for p in cluster_pixels) // len(cluster_pixels)
                cy = sum(p[1] for p in cluster_pixels) // len(cluster_pixels)
                
                # Sample center for properties
                center_idx = (cy * width + cx) * 4
                center_r = atlas_data[center_idx] / 255.0
                center_g = atlas_data[center_idx + 1] / 255.0
                center_b = atlas_data[center_idx + 2] / 255.0
                
                cluster = Cluster(
                    x=cx,
                    y=cy,
                    activation=center_r,
                    entropy=center_g,
                    sector=int(center_b * 5) % 5,
                    size=len(cluster_pixels),
                    peak_intensity=max(
                        atlas_data[(p[1] * width + p[0]) * 4] / 255.0
                        for p in cluster_pixels
                    )
                )
                clusters.append(cluster)
        
        return clusters
    
    def _flood_fill(
        self,
        atlas_data: bytes,
        width: int,
        height: int,
        start_x: int,
        start_y: int,
        step: int,
        visited: Set[Tuple[int, int]],
        threshold: float
    ) -> Set[Tuple[int, int]]:
        """Flood-fill to find connected high-activity region."""
        cluster = set()
        stack = [(start_x, start_y)]
        
        while stack:
            x, y = stack.pop()
            
            if (x, y) in visited:
                continue
            if x < 0 or x >= width or y < 0 or y >= height:
                continue
            
            idx = (y * width + x) * 4
            if idx + 3 >= len(atlas_data):
                continue
            
            r = atlas_data[idx] / 255.0
            g = atlas_data[idx + 1] / 255.0
            effective = r - (g * self.entropy_penalty)
            
            if effective < threshold:
                continue
            
            visited.add((x, y))
            cluster.add((x, y))
            
            # Add neighbors
            for dx, dy in [(step, 0), (-step, 0), (0, step), (0, -step)]:
                stack.append((x + dx, y + dy))
        
        return cluster
    
    def spawn_citizen(self, cluster: Cluster) -> Optional[NeuralCitizen]:
        """
        Spawn a citizen from a cluster.
        
        Returns the new citizen, or None if spawn failed.
        """
        # Check if territory is already claimed
        for dx in range(-self.citizen_spacing, self.citizen_spacing + 1, 8):
            for dy in range(-self.citizen_spacing, self.citizen_spacing + 1, 8):
                if (cluster.x + dx, cluster.y + dy) in self.claimed_territory:
                    logger.debug(f"Spawn blocked at ({cluster.x}, {cluster.y}) - territory claimed")
                    return None
        
        # Determine opcode and guild from sector
        opcode, guild = SECTOR_OPCODES.get(cluster.sector, ("NOP", GuildType.UNKNOWN))
        
        # Determine stratum from activation
        stratum = "Substrate"
        for threshold, name in ACTIVITY_STRATA:
            if cluster.activation >= threshold:
                stratum = name
                break
        
        # Create citizen
        citizen = NeuralCitizen(
            x=cluster.x,
            y=cluster.y,
            opcode=opcode,
            guild=guild,
            stratum=stratum,
            state=CitizenState.ACTIVE,
            energy=cluster.activation,
            entropy=cluster.entropy,
            territory_radius=min(64, cluster.size // 4)
        )
        
        # Claim initial territory
        territory = self._get_territory_pixels(citizen)
        citizen.claim_territory(territory)
        self.claimed_territory.update(territory)
        
        # Register
        self.citizens[citizen.id] = citizen
        self.stats['total_spawned'] += 1
        self.stats['current_population'] = len(self.citizens)
        
        # Record spawn
        self.spawn_history.append({
            'time': time.time(),
            'citizen_id': citizen.id,
            'cluster': {
                'x': cluster.x,
                'y': cluster.y,
                'activation': cluster.activation,
                'sector': cluster.sector
            }
        })
        
        logger.info(f"Spawned citizen {citizen.name} at ({cluster.x}, {cluster.y}) - {guild.value} guild")
        
        return citizen
    
    def _get_territory_pixels(self, citizen: NeuralCitizen) -> Set[Tuple[int, int]]:
        """Get all pixels in citizen's territory."""
        pixels = set()
        for dx in range(-citizen.territory_radius, citizen.territory_radius + 1):
            for dy in range(-citizen.territory_radius, citizen.territory_radius + 1):
                if dx * dx + dy * dy <= citizen.territory_radius ** 2:
                    pixels.add((citizen.x + dx, citizen.y + dy))
        return pixels
    
    def update_citizens(
        self,
        atlas_data: bytes,
        width: int,
        height: int
    ) -> List[NeuralCitizen]:
        """
        Update all citizens based on substrate state.
        
        Returns list of citizens that died.
        """
        dead = []
        
        for citizen in list(self.citizens.values()):
            # Sample citizen's location
            idx = (citizen.y * width + citizen.x) * 4
            if idx + 3 >= len(atlas_data):
                continue
            
            r = atlas_data[idx] / 255.0
            g = atlas_data[idx + 1] / 255.0
            b = atlas_data[idx + 2] / 255.0
            
            # Update citizen
            citizen.update(1.0, {'r': r, 'g': g, 'b': b})
            
            # Update territory claims
            new_territory = self._get_territory_pixels(citizen)
            citizen.claim_territory(new_territory)
            
            # Check for death
            if citizen.state == CitizenState.DEAD:
                dead.append(citizen)
                self._remove_citizen(citizen)
        
        return dead
    
    def _remove_citizen(self, citizen: NeuralCitizen) -> None:
        """Remove a dead citizen."""
        # Release territory
        self.claimed_territory -= citizen.claimed_pixels
        
        # Remove from registry
        del self.citizens[citizen.id]
        
        # Update stats
        self.stats['total_died'] += 1
        self.stats['current_population'] = len(self.citizens)
        
        logger.info(f"Citizen {citizen.name} died after {time.time() - citizen.birth_time:.1f}s")
    
    def spawn_from_atlas(
        self,
        atlas_data: bytes,
        width: int,
        height: int
    ) -> List[NeuralCitizen]:
        """
        Full spawn cycle: scan for clusters and spawn citizens.
        
        Returns list of newly spawned citizens.
        """
        clusters = self.scan_for_clusters(atlas_data, width, height)
        
        new_citizens = []
        for cluster in clusters:
            citizen = self.spawn_citizen(cluster)
            if citizen:
                new_citizens.append(citizen)
        
        return new_citizens
    
    def get_citizens_by_guild(self) -> Dict[GuildType, List[NeuralCitizen]]:
        """Group citizens by guild."""
        groups = {guild: [] for guild in GuildType}
        for citizen in self.citizens.values():
            groups[citizen.guild].append(citizen)
        return groups
    
    def get_citizens_by_state(self) -> Dict[CitizenState, List[NeuralCitizen]]:
        """Group citizens by state."""
        groups = {state: [] for state in CitizenState}
        for citizen in self.citizens.values():
            groups[citizen.state].append(citizen)
        return groups
    
    def to_dict(self) -> Dict:
        """Serialize spawner state."""
        return {
            'citizens': {c.id: c.to_dict() for c in self.citizens.values()},
            'stats': self.stats,
            'spawn_history': self.spawn_history[-100:]  # Last 100 spawns
        }
    
    @classmethod
    def from_dict(cls, data: Dict) -> 'CitizenSpawner':
        """Deserialize spawner state."""
        spawner = cls()
        spawner.stats = data.get('stats', spawner.stats)
        spawner.spawn_history = data.get('spawn_history', [])
        
        for citizen_data in data.get('citizens', {}).values():
            citizen = NeuralCitizen.from_dict(citizen_data)
            spawner.citizens[citizen.id] = citizen
            spawner.claimed_territory.update(citizen.claimed_pixels)
        
        return spawner
