"""
Neural Citizen - An autonomous agent that lives on the brain substrate.

Citizens are spawned from high-activation clusters, claim territory,
and participate in the neural city economy.

Phase 43: Citizens now MOVE, TRADE, and REPRODUCE.
"""

import time
import uuid
import math
import random
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Optional, Set, Tuple, Any
import json


class CitizenState(Enum):
    """Lifecycle states of a neural citizen."""
    DORMANT = "dormant"
    ACTIVE = "active"
    TRADING = "trading"
    MIGRATING = "migrating"
    REPRODUCING = "reproducing"
    DECLINING = "declining"
    DEAD = "dead"


class GuildType(Enum):
    """Guilds are formed by citizens with similar functions."""
    ATTENTION = "attention"
    MEMORY = "memory"
    LOGIC = "logic"
    SUBSTRATE = "substrate"
    INTENT = "intent"
    UNKNOWN = "unknown"


@dataclass
class NeuralCitizen:
    """
    An autonomous cognitive agent living on the brain substrate.
    Phase 43: Now with movement, trading, and reproduction.
    """
    # Identity
    id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    name: str = ""
    generation: int = 0

    # Position on brain atlas
    x: int = 0
    y: int = 0
    vx: float = 0.0# Velocity
    vy: float = 0.0

    # Functional properties
    opcode: str = "NOP"
    guild: GuildType = GuildType.UNKNOWN
    stratum: str = "Substrate"

    # State
    state: CitizenState = CitizenState.DORMANT
    energy: float = 1.0
    entropy: float = 0.0
    age: float = 0.0

    # Territory
    territory_radius: int = 16
    claimed_pixels: Set[Tuple[int, int]] = field(default_factory=set)

    # Phase 43: Movement
    home_x: int = 0  # Birthplace
    home_y: int = 0
    wanderlust: float = 0.5# Tendency to explore
    speed: float = 2.0

    # Phase 43: Reproduction
    reproduction_cooldown: float = 0.0
    reproduction_threshold: float = 0.8
    children: List[str] = field(default_factory=list)
    parent_id: Optional[str] = None

    # History
    birth_time: float = field(default_factory=time.time)
    total_energy_traded: float = 0.0
    total_distance_traveled: float = 0.0
    repairs_performed: int = 0

    # Relationships
    neighbors: Set[str] = field(default_factory=set)
    trade_partners: Set[str] = field(default_factory=set)

    def __post_init__(self):
        if not self.name:
            self.name = f"{self.opcode}_{self.id}"
        self.home_x = self.x
        self.home_y = self.y

    def update(self, dt: float, sampled_data: Dict) -> None:
        """Update citizen state with Phase 43 dynamics."""
        activation = sampled_data.get('r', 0.5)
        entropy = sampled_data.get('g', 0.0)

        # Update energy
        old_energy = self.energy
        self.energy = activation
        self.entropy = entropy
        self.age += dt

        # Update reproduction cooldown
        if self.reproduction_cooldown > 0:
            self.reproduction_cooldown -= dt

        # State machine
        if self.energy < 0.1:
            self.state = CitizenState.DECLINING
        elif self.energy < 0.01:
            self.state = CitizenState.DEAD
        elif self.reproduction_cooldown <= 0 and self.energy > self.reproduction_threshold:
            self.state = CitizenState.REPRODUCING
        elif entropy > 0.6:
            self.state = CitizenState.TRADING
        elif random.random() < self.wanderlust * 0.1:
            self.state = CitizenState.MIGRATING
        else:
            self.state = CitizenState.ACTIVE

    def move(self, dt: float, bounds: Tuple[int, int] = (1024, 1024)) -> Tuple[int, int]:
        """
        Phase 43: Move the citizen across the substrate.
        Returns new position.
        """
        if self.state not in [CitizenState.ACTIVE, CitizenState.MIGRATING]:
            return (self.x, self.y)

        # Random walk with home attraction
        dx = random.gauss(0, self.speed)
        dy = random.gauss(0, self.speed)

        # Attraction to home (prevents drifting too far)
        home_dx = (self.home_x - self.x) * 0.01
        home_dy = (self.home_y - self.y) * 0.01

        dx += home_dx
        dy += home_dy

        # Update position
        new_x = max(0, min(bounds[0] - 1, self.x + int(dx)))
        new_y = max(0, min(bounds[1] - 1, self.y + int(dy)))

        # Track distance
        dist = math.sqrt((new_x - self.x) ** 2 + (new_y - self.y) ** 2)
        self.total_distance_traveled += dist

        self.x = new_x
        self.y = new_y

        return (self.x, self.y)

    def can_reproduce(self) -> bool:
        """Check if citizen can reproduce."""
        return (
            self.state == CitizenState.REPRODUCING
            and self.reproduction_cooldown <= 0
            and self.energy > self.reproduction_threshold
            and self.age > 5.0# Must be mature
        )

    def reproduce(self, partner: Optional['NeuralCitizen'] = None) -> Optional['NeuralCitizen']:
        """
        Phase 43: Create offspring.
        Sexual reproduction if partner provided, otherwise asexual.
        """
        if not self.can_reproduce():
            return None

        # Cost of reproduction
        self.energy *= 0.6
        self.reproduction_cooldown = 30.0# 30 second cooldown

        # Determine offspring position (near parent)
        offset_x = random.randint(-32, 32)
        offset_y = random.randint(-32, 32)

        if partner:
            # Sexual: average positions
            child_x = (self.x + partner.x) // 2 + offset_x
            child_y = (self.y + partner.y) // 2 + offset_y
            # Inherit from both parents
            child_opcode = random.choice([self.opcode, partner.opcode])
            child_guild = random.choice([self.guild, partner.guild])
        else:
            # Asexual: clone near parent
            child_x = self.x + offset_x
            child_y = self.y + offset_y
            child_opcode = self.opcode
            child_guild = self.guild

        # Create child
        child = NeuralCitizen(
            x=max(0, min(1023, child_x)),
            y=max(0, min(1023, child_y)),
            opcode=child_opcode,
            guild=child_guild,
            generation=self.generation + 1,
            parent_id=self.id,
            energy=0.5,
            state=CitizenState.ACTIVE
        )

        # Record lineage
        self.children.append(child.id)

        return child

    def can_trade_with(self, other: 'NeuralCitizen') -> bool:
        """Check if trade is possible."""
        if other.state == CitizenState.DEAD:
            return False
        if self.guild == other.guild:
            return False
        return True

    def trade_energy(self, other: 'NeuralCitizen', amount: float) -> bool:
        """Trade energy with another citizen."""
        if not self.can_trade_with(other):
            return False

        if self.energy < amount:
            return False

        # Transfer
        self.energy -= amount
        other.energy += amount * 0.9

        # Record
        self.trade_partners.add(other.id)
        other.trade_partners.add(self.id)
        self.total_energy_traded += amount
        other.total_energy_traded += amount

        self.state = CitizenState.TRADING

        return True

    def distance_to(self, other: 'NeuralCitizen') -> float:
        """Calculate distance to another citizen."""
        return math.sqrt((self.x - other.x) ** 2 + (self.y - other.y) ** 2)

    def is_neighbor(self, other: 'NeuralCitizen', threshold: int = 64) -> bool:
        """Check if another citizen is a neighbor."""
        return self.distance_to(other) < threshold

    def claim_territory(self, pixels: Set[Tuple[int, int]]) -> int:
        """Claim ownership of pixels."""
        new_pixels = pixels - self.claimed_pixels
        self.claimed_pixels.update(pixels)
        return len(new_pixels)

    def release_territory(self, pixels: Set[Tuple[int, int]]) -> int:
        """Release ownership of pixels."""
        released = self.claimed_pixels & pixels
        self.claimed_pixels -= pixels
        return len(released)

    def to_dict(self) -> Dict:
        """Serialize citizen."""
        return {
            'id': self.id,
            'name': self.name,
            'generation': self.generation,
            'x': self.x,
            'y': self.y,
            'opcode': self.opcode,
            'guild': self.guild.value,
            'stratum': self.stratum,
            'state': self.state.value,
            'energy': self.energy,
            'entropy': self.entropy,
            'age': self.age,
            'territory_radius': self.territory_radius,
            'home': (self.home_x, self.home_y),
            'total_distance_traveled': self.total_distance_traveled,
            'children_count': len(self.children),
            'parent_id': self.parent_id,
            'birth_time': self.birth_time,
            'total_energy_traded': self.total_energy_traded
        }

    @classmethod
    def from_dict(cls, data: Dict) -> 'NeuralCitizen':
        """Deserialize citizen."""
        return cls(
            id=data.get('id', str(uuid.uuid4())[:8]),
            name=data.get('name', ''),
            generation=data.get('generation', 0),
            x=data.get('x', 0),
            y=data.get('y', 0),
            opcode=data.get('opcode', 'NOP'),
            guild=GuildType(data.get('guild', 'unknown')),
            stratum=data.get('stratum', 'Substrate'),
            state=CitizenState(data.get('state', 'dormant')),
            energy=data.get('energy', 1.0),
            entropy=data.get('entropy', 0.0),
            territory_radius=data.get('territory_radius', 16),
            birth_time=data.get('birth_time', time.time()),
            total_energy_traded=data.get('total_energy_traded', 0.0),
            parent_id=data.get('parent_id')
        )

    def __repr__(self) -> str:
        return f"Citizen({self.name}, gen={self.generation}, {self.state.value}, e={self.energy:.2f})"
