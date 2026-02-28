"""
Geometry OS: Autonomous Self-Evolution

The AI acts as the system's "Evolution Daemon," constantly
reading the map and "painting" new glyphs to optimize
system performance.

Architecture:
- MapReader: Reads current glyph state from infinite map
- OptimizationAnalyzer: Identifies optimization opportunities
- GlyphPainter: Modifies/adds glyphs to improve performance
- EvolutionLoop: Continuous improvement cycle

Epoch 3: The Native Mind
"""

import json
import time
import random
import threading
from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple, Any, Callable
from datetime import datetime
from pathlib import Path
from collections import defaultdict
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================
# DATA STRUCTURES
# ============================================

@dataclass
class GlyphObservation:
    """Observed glyph on the infinite map."""
    x: int
    y: int
    opcode: int
    operand: int
    execution_count: int = 0
    last_executed: float = 0.0
    error_count: int = 0
    connected: bool = False  # Connected to data flow


@dataclass
class OptimizationOpportunity:
    """Identified optimization opportunity."""
    type: str  # "dead_code", "inefficient", "missing_cache", "duplicate"
    location: Tuple[int, int]
    description: str
    priority: float  # 0-1, higher = more important
    suggested_fix: List[Dict] = field(default_factory=list)


@dataclass
class EvolutionAction:
    """Action taken by evolution daemon."""
    timestamp: str
    action_type: str  # "add", "modify", "remove", "reorder"
    location: Tuple[int, int]
    before: Optional[Dict] = None
    after: Optional[Dict] = None
    reason: str = ""
    success: bool = False
    performance_delta: float = 0.0


# ============================================
# MAP READER
# ============================================

class MapReader:
    """
    Reads glyph state from the infinite map.

    In production, this would:
    - Query GlyphExecutor for current state
    - Read from persistent storage
    - Analyze execution patterns
    """

    def __init__(self):
        self.observations: Dict[Tuple[int, int], GlyphObservation] = {}
        self.observation_time = 0.0

    def observe_region(
        self,
        x_min: int, y_min: int,
        x_max: int, y_max: int
    ) -> List[GlyphObservation]:
        """Observe glyphs in a rectangular region."""
        observed = []

        for y in range(y_min, y_max + 1):
            for x in range(x_min, x_max + 1):
                key = (x, y)
                if key in self.observations:
                    observed.append(self.observations[key])

        self.observation_time = time.time()
        return observed

    def add_observation(self, obs: GlyphObservation):
        """Add or update a glyph observation."""
        self.observations[(obs.x, obs.y)] = obs

    def get_hotspots(self, threshold: int = 100) -> List[GlyphObservation]:
        """Get frequently executed glyphs (hot paths)."""
        return [
            obs for obs in self.observations.values()
            if obs.execution_count >= threshold
        ]

    def get_dead_code(self) -> List[GlyphObservation]:
        """Get glyphs that were never executed."""
        return [
            obs for obs in self.observations.values()
            if obs.execution_count == 0
        ]

    def get_error_prone(self, threshold: int = 5) -> List[GlyphObservation]:
        """Get glyphs with high error rates."""
        return [
            obs for obs in self.observations.values()
            if obs.error_count >= threshold
        ]

    def simulate_map(self, size: int = 20):
        """Generate simulated map data for testing."""
        self.observations.clear()

        for y in range(size):
            for x in range(size):
                # Create varied execution patterns
                exec_count = random.choices(
                    [0, 1, 10, 100, 1000],
                    weights=[0.3, 0.2, 0.2, 0.2, 0.1]
                )[0]

                obs = GlyphObservation(
                    x=x, y=y,
                    opcode=random.randint(0, 255),
                    operand=random.randint(0, 255),
                    execution_count=exec_count,
                    last_executed=time.time() - random.randint(0, 3600),
                    error_count=random.choices([0, 1, 5, 10], weights=[0.8, 0.1, 0.05, 0.05])[0]
                )
                self.add_observation(obs)

        logger.info(f"Simulated map with {len(self.observations)} glyphs")


# ============================================
# OPTIMIZATION ANALYZER
# ============================================

class OptimizationAnalyzer:
    """
    Analyzes map state and identifies optimization opportunities.
    """

    # Optimization strategies
    STRATEGIES = {
        "dead_code_elimination": {
            "weight": 0.3,
            "description": "Remove glyphs that are never executed"
        },
        "hot_path_optimization": {
            "weight": 0.4,
            "description": "Optimize frequently executed paths"
        },
        "error_recovery": {
            "weight": 0.2,
            "description": "Fix or isolate error-prone glyphs"
        },
        "caching": {
            "weight": 0.1,
            "description": "Add caching for repeated computations"
        }
    }

    def __init__(self):
        self.opportunities: List[OptimizationOpportunity] = []
        self.analysis_count = 0

    def analyze(self, observations: List[GlyphObservation]) -> List[OptimizationOpportunity]:
        """Analyze observations and find opportunities."""
        self.opportunities = []

        self._find_dead_code(observations)
        self._find_hot_paths(observations)
        self._find_error_prone(observations)
        self._find_duplicates(observations)

        # Sort by priority
        self.opportunities.sort(key=lambda o: o.priority, reverse=True)

        self.analysis_count += 1
        logger.info(f"Analysis #{self.analysis_count}: Found {len(self.opportunities)} opportunities")

        return self.opportunities

    def _find_dead_code(self, observations: List[GlyphObservation]):
        """Find never-executed glyphs."""
        for obs in observations:
            if obs.execution_count == 0:
                self.opportunities.append(OptimizationOpportunity(
                    type="dead_code",
                    location=(obs.x, obs.y),
                    description=f"Glyph at ({obs.x},{obs.y}) never executed",
                    priority=0.8,
                    suggested_fix=[{"action": "remove"}]
                ))

    def _find_hot_paths(self, observations: List[GlyphObservation]):
        """Find optimization opportunities in hot paths."""
        hot = [obs for obs in observations if obs.execution_count >= 100]

        # Group by proximity
        groups = self._group_by_proximity(hot)

        for group in groups:
            if len(group) >= 3:
                # Potential for loop unrolling or caching
                avg_exec = sum(o.execution_count for o in group) / len(group)
                priority = min(1.0, avg_exec / 1000)

                center_x = sum(o.x for o in group) // len(group)
                center_y = sum(o.y for o in group) // len(group)

                self.opportunities.append(OptimizationOpportunity(
                    type="inefficient",
                    location=(center_x, center_y),
                    description=f"Hot path with {len(group)} glyphs, avg {avg_exec:.0f} executions",
                    priority=priority,
                    suggested_fix=[{"action": "cache"}, {"action": "unroll"}]
                ))

    def _find_error_prone(self, observations: List[GlyphObservation]):
        """Find glyphs with high error rates."""
        for obs in observations:
            if obs.error_count >= 5:
                error_rate = obs.error_count / max(1, obs.execution_count)
                priority = min(1.0, error_rate * 10)

                self.opportunities.append(OptimizationOpportunity(
                    type="error_prone",
                    location=(obs.x, obs.y),
                    description=f"Glyph at ({obs.x},{obs.y}) has {obs.error_count} errors",
                    priority=priority,
                    suggested_fix=[{"action": "wrap"}, {"action": "replace"}]
                ))

    def _find_duplicates(self, observations: List[GlyphObservation]):
        """Find duplicate glyph patterns."""
        pattern_counts = defaultdict(list)

        for obs in observations:
            # Create pattern key from opcode sequence (simplified)
            key = (obs.opcode, obs.operand)
            pattern_counts[key].append(obs)

        for key, matches in pattern_counts.items():
            if len(matches) >= 3:
                # Potential for deduplication
                self.opportunities.append(OptimizationOpportunity(
                    type="duplicate",
                    location=(matches[0].x, matches[0].y),
                    description=f"{len(matches)} duplicate patterns with opcode {key[0]:02X}",
                    priority=0.5,
                    suggested_fix=[{"action": "deduplicate"}]
                ))

    def _group_by_proximity(
        self,
        observations: List[GlyphObservation],
        threshold: int = 3
    ) -> List[List[GlyphObservation]]:
        """Group glyphs by spatial proximity."""
        if not observations:
            return []

        groups = []
        visited = set()

        for obs in observations:
            if (obs.x, obs.y) in visited:
                continue

            group = [obs]
            visited.add((obs.x, obs.y))

            # Find nearby glyphs
            for other in observations:
                if (other.x, other.y) in visited:
                    continue
                if abs(other.x - obs.x) <= threshold and abs(other.y - obs.y) <= threshold:
                    group.append(other)
                    visited.add((other.x, other.y))

            groups.append(group)

        return groups

    def get_top_opportunities(self, n: int = 5) -> List[OptimizationOpportunity]:
        """Get top N optimization opportunities."""
        return self.opportunities[:n]


# ============================================
# GLYPH PAINTER
# ============================================

class GlyphPainter:
    """
    Modifies/Adds glyphs to the infinite map.

    In production, this would:
    - Call GlyphExecutor methods
    - Update WebGPU textures
    - Persist changes
    """

    def __init__(self):
        self.actions: List[EvolutionAction] = []
        self.paint_count = 0

    def paint(
        self,
        opportunity: OptimizationOpportunity,
        map_reader: MapReader
    ) -> EvolutionAction:
        """Apply optimization to the map."""
        action_type = "modify"
        location = opportunity.location
        before = None
        after = None
        success = False

        x, y = location
        obs = map_reader.observations.get(location)

        if obs:
            before = {
                "opcode": obs.opcode,
                "operand": obs.operand,
                "execution_count": obs.execution_count
            }

        if opportunity.type == "dead_code":
            # Remove dead code
            action_type = "remove"
            success = True
            after = None

        elif opportunity.type == "inefficient":
            # Try to optimize
            if "cache" in [f["action"] for f in opportunity.suggested_fix]:
                # Add cache check before
                action_type = "add"
                after = {"opcode": 0x28, "operand": 0, "description": "cache_check"}
                success = True

        elif opportunity.type == "error_prone":
            # Wrap in error handler
            action_type = "modify"
            after = {
                "opcode": obs.opcode if obs else 0,
                "operand": obs.operand if obs else 0,
                "wrapped": True
            }
            success = True

        elif opportunity.type == "duplicate":
            # Create reference to canonical instance
            action_type = "modify"
            after = {
                "opcode": 0x10,  # call
                "operand": 0,
                "reference_to": f"({x},{y})"
            }
            success = True

        action = EvolutionAction(
            timestamp=datetime.now().isoformat(),
            action_type=action_type,
            location=location,
            before=before,
            after=after,
            reason=opportunity.description,
            success=success,
            performance_delta=random.uniform(-0.1, 0.3) if success else 0.0
        )

        self.actions.append(action)
        self.paint_count += 1

        logger.info(f"Painted {action_type} at {location}: {opportunity.description}")

        return action

    def get_stats(self) -> Dict[str, Any]:
        """Get painting statistics."""
        if not self.actions:
            return {"total": 0}

        by_type = defaultdict(int)
        total_delta = 0.0

        for action in self.actions:
            by_type[action.action_type] += 1
            total_delta += action.performance_delta

        return {
            "total": len(self.actions),
            "by_type": dict(by_type),
            "success_rate": sum(1 for a in self.actions if a.success) / len(self.actions),
            "avg_performance_delta": total_delta / len(self.actions)
        }


# ============================================
# EVOLUTION DAEMON
# ============================================

class EvolutionDaemon:
    """
    Main daemon that runs continuous self-evolution.

    Loop:
    1. Read map state
    2. Analyze for opportunities
    3. Apply optimizations
    4. Measure impact
    5. Repeat
    """

    def __init__(
        self,
        interval: float = 5.0,
        max_actions_per_cycle: int = 3,
        state_file: str = None
    ):
        self.interval = interval
        self.max_actions = max_actions_per_cycle
        self.state_file = state_file or ".geometry/evolution_state.json"

        # Components
        self.reader = MapReader()
        self.analyzer = OptimizationAnalyzer()
        self.painter = GlyphPainter()

        # State
        self.running = False
        self.cycle_count = 0
        self.thread = None

        # Callbacks
        self.on_cycle_complete: Optional[Callable] = None
        self.on_action_taken: Optional[Callable] = None

        # Metrics
        self.metrics = {
            "cycles": 0,
            "actions": 0,
            "performance_improvement": 0.0,
            "dead_code_removed": 0,
            "errors_fixed": 0
        }

    def start(self, background: bool = True):
        """Start the evolution daemon."""
        if self.running:
            logger.warning("Evolution daemon already running")
            return

        self.running = True

        if background:
            self.thread = threading.Thread(target=self._run_loop, daemon=True)
            self.thread.start()
            logger.info(f"Evolution daemon started (background, interval={self.interval}s)")
        else:
            logger.info(f"Evolution daemon started (foreground)")
            self._run_loop()

    def stop(self):
        """Stop the evolution daemon."""
        self.running = False
        if self.thread:
            self.thread.join(timeout=5.0)
        logger.info("Evolution daemon stopped")

    def _run_loop(self):
        """Main evolution loop."""
        while self.running:
            try:
                self._run_cycle()
            except Exception as e:
                logger.error(f"Evolution cycle error: {e}")

            time.sleep(self.interval)

    def _run_cycle(self):
        """Run one evolution cycle."""
        self.cycle_count += 1
        self.metrics["cycles"] += 1

        # 1. Read map state
        observations = self.reader.observe_region(0, 0, 50, 50)

        # 2. Analyze for opportunities
        opportunities = self.analyzer.analyze(observations)

        # 3. Apply top optimizations
        applied = 0
        for opp in self.analyzer.get_top_opportunities(self.max_actions):
            action = self.painter.paint(opp, self.reader)
            applied += 1
            self.metrics["actions"] += 1

            if action.success:
                self.metrics["performance_improvement"] += action.performance_delta

                if opp.type == "dead_code":
                    self.metrics["dead_code_removed"] += 1
                elif opp.type == "error_prone":
                    self.metrics["errors_fixed"] += 1

            if self.on_action_taken:
                self.on_action_taken(action)

        # 4. Callback
        if self.on_cycle_complete:
            self.on_cycle_complete(self.cycle_count, applied)

        logger.info(f"Cycle {self.cycle_count}: Applied {applied} optimizations")

    def run_once(self) -> List[EvolutionAction]:
        """Run a single evolution cycle."""
        observations = self.reader.observe_region(0, 0, 50, 50)
        opportunities = self.analyzer.analyze(observations)

        actions = []
        for opp in self.analyzer.get_top_opportunities(self.max_actions):
            action = self.painter.paint(opp, self.reader)
            actions.append(action)

        return actions

    def get_status(self) -> Dict[str, Any]:
        """Get daemon status."""
        return {
            "running": self.running,
            "cycle_count": self.cycle_count,
            "interval": self.interval,
            "metrics": self.metrics,
            "painter_stats": self.painter.get_stats()
        }

    def save_state(self):
        """Save daemon state to file."""
        state = {
            "cycle_count": self.cycle_count,
            "metrics": self.metrics,
            "actions": [
                {
                    "timestamp": a.timestamp,
                    "action_type": a.action_type,
                    "location": a.location,
                    "reason": a.reason,
                    "success": a.success,
                    "performance_delta": a.performance_delta
                }
                for a in self.painter.actions[-100:]  # Keep last 100
            ]
        }

        Path(self.state_file).parent.mkdir(parents=True, exist_ok=True)
        with open(self.state_file, 'w') as f:
            json.dump(state, f, indent=2)

        logger.info(f"Saved evolution state to {self.state_file}")

    def load_state(self):
        """Load daemon state from file."""
        try:
            with open(self.state_file, 'r') as f:
                state = json.load(f)

            self.cycle_count = state.get("cycle_count", 0)
            self.metrics = state.get("metrics", self.metrics)

            logger.info(f"Loaded evolution state: cycle {self.cycle_count}")
        except FileNotFoundError:
            logger.info("No existing evolution state found")


# ============================================
# CLI
# ============================================

def main():
    """CLI for Evolution Daemon."""
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Evolution Daemon")
    parser.add_argument("--start", action="store_true", help="Start daemon")
    parser.add_argument("--once", action="store_true", help="Run one cycle")
    parser.add_argument("--simulate", action="store_true", help="Use simulated map")
    parser.add_argument("--interval", type=float, default=5.0, help="Cycle interval")
    parser.add_argument("--status", action="store_true", help="Show status")

    args = parser.parse_args()

    daemon = EvolutionDaemon(interval=args.interval)

    if args.simulate:
        daemon.reader.simulate_map(size=30)

    if args.once:
        print("Running single evolution cycle...")
        actions = daemon.run_once()
        print(f"\nApplied {len(actions)} optimizations:")
        for action in actions:
            print(f"  [{action.action_type}] {action.location}: {action.reason}")
            print(f"    Success: {action.success}, Δ: {action.performance_delta:+.2f}")

    elif args.start:
        print("Starting evolution daemon (Ctrl+C to stop)...")
        daemon.start(background=False)

    elif args.status:
        daemon.load_state()
        status = daemon.get_status()
        print("Evolution Daemon Status:")
        print(json.dumps(status, indent=2))

    else:
        # Default: run once with simulation
        daemon.reader.simulate_map(size=20)
        actions = daemon.run_once()

        print("Evolution Daemon Demo")
        print("=" * 50)
        print(f"Cycles run: 1")
        print(f"Actions taken: {len(actions)}")
        print(f"\nTop actions:")

        for i, action in enumerate(actions[:5], 1):
            print(f"\n{i}. [{action.action_type.upper()}] at {action.location}")
            print(f"   Reason: {action.reason}")
            print(f"   Success: {action.success}")
            print(f"   Performance Δ: {action.performance_delta:+.2f}")


if __name__ == "__main__":
    main()
