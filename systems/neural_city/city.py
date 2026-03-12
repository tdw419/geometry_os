"""
Neural City - The orchestrator for the neural city simulation.

The city is a self-organizing system of citizens that emerge from
brain activity, claim territory, and form a living society.

Phase 42 of Geometry OS.
"""

import json
import time
import logging
import random
from pathlib import Path
from typing import Dict, List, Optional, Set, Any
from dataclasses import dataclass

from .citizen import NeuralCitizen, CitizenState, GuildType
from .spawner import CitizenSpawner
from .territory import TerritoryMapper, Territory
from .citizen_writer import CitizenWriter

logger = logging.getLogger("NeuralCity")


@dataclass
class CityStats:
    """Statistics about the neural city."""
    population: int = 0
    active_citizens: int = 0
    total_energy: float = 0.0
    average_entropy: float = 0.0
    guild_distribution: Dict[str, int] = None
    territory_coverage: float = 0.0
    trade_volume: float = 0.0
    total_died: int = 0
    total_born: int = 0

    def __post_init__(self):
        if self.guild_distribution is None:
            self.guild_distribution = {}


class NeuralCity:
    """
    A self-organizing city of cognitive agents.
    
    The city monitors the brain atlas, spawns citizens from
    high-activity regions, and manages their interactions.
    
    Usage:
        city = NeuralCity()
        city.initialize(atlas_data, 1024, 1024)
        city.tick()  # Update city state
        city.render_overlay()  # Get visual overlay
    """
    
    def __init__(
        self,
        name: str = "NeuralCity",
        width: int = 1024,
        height: int = 1024,
        persist_path: Optional[str] = None
    ):
        self.name = name
        self.width = width
        self.height = height
        self.persist_path = Path(persist_path) if persist_path else None
        
        # Core components
        self.spawner = CitizenSpawner()
        self.territory_mapper = TerritoryMapper(width, height)
        self.writer = None  # CitizenWriter (set via set_substrate_writer)

        # City state
        self.tick_count = 0
        self.last_update = time.time()
        self.stats = CityStats()
        
        # History
        self.history: List[Dict] = []
        self.max_history = 1000
    
    def initialize(self, atlas_data: bytes, width: int = None, height: int = None) -> int:
        """
        Initialize the city from a brain atlas.
        
        Returns number of citizens spawned.
        """
        if width:
            self.width = width
        if height:
            self.height = height
        
        # Spawn initial citizens
        new_citizens = self.spawner.spawn_from_atlas(atlas_data, self.width, self.height)
        
        # Register territories
        for citizen in new_citizens:
            self.territory_mapper.register_territory(
                citizen.id,
                citizen.x,
                citizen.y,
                citizen.territory_radius
            )
        
        # Find neighbors
        self._update_neighbors()
        
        # Update stats
        self._update_stats()
        
        logger.info(f"Initialized {self.name} with {len(new_citizens)} citizens")
        
        return len(new_citizens)
    
    def tick(self, atlas_data: Optional[bytes] = None) -> Dict[str, Any]:
        """
        Update the city state.
        
        Args:
            atlas_data: Optional new atlas data to sample
            
        Returns tick summary.
        """
        self.tick_count += 1
        start_time = time.time()
        
        events = {
            'spawned': [],
            'died': [],
            'trades': [],
            'territory_changes': []
        }
        
        # Update existing citizens
        if atlas_data:
            dead = self.spawner.update_citizens(atlas_data, self.width, self.height)
            for citizen in dead:
                self.territory_mapper.remove_territory(citizen.id)
                events['died'].append(citizen.id)
        
        # Spawn new citizens from activity
        if atlas_data:
            new_citizens = self.spawner.spawn_from_atlas(atlas_data, self.width, self.height)
            for citizen in new_citizens:
                self.territory_mapper.register_territory(
                    citizen.id,
                    citizen.x,
                    citizen.y,
                    citizen.territory_radius
                )
                events['spawned'].append(citizen.id)
        
        # Process trades
        trades = self._process_trades()
        events['trades'] = trades

        # Phase 43: Process movement
        movements = self._process_movement()
        events['movements'] = movements

        # Phase 43: Process reproduction
        births = self._process_reproduction()
        events['births'] = births

        # Phase 44: Process evolution (natural selection)
        evolution = self._process_evolution()
        events['evolution'] = evolution

        # Phase 47: Process citizen writes (the closed loop)
        writes = self._process_citizen_writes()
        events['writes'] = writes

        # Update neighbors
        self._update_neighbors()
        
        # Update stats
        self._update_stats()
        
        # Record history
        elapsed = time.time() - start_time
        self._record_tick(events, elapsed)
        
        self.last_update = time.time()
        
        return {
            'tick': self.tick_count,
            'elapsed_ms': elapsed * 1000,
            'events': events,
            'stats': {
                'population': self.stats.population,
                'active': self.stats.active_citizens,
                'energy': self.stats.total_energy
            }
        }
    
    def _process_trades(self) -> List[Dict]:
        """Process energy trades between citizens."""
        trades = []
        
        # Find trading pairs
        citizens = list(self.spawner.citizens.values())
        for i, citizen_a in enumerate(citizens):
            if citizen_a.state != CitizenState.ACTIVE:
                continue
            
            for citizen_b in citizens[i+1:]:
                if not citizen_a.is_neighbor(citizen_b):
                    continue
                
                if citizen_a.can_trade_with(citizen_b):
                    # Calculate trade amount based on energy differential
                    diff = citizen_a.energy - citizen_b.energy
                    if abs(diff) > 0.1:
                        amount = abs(diff) * 0.1
                        if diff > 0:
                            success = citizen_a.trade_energy(citizen_b, amount)
                        else:
                            success = citizen_b.trade_energy(citizen_a, amount)
                        
                        if success:
                            trades.append({
                                'from': citizen_a.id if diff > 0 else citizen_b.id,
                                'to': citizen_b.id if diff > 0 else citizen_a.id,
                                'amount': amount
                            })
        
        return trades

    def _process_movement(self) -> List[Dict]:
        """Phase 43: Move citizens across the substrate."""
        movements = []

        for citizen in list(self.spawner.citizens.values()):
            if citizen.state in [CitizenState.ACTIVE, CitizenState.MIGRATING]:
                old_x, old_y = citizen.x, citizen.y
                new_pos = citizen.move(0.1, (self.width, self.height))

                if new_pos != (old_x, old_y):
                    # Update territory
                    self.territory_mapper.update_territory(
                        citizen.id,
                        citizen.x,
                        citizen.y,
                        citizen.territory_radius
                    )
                    movements.append({
                        'id': citizen.id,
                        'from': (old_x, old_y),
                        'to': new_pos
                    })

        return movements

    def _process_reproduction(self) -> List[Dict]:
        """Phase 43: Citizens reproduce."""
        births = []

        citizens = list(self.spawner.citizens.values())
        random.shuffle(citizens)  # Randomize order

        for citizen in citizens:
            if not citizen.can_reproduce():
                continue

            # Find partner for sexual reproduction
            partner = None
            for other in citizens:
                if other.id == citizen.id:
                    continue
                if other.can_reproduce() and citizen.is_neighbor(other):
                    partner = other
                    break

            # Create offspring
            child = citizen.reproduce(partner)
            if child:
                # Register with city
                self.spawner.citizens[child.id] = child
                self.territory_mapper.register_territory(
                    child.id,
                    child.x,
                    child.y,
                    child.territory_radius
                )

                births.append({
                    'parent': citizen.id,
                    'partner': partner.id if partner else None,
                    'child': child.id,
                    'generation': child.generation
                })

        return births

    def _update_neighbors(self) -> None:
        """Update neighbor relationships for all citizens."""
        for citizen_id, citizen in self.spawner.citizens.items():
            neighbors = self.territory_mapper.find_neighbors(citizen_id)
            citizen.neighbors = set(neighbors)
    
    def _update_stats(self) -> None:
        """Update city statistics."""
        citizens = list(self.spawner.citizens.values())
        
        self.stats.population = len(citizens)
        self.stats.active_citizens = sum(
            1 for c in citizens if c.state == CitizenState.ACTIVE
        )
        self.stats.total_energy = sum(c.energy for c in citizens)
        self.stats.average_entropy = (
            sum(c.entropy for c in citizens) / len(citizens)
            if citizens else 0
        )
        
        # Guild distribution
        guild_counts = {}
        for guild in GuildType:
            guild_counts[guild.value] = sum(
                1 for c in citizens if c.guild == guild
            )
        self.stats.guild_distribution = guild_counts
        
        # Territory coverage
        self.stats.territory_coverage = (
            len(self.territory_mapper.pixel_owners) /
            (self.width * self.height)
        )
        
        # Trade volume
        self.stats.trade_volume = sum(
            c.total_energy_traded for c in citizens
        )
    
    def _record_tick(self, events: Dict, elapsed: float) -> None:
        """Record tick in history."""
        record = {
            'tick': self.tick_count,
            'time': time.time(),
            'elapsed_ms': elapsed * 1000,
            'population': self.stats.population,
            'events': {
                k: len(v) if isinstance(v, list) else v
                for k, v in events.items()
            }
        }
        
        self.history.append(record)
        
        # Trim history
        if len(self.history) > self.max_history:
            self.history = self.history[-self.max_history:]
    
    def render_overlay(self) -> bytes:
        """
        Render the city as an RGBA overlay.
        
        Returns raw RGBA bytes for compositing.
        """
        return self.territory_mapper.render_overlay()
    
    def get_citizen(self, citizen_id: str) -> Optional[NeuralCitizen]:
        """Get a citizen by ID."""
        return self.spawner.citizens.get(citizen_id)
    
    def get_citizens_at(self, x: int, y: int) -> List[NeuralCitizen]:
        """Get all citizens at a location."""
        territory = self.territory_mapper.get_territory_at(x, y)
        if territory:
            citizen = self.get_citizen(territory.owner_id)
            if citizen:
                return [citizen]
        return []
    
    def get_guild_members(self, guild: GuildType) -> List[NeuralCitizen]:
        """Get all citizens in a guild."""
        return [
            c for c in self.spawner.citizens.values()
            if c.guild == guild
        ]
    
    def save(self, path: Optional[str] = None) -> bool:
        """Save city state to disk."""
        save_path = Path(path) if path else self.persist_path
        if not save_path:
            return False
        
        try:
            data = {
                'name': self.name,
                'width': self.width,
                'height': self.height,
                'tick_count': self.tick_count,
                'last_update': self.last_update,
                'spawner': self.spawner.to_dict(),
                'stats': {
                    'population': self.stats.population,
                    'active_citizens': self.stats.active_citizens,
                    'total_energy': self.stats.total_energy,
                    'trade_volume': self.stats.trade_volume
                },
                'history': self.history[-100:]  # Last 100 ticks
            }
            
            with open(save_path, 'w') as f:
                json.dump(data, f, indent=2)
            
            logger.info(f"Saved city to {save_path}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to save city: {e}")
            return False
    
    def load(self, path: Optional[str] = None) -> bool:
        """Load city state from disk."""
        load_path = Path(path) if path else self.persist_path
        if not load_path or not load_path.exists():
            return False
        
        try:
            with open(load_path, 'r') as f:
                data = json.load(f)
            
            self.name = data.get('name', self.name)
            self.width = data.get('width', self.width)
            self.height = data.get('height', self.height)
            self.tick_count = data.get('tick_count', 0)
            self.last_update = data.get('last_update', time.time())
            self.history = data.get('history', [])
            
            # Restore spawner
            if 'spawner' in data:
                self.spawner = CitizenSpawner.from_dict(data['spawner'])
                
                # Rebuild territory mapper
                for citizen in self.spawner.citizens.values():
                    self.territory_mapper.register_territory(
                        citizen.id,
                        citizen.x,
                        citizen.y,
                        citizen.territory_radius
                    )
            
            self._update_stats()
            
            logger.info(f"Loaded city from {load_path}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to load city: {e}")
            return False
    
    def to_dict(self) -> Dict:
        """Serialize city state."""
        return {
            'name': self.name,
            'tick': self.tick_count,
            'stats': {
                'population': self.stats.population,
                'active': self.stats.active_citizens,
                'total_energy': self.stats.total_energy,
                'average_entropy': self.stats.average_entropy,
                'guild_distribution': self.stats.guild_distribution,
                'territory_coverage': self.stats.territory_coverage,
                'trade_volume': self.stats.trade_volume
            },
            'citizens': [
                c.to_dict() for c in self.spawner.citizens.values()
            ],
            'territories': self.territory_mapper.to_dict()
        }

    def _process_evolution(self) -> Dict:
        """
        Phase 44: Natural selection.

        Citizens below energy threshold die.
        Citizens above reproduction threshold spawn offspring.
        """
        deaths = []
        births = []

        citizens = list(self.spawner.citizens.values())

        # Process deaths
        for citizen in citizens:
            if citizen.state == CitizenState.DEAD or citizen.energy < 0.01:
                self.territory_mapper.remove_territory(citizen.id)
                if citizen.id in self.spawner.citizens:
                    del self.spawner.citizens[citizen.id]
                deaths.append(citizen.id)
                self.stats.total_died += 1

        # Process reproduction
        for citizen in list(self.spawner.citizens.values()):
            if citizen.can_reproduce():
                # Find nearby partner for sexual reproduction
                partner = None
                for other in self.spawner.citizens.values():
                    if other.id != citizen.id and other.can_reproduce():
                        if citizen.distance_to(other) < 64:
                            partner = other
                            break

                child = citizen.reproduce(partner)
                if child:
                    self.spawner.citizens[child.id] = child
                    self.territory_mapper.register_territory(
                        child.id, child.x, child.y, child.territory_radius
                    )
                    births.append(child.id)
                    self.stats.total_born += 1

        return {'deaths': deaths, 'births': births}

    def set_substrate_writer(self, writer) -> bool:
        """
        Phase 47: Set the substrate writer for citizen writes.

        Args:
            writer: Object with write_pixel(x, y, r, g, b) method
        """
        self.writer = CitizenWriter(writer)
        return True

    def _process_citizen_writes(self) -> List[Dict]:
        """
        Phase 47: Process citizens writing back to the substrate.

        High-energy citizens can write mutations to their territory,
        completing the Ouroboros loop.
        """
        writes = []

        if not self.writer:
            return writes

        citizens = list(self.spawner.citizens.values())

        for citizen in citizens:
            # Only active, high-energy citizens can write
            if citizen.state != CitizenState.ACTIVE:
                continue
            if citizen.energy < 0.7:
                continue
            if random.random() > 0.1:  # 10% chance per tick
                continue

            # Choose write action based on guild
            guild = citizen.guild.value

            if guild == 'attention':
                # Boost activation around citizen
                success = self.writer.write_activation_boost(
                    citizen.x, citizen.y, radius=8, boost=0.2,
                    current_r=citizen.energy, current_g=citizen.entropy
                )
                if success:
                    writes.append({
                        'citizen': citizen.id,
                        'type': 'activation_boost',
                        'location': (citizen.x, citizen.y)
                    })

            elif guild == 'logic':
                # Write neural pathway to a neighbor
                neighbors = [c for c in citizens if citizen.is_neighbor(c) and c.id != citizen.id]
                if neighbors:
                    target = random.choice(neighbors)
                    success = self.writer.write_neural_pathway(
                        citizen.x, citizen.y, target.x, target.y,
                        citizen.opcode
                    )
                    if success:
                        writes.append({
                            'citizen': citizen.id,
                            'type': 'neural_pathway',
                            'from': (citizen.x, citizen.y),
                            'to': (target.x, target.y)
                        })

            elif guild == 'intent':
                # Write guild territory pattern
                success = self.writer.write_guild_territory(
                    citizen.x, citizen.y, radius=12, guild=guild
                )
                if success:
                    writes.append({
                        'citizen': citizen.id,
                        'type': 'guild_territory',
                        'guild': guild,
                        'location': (citizen.x, citizen.y)
                    })

            elif guild == 'memory':
                # Write creative pattern occasionally
                if random.random() < 0.3:
                    pattern = random.choice(['spiral', 'web', 'crystal'])
                    success = self.writer.write_creative_pattern(
                        citizen.x, citizen.y, pattern_type=pattern, seed=citizen.generation
                    )
                    if success:
                        writes.append({
                            'citizen': citizen.id,
                            'type': 'creative_pattern',
                            'pattern': pattern,
                            'location': (citizen.x, citizen.y)
                        })

        return writes
