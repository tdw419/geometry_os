"""
Dream Engine - Phase 48

Citizens dream during low-activity periods, consolidating patterns
and forming new neural connections. Dreams are the city's memory compression.

The city sleeps. The city dreams.
"""

import time
import random
import math
from typing import Dict, List, Optional, Tuple, Set
from dataclasses import dataclass, field
from enum import Enum


class DreamState(Enum):
    """States of the dreaming cycle."""
    AWAKE = "awake"
    DROWSY = "drowsy"
    REM = "rem"           # Rapid Eye Movement - active dreaming
    DEEP = "deep"         # Deep sleep - consolidation
    LUCID = "lucid"       # Lucid dreaming - conscious control


@dataclass
class DreamFragment:
    """A fragment of a dream - a replayed or imagined pattern."""
    id: str
    source_citizen: str
    pattern_type: str     # 'replay', 'synthesis', 'nightmare', 'wish'
    coordinates: List[Tuple[int, int]]
    intensity: float
    timestamp: float = field(default_factory=time.time)


@dataclass
class DreamSession:
    """A complete dreaming session."""
    start_time: float
    end_time: float = 0.0
    state: DreamState = DreamState.AWAKE
    fragments: List[DreamFragment] = field(default_factory=list)
    consolidations: int = 0
    new_connections: int = 0
    nightmares_healed: int = 0


class DreamEngine:
    """
    Manages the city's sleep and dreaming cycles.

    During low-activity periods:
    1. Citizens enter dream states
    2. Recent patterns are replayed and consolidated
    3. New connections are formed (creativity)
    4. Nightmares (fractures) are processed and healed

    Benefits:
    - Memory consolidation
    - Creative insight (new pathways)
    - Trauma processing (nightmare healing)
    - Energy restoration
    """

    def __init__(self, city, substrate_writer=None):
        """
        Initialize the dream engine.

        Args:
            city: NeuralCity instance
            substrate_writer: Optional writer for dream modifications
        """
        self.city = city
        self.writer = substrate_writer

        # Sleep cycle parameters
        self.activity_threshold = 0.3    # Below this = drowsy
        self.dream_threshold = 0.15      # Below this = dream
        self.deep_threshold = 0.05       # Below this = deep sleep

        # State
        self.state = DreamState.AWAKE
        self.current_session: Optional[DreamSession] = None
        self.dream_history: List[DreamSession] = []
        self.recent_events: List[Dict] = []  # Events to replay in dreams
        self.max_recent_events = 100

        # Dream artifacts
        self.dream_fragments: Dict[str, DreamFragment] = {}
        self.recurring_patterns: Dict[str, int] = {}  # pattern -> frequency

        # Statistics
        self.stats = {
            'total_dreams': 0,
            'total_consolidations': 0,
            'total_connections': 0,
            'total_nightmares_healed': 0,
            'avg_dream_duration': 0.0
        }

    def calculate_activity_level(self) -> float:
        """Calculate current city activity level."""
        if not self.city or not self.city.spawner.citizens:
            return 0.0

        citizens = list(self.city.spawner.citizens.values())
        if not citizens:
            return 0.0

        # Average energy of active citizens
        active = [c for c in citizens if c.state.value == 'active']
        if not active:
            return 0.0

        avg_energy = sum(c.energy for c in active) / len(active)

        # Factor in movement
        moving = sum(1 for c in active if hasattr(c, 'vx') and (c.vx != 0 or c.vy != 0))
        movement_ratio = moving / len(active) if active else 0

        # Combined activity score
        activity = avg_energy * 0.7 + movement_ratio * 0.3
        return activity

    def update_state(self) -> DreamState:
        """Update dream state based on activity level."""
        activity = self.calculate_activity_level()

        old_state = self.state

        if activity < self.deep_threshold:
            self.state = DreamState.DEEP
        elif activity < self.dream_threshold:
            self.state = DreamState.REM
        elif activity < self.activity_threshold:
            self.state = DreamState.DROWSY
        else:
            self.state = DreamState.AWAKE

        # Handle state transitions
        if old_state != self.state:
            self._handle_state_transition(old_state, self.state)

        return self.state

    def _handle_state_transition(self, old_state: DreamState, new_state: DreamState):
        """Handle transitions between dream states."""
        # Entering dream state
        if new_state in [DreamState.REM, DreamState.DEEP, DreamState.LUCID]:
            if not self.current_session:
                self.current_session = DreamSession(
                    start_time=time.time(),
                    state=new_state
                )
                self.stats['total_dreams'] += 1

        # Waking up
        elif new_state == DreamState.AWAKE and self.current_session:
            self._end_dream_session()

    def _end_dream_session(self):
        """End the current dream session and record it."""
        if not self.current_session:
            return

        self.current_session.end_time = time.time()

        # Update stats
        duration = self.current_session.end_time - self.current_session.start_time
        total = self.stats['total_dreams']
        self.stats['avg_dream_duration'] = (
            (self.stats['avg_dream_duration'] * (total - 1) + duration) / total
        )

        # Save to history
        self.dream_history.append(self.current_session)
        if len(self.dream_history) > 50:
            self.dream_history = self.dream_history[-50:]

        self.current_session = None

    def record_event(self, event: Dict):
        """Record an event for potential dream replay."""
        self.recent_events.append({
            **event,
            'timestamp': time.time()
        })
        if len(self.recent_events) > self.max_recent_events:
            self.recent_events = self.recent_events[-self.max_recent_events:]

    def tick(self) -> Dict:
        """
        Process one dream engine tick.

        Returns dream activity summary.
        """
        self.update_state()

        result = {
            'state': self.state.value,
            'activity': self.calculate_activity_level(),
            'fragments_created': 0,
            'consolidations': 0,
            'connections': 0,
            'nightmares_healed': 0
        }

        # Process based on state
        if self.state == DreamState.REM:
            result.update(self._process_rem_dream())
        elif self.state == DreamState.DEEP:
            result.update(self._process_deep_sleep())
        elif self.state == DreamState.LUCID:
            result.update(self._process_lucid_dream())
        elif self.state == DreamState.DROWSY:
            result.update(self._process_drowsy())

        return result

    def _process_drowsy(self) -> Dict:
        """Process drowsy state - light processing."""
        return {
            'fragments_created': 0,
            'consolidations': 0,
            'connections': 0,
            'nightmares_healed': 0,
            'message': 'City is drowsy, preparing for sleep...'
        }

    def _process_rem_dream(self) -> Dict:
        """
        Process REM dreaming - active pattern replay and synthesis.

        During REM:
        - Replay recent events as dream fragments
        - Synthesize new patterns from combinations
        - Creative connections form
        """
        result = {
            'fragments_created': 0,
            'consolidations': 0,
            'connections': 0,
            'nightmares_healed': 0
        }

        if not self.current_session:
            return result

        citizens = list(self.city.spawner.citizens.values())
        dreaming_citizens = [c for c in citizens if c.energy > 0.2]

        for citizen in dreaming_citizens[:10]:  # Limit per tick
            # Replay recent event
            if self.recent_events and random.random() < 0.3:
                event = random.choice(self.recent_events[-20:])
                fragment = self._create_replay_fragment(citizen, event)
                if fragment:
                    self.dream_fragments[fragment.id] = fragment
                    self.current_session.fragments.append(fragment)
                    result['fragments_created'] += 1

            # Synthesize new pattern
            if random.random() < 0.1:
                fragment = self._create_synthesis_fragment(citizen)
                if fragment:
                    self.dream_fragments[fragment.id] = fragment
                    self.current_session.fragments.append(fragment)
                    result['fragments_created'] += 1
                    result['connections'] += 1
                    self.stats['total_connections'] += 1

        # Track recurring patterns
        for fragment in self.current_session.fragments:
            pattern_key = fragment.pattern_type
            self.recurring_patterns[pattern_key] = self.recurring_patterns.get(pattern_key, 0) + 1

        return result

    def _process_deep_sleep(self) -> Dict:
        """
        Process deep sleep - consolidation and healing.

        During deep sleep:
        - Consolidate memory patterns
        - Heal nightmares (fractures)
        - Restore energy
        """
        result = {
            'fragments_created': 0,
            'consolidations': 0,
            'connections': 0,
            'nightmares_healed': 0
        }

        if not self.current_session:
            return result

        # Consolidate recent patterns
        if self.recent_events:
            # Compress events into fewer, stronger patterns
            to_consolidate = self.recent_events[-10:]
            if len(to_consolidate) >= 3:
                # Create consolidation fragment
                citizens = list(self.city.spawner.citizens.values())
                if citizens:
                    citizen = random.choice(citizens)
                    fragment = DreamFragment(
                        id=f"consolidate_{int(time.time() * 1000)}",
                        source_citizen=citizen.id,
                        pattern_type='consolidation',
                        coordinates=[(c.x, c.y) for c in citizens[:5]],
                        intensity=0.8
                    )
                    self.current_session.fragments.append(fragment)
                    self.current_session.consolidations += 1
                    result['consolidations'] = 1
                    self.stats['total_consolidations'] += 1

        # Heal nightmares (detect and process fractures)
        if hasattr(self.city, 'territory_mapper'):
            # Find high-entropy areas (potential nightmares)
            nightmares_found = self._detect_nightmares()
            for nightmare in nightmares_found[:3]:
                if self.writer and hasattr(self.writer, 'write_pixel'):
                    self._heal_nightmare(nightmare)
                    result['nightmares_healed'] += 1
                    self.current_session.nightmares_healed += 1
                    self.stats['total_nightmares_healed'] += 1

        # Restore energy to sleeping citizens
        for citizen in self.city.spawner.citizens.values():
            if citizen.energy < 0.5:
                citizen.energy = min(1.0, citizen.energy + 0.05)

        return result

    def _process_lucid_dream(self) -> Dict:
        """
        Process lucid dreaming - conscious control over dreams.

        During lucid dreams:
        - Intentional pattern creation
        - Direct substrate modification
        - Creative breakthroughs
        """
        result = {
            'fragments_created': 0,
            'consolidations': 0,
            'connections': 0,
            'nightmares_healed': 0
        }

        if not self.writer:
            return result

        # Find citizens with high energy (lucid dreamers)
        citizens = list(self.city.spawner.citizens.values())
        lucid_dreamers = [c for c in citizens if c.energy > 0.8]

        for dreamer in lucid_dreamers[:5]:
            # Create intentional pattern
            pattern = random.choice(['spiral', 'crystal', 'web'])
            if hasattr(self.writer, 'write_creative_pattern'):
                self.writer.write_creative_pattern(
                    dreamer.x, dreamer.y,
                    pattern_type=pattern,
                    seed=int(dreamer.energy * 100)
                )
                result['connections'] += 1

        return result

    def _create_replay_fragment(self, citizen, event: Dict) -> Optional[DreamFragment]:
        """Create a dream fragment that replays a recent event."""
        event_type = event.get('type', event.get('event', 'unknown'))

        coords = []
        if 'location' in event:
            coords.append(event['location'])
        elif 'from' in event and 'to' in event:
            coords.extend([event['from'], event['to']])
        else:
            coords.append((citizen.x, citizen.y))

        return DreamFragment(
            id=f"replay_{citizen.id}_{int(time.time() * 1000)}",
            source_citizen=citizen.id,
            pattern_type='replay',
            coordinates=coords,
            intensity=citizen.energy * 0.5
        )

    def _create_synthesis_fragment(self, citizen) -> Optional[DreamFragment]:
        """Create a dream fragment that synthesizes new patterns."""
        # Combine citizen position with random nearby point
        angle = random.uniform(0, 2 * math.pi)
        dist = random.randint(10, 50)
        other_x = int(citizen.x + dist * math.cos(angle))
        other_y = int(citizen.y + dist * math.sin(angle))

        return DreamFragment(
            id=f"synthesis_{citizen.id}_{int(time.time() * 1000)}",
            source_citizen=citizen.id,
            pattern_type='synthesis',
            coordinates=[(citizen.x, citizen.y), (other_x, other_y)],
            intensity=citizen.energy * 0.7
        )

    def _detect_nightmares(self) -> List[Dict]:
        """Detect nightmare patterns (high entropy, low activation areas)."""
        nightmares = []

        # Check citizen territories for nightmare indicators
        for citizen in self.city.spawner.citizens.values():
            if citizen.entropy > 0.7 and citizen.energy < 0.3:
                nightmares.append({
                    'type': 'citizen_nightmare',
                    'citizen_id': citizen.id,
                    'location': (citizen.x, citizen.y),
                    'entropy': citizen.entropy,
                    'energy': citizen.energy
                })

        return nightmares

    def _heal_nightmare(self, nightmare: Dict):
        """Heal a nightmare pattern."""
        x, y = nightmare['location']

        # Write healing pattern - reduce entropy, boost activation
        for dy in range(-5, 6):
            for dx in range(-5, 6):
                dist = math.sqrt(dx * dx + dy * dy)
                if dist <= 5:
                    px, py = x + dx, y + dy
                    healing = 0.3 * (1 - dist / 5)
                    self.writer.write_pixel(px, py, healing, 0.1, None)

    def get_dream_report(self) -> Dict:
        """Get a report of recent dreaming activity."""
        return {
            'current_state': self.state.value,
            'activity_level': self.calculate_activity_level(),
            'current_session': {
                'duration': time.time() - self.current_session.start_time
                           if self.current_session else 0,
                'fragments': len(self.current_session.fragments)
                            if self.current_session else 0,
                'consolidations': self.current_session.consolidations
                                 if self.current_session else 0,
                'nightmares_healed': self.current_session.nightmares_healed
                                    if self.current_session else 0
            },
            'recent_fragments': len(self.dream_fragments),
            'recurring_patterns': dict(list(self.recurring_patterns.items())[:5]),
            'stats': self.stats,
            'history_count': len(self.dream_history)
        }

    def force_dream(self, state: DreamState = DreamState.REM):
        """Force the city into a specific dream state."""
        self.state = state
        if not self.current_session:
            self.current_session = DreamSession(
                start_time=time.time(),
                state=state
            )
            self.stats['total_dreams'] += 1

    def wake(self):
        """Wake the city from dreaming."""
        if self.current_session:
            self._end_dream_session()
        self.state = DreamState.AWAKE
