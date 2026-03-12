"""
Optimized City Tick - Performance Tuning for 1000+ Citizens

Provides batch processing, spatial indexing, and object pooling
for high-performance city simulation.
"""

import time
import random
import math
from typing import Dict, List, Tuple, Set, Any
from dataclasses import dataclass, field

from .spatial_index import SpatialIndex, OptimizedNeighborFinder
from .citizen import NeuralCitizen, CitizenState, GuildType


@dataclass
class TickMetrics:
    """Performance metrics for a tick."""
    total_time_ms: float = 0.0
    neighbor_time_ms: float = 0.0
    trade_time_ms: float = 0.0
    move_time_ms: float = 0.0
    reproduce_time_ms: float = 0.0
    write_time_ms: float = 0.0
    dream_time_ms: float = 0.0
    language_time_ms: float = 0.0
    consciousness_time_ms: float = 0.0

    citizens_processed: int = 0
    trades_executed: int = 0
    movements: int = 0
    births: int = 0
    deaths: int = 0
    writes: int = 0


class OptimizedCityTicker:
    """
    High-performance city tick processor.

    Optimizations:
    1. Spatial indexing for O(n) neighbor queries instead of O(n²)
    2. Batch processing by citizen state
    3. Object pooling for temporary collections
    4. Lazy evaluation where possible
    """

    def __init__(self, city):
        """
        Initialize optimized ticker.

        Args:
            city: NeuralCity instance
        """
        self.city = city
        self.neighbor_finder = OptimizedNeighborFinder(
            city.width, city.height, cell_size=64
        )

        # Object pools for reuse
        self._temp_list: List = []
        self._temp_set: Set = set()
        self._temp_dict: Dict = {}

        # Metrics
        self.metrics = TickMetrics()
        self.metrics_history: List[TickMetrics] = []
        self.max_history = 100

        # Batch sizes for processing
        self.batch_size = 100  # Citizens per batch

    def tick(self) -> Dict[str, Any]:
        """
        Execute optimized tick.

        Returns:
            Tick result with events and metrics
        """
        start_time = time.perf_counter()
        self.metrics = TickMetrics()

        events = {
            'trades': [],
            'movements': [],
            'births': [],
            'deaths': [],
            'writes': [],
            'dreams': {},
            'language': {},
            'consciousness': {}
        }

        citizens = self.city.spawner.citizens
        self.metrics.citizens_processed = len(citizens)

        if not citizens:
            return self._build_result(events, start_time)

        # Phase 1: Rebuild spatial index
        t0 = time.perf_counter()
        self.neighbor_finder.rebuild(citizens)
        self.metrics.neighbor_time_ms = (time.perf_counter() - t0) * 1000

        # Phase 2: Batch process by state
        active_citizens = [c for c in citizens.values()
                         if c.state in (CitizenState.ACTIVE, CitizenState.TRADING)]

        # Process in batches
        for i in range(0, len(active_citizens), self.batch_size):
            batch = active_citizens[i:i + self.batch_size]

            # Trading
            t1 = time.perf_counter()
            trades = self._process_trades_batch(batch)
            events['trades'].extend(trades)
            self.metrics.trades_executed = len(trades)
            self.metrics.trade_time_ms += (time.perf_counter() - t1) * 1000

            # Movement
            t2 = time.perf_counter()
            movements = self._process_movement_batch(batch)
            events['movements'].extend(movements)
            self.metrics.movements = len(movements)
            self.metrics.move_time_ms += (time.perf_counter() - t2) * 1000

        # Phase 3: Reproduction (requires fresh index after moves)
        t3 = time.perf_counter()
        self.neighbor_finder.rebuild(citizens)
        reproducing = [c for c in citizens.values()
                      if c.state == CitizenState.REPRODUCING]
        births = self._process_reproduction_batch(reproducing)
        events['births'] = births
        self.metrics.births = len(births)
        self.metrics.reproduce_time_ms = (time.perf_counter() - t3) * 1000

        # Phase 4: Evolution (deaths)
        t4 = time.perf_counter()
        deaths = self._process_evolution_batch(list(citizens.values()))
        events['deaths'] = deaths
        self.metrics.deaths = len(deaths)
        self.metrics.reproduce_time_ms += (time.perf_counter() - t4) * 1000

        # Phase 5: Citizen writes
        t5 = time.perf_counter()
        writes = self._process_writes_batch(active_citizens[:20])  # Limit writes per tick
        events['writes'] = writes
        self.metrics.writes = len(writes)
        self.metrics.write_time_ms = (time.perf_counter() - t5) * 1000

        # Phase 6: Dream engine
        t6 = time.perf_counter()
        if self.city.dream_engine:
            events['dreams'] = self.city.dream_engine.tick()
        self.metrics.dream_time_ms = (time.perf_counter() - t6) * 1000

        # Phase 7: Language
        t7 = time.perf_counter()
        if self.city.language:
            events['language'] = self.city.language.tick()
        self.metrics.language_time_ms = (time.perf_counter() - t7) * 1000

        # Phase 8: Consciousness
        t8 = time.perf_counter()
        if self.city.consciousness:
            events['consciousness'] = self.city.consciousness.tick()
        self.metrics.consciousness_time_ms = (time.perf_counter() - t8) * 1000

        # Rebuild index after all changes
        self.neighbor_finder.rebuild(self.city.spawner.citizens)

        # Update neighbors for all citizens
        self._update_neighbors_optimized()

        # Update city stats
        self.city._update_stats()

        # Record metrics
        self.metrics.total_time_ms = (time.perf_counter() - start_time) * 1000
        self.metrics_history.append(self.metrics)
        if len(self.metrics_history) > self.max_history:
            self.metrics_history = self.metrics_history[-self.max_history:]

        return self._build_result(events, start_time)

    def _process_trades_batch(self, citizens: List[NeuralCitizen]) -> List[Dict]:
        """Process trades for a batch of citizens."""
        trades = []

        for citizen in citizens:
            if citizen.state == CitizenState.DEAD:
                continue

            # Use spatial index for neighbor lookup
            neighbors = self.neighbor_finder.find_neighbors(
                citizen.id, citizen.x, citizen.y, radius=64
            )

            for neighbor_id in neighbors[:3]:  # Limit checks per citizen
                neighbor = self.city.spawner.citizens.get(neighbor_id)
                if not neighbor or neighbor.state == CitizenState.DEAD:
                    continue

                if not citizen.can_trade_with(neighbor):
                    continue

                # Calculate trade
                diff = citizen.energy - neighbor.energy
                if abs(diff) > 0.1:
                    amount = abs(diff) * 0.1
                    if diff > 0:
                        success = citizen.trade_energy(neighbor, amount)
                    else:
                        success = neighbor.trade_energy(citizen, amount)

                    if success:
                        trades.append({
                            'from': citizen.id if diff > 0 else neighbor_id,
                            'to': neighbor_id if diff > 0 else citizen.id,
                            'amount': amount
                        })
                        break  # One trade per citizen per tick

        return trades

    def _process_movement_batch(self, citizens: List[NeuralCitizen]) -> List[Dict]:
        """Process movement for a batch of citizens."""
        movements = []

        for citizen in citizens:
            if citizen.state not in (CitizenState.ACTIVE, CitizenState.MIGRATING):
                continue

            old_x, old_y = citizen.x, citizen.y
            new_pos = citizen.move(0.1, (self.city.width, self.city.height))

            if new_pos != (old_x, old_y):
                # Update territory
                self.city.territory_mapper.update_territory(
                    citizen.id, citizen.x, citizen.y, citizen.territory_radius
                )
                movements.append({
                    'id': citizen.id,
                    'from': (old_x, old_y),
                    'to': new_pos
                })

        return movements

    def _process_reproduction_batch(self, citizens: List[NeuralCitizen]) -> List[Dict]:
        """Process reproduction for eligible citizens."""
        births = []
        random.shuffle(citizens)

        processed = set()

        for citizen in citizens:
            if citizen.id in processed:
                continue
            if not citizen.can_reproduce():
                continue

            # Find partner using spatial index
            partner = None
            neighbors = self.neighbor_finder.find_neighbors(
                citizen.id, citizen.x, citizen.y, radius=64
            )

            for neighbor_id in neighbors:
                neighbor = self.city.spawner.citizens.get(neighbor_id)
                if neighbor and neighbor.can_reproduce() and neighbor_id not in processed:
                    partner = neighbor
                    break

            child = citizen.reproduce(partner)
            if child:
                self.city.spawner.citizens[child.id] = child
                self.city.territory_mapper.register_territory(
                    child.id, child.x, child.y, child.territory_radius
                )

                births.append({
                    'parent': citizen.id,
                    'partner': partner.id if partner else None,
                    'child': child.id,
                    'generation': child.generation
                })

                processed.add(citizen.id)
                if partner:
                    processed.add(partner.id)

        return births

    def _process_evolution_batch(self, citizens: List[NeuralCitizen]) -> List[str]:
        """Process evolution (deaths) for citizens."""
        deaths = []

        for citizen in citizens:
            if citizen.state == CitizenState.DEAD or citizen.energy < 0.01:
                self.city.territory_mapper.remove_territory(citizen.id)
                if citizen.id in self.city.spawner.citizens:
                    del self.city.spawner.citizens[citizen.id]
                deaths.append(citizen.id)
                if hasattr(self.city.stats, 'total_died'):
                    self.city.stats.total_died += 1

        return deaths

    def _process_writes_batch(self, citizens: List[NeuralCitizen]) -> List[Dict]:
        """Process citizen writes (Phase 47)."""
        writes = []

        if not self.city.writer:
            return writes

        for citizen in citizens:
            if citizen.state != CitizenState.ACTIVE:
                continue
            if citizen.energy < 0.7:
                continue
            if random.random() > 0.05:  # 5% chance per tick
                continue

            guild = citizen.guild.value

            try:
                if guild == 'attention':
                    self.city.writer.write_activation_boost(
                        citizen.x, citizen.y, radius=8, boost=0.2,
                        current_r=citizen.energy, current_g=citizen.entropy
                    )
                    writes.append({'citizen': citizen.id, 'type': 'boost'})

                elif guild == 'logic':
                    neighbors = self.neighbor_finder.find_neighbors(
                        citizen.id, citizen.x, citizen.y, radius=64
                    )
                    if neighbors:
                        target_id = random.choice(neighbors)
                        target = self.city.spawner.citizens.get(target_id)
                        if target:
                            self.city.writer.write_neural_pathway(
                                citizen.x, citizen.y, target.x, target.y, citizen.opcode
                            )
                            writes.append({'citizen': citizen.id, 'type': 'pathway'})

                elif guild == 'intent':
                    self.city.writer.write_guild_territory(
                        citizen.x, citizen.y, radius=12, guild=guild
                    )
                    writes.append({'citizen': citizen.id, 'type': 'territory'})
            except Exception:
                pass  # Ignore write errors

        return writes

    def _update_neighbors_optimized(self):
        """Update neighbor relationships using spatial index."""
        citizens = self.city.spawner.citizens

        # Clear old neighbors
        for citizen in citizens.values():
            citizen.neighbors = set()

        # Use spatial index to find all neighbor pairs
        pairs = self.neighbor_finder.get_nearby_pairs(radius=64)

        for id1, id2, _ in pairs:
            if id1 in citizens:
                citizens[id1].neighbors.add(id2)
            if id2 in citizens:
                citizens[id2].neighbors.add(id1)

    def _build_result(self, events: Dict, start_time: float) -> Dict:
        """Build the tick result dictionary."""
        return {
            'tick': self.city.tick_count,
            'elapsed_ms': (time.perf_counter() - start_time) * 1000,
            'events': events,
            'stats': {
                'population': self.city.stats.population,
                'active': self.city.stats.active_citizens,
                'energy': self.city.stats.total_energy
            },
            'metrics': {
                'total_ms': self.metrics.total_time_ms,
                'citizens': self.metrics.citizens_processed,
                'trades': self.metrics.trades_executed,
                'movements': self.metrics.movements,
                'births': self.metrics.births,
                'deaths': self.metrics.deaths
            }
        }

    def get_performance_report(self) -> Dict:
        """Get detailed performance report."""
        if not self.metrics_history:
            return {'error': 'No ticks recorded'}

        recent = self.metrics_history[-20:]

        return {
            'avg_total_ms': sum(m.total_time_ms for m in recent) / len(recent),
            'avg_neighbor_ms': sum(m.neighbor_time_ms for m in recent) / len(recent),
            'avg_trade_ms': sum(m.trade_time_ms for m in recent) / len(recent),
            'avg_move_ms': sum(m.move_time_ms for m in recent) / len(recent),
            'avg_reproduce_ms': sum(m.reproduce_time_ms for m in recent) / len(recent),
            'avg_citizens': sum(m.citizens_processed for m in recent) / len(recent),
            'avg_fps': 1000 / (sum(m.total_time_ms for m in recent) / len(recent)),
            'ticks_recorded': len(self.metrics_history),
            'spatial_index': self.neighbor_finder.index.get_stats()
        }
