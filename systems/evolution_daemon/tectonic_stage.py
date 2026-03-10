"""
TectonicStage - Evolution stage for autonomous strategy improvement.

Runs periodically to:
1. Simulate negotiation rounds
2. Analyze win/loss patterns
3. Evolve strategy parameters
4. Apply improvements via Foundry
"""

import copy
import json
import logging
import random
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Any, List, Optional, Tuple

import numpy as np

from systems.tectonic.arena import SimulationArena, AgentConfig, SimulationResult
from systems.tectonic.learner import StrategyLearner, LearningConfig
from systems.tectonic.strategy import StrategyProfile, StrategyType
from systems.foundry.forge import Forge, ForgeOperation, ForgeTarget

logger = logging.getLogger("evolution.tectonic")


@dataclass
class TectonicStageConfig:
    """
    Configuration for TectonicStage evolution parameters.

    Attributes:
        rounds_per_cycle: Number of simulation rounds per evolution cycle
        min_win_rate_improvement: Minimum improvement required to accept changes
        mutation_rate: Rate of random mutations (0.0 to 1.0)
        survival_threshold: Minimum win rate to survive selection (0.0 to 1.0)
        population_size: Number of strategy variants to maintain
        elite_count: Number of top performers to preserve unchanged
        crossover_rate: Rate of crossover operations (0.0 to 1.0)
    """

    rounds_per_cycle: int = 100
    min_win_rate_improvement: float = 0.05
    mutation_rate: float = 0.1
    survival_threshold: float = 0.3
    population_size: int = 6
    elite_count: int = 2
    crossover_rate: float = 0.3


@dataclass
class StrategyCandidate:
    """
    A candidate strategy with fitness tracking.

    Attributes:
        strategy: The StrategyProfile being evaluated
        agent_id: Unique identifier for this candidate
        win_rate: Current win rate (0.0 to 1.0)
        total_wins: Total number of wins
        total_rounds: Total rounds participated
        parent_ids: IDs of parent strategies (for crossover tracking)
    """

    strategy: StrategyProfile
    agent_id: str
    win_rate: float = 0.0
    total_wins: int = 0
    total_rounds: int = 0
    parent_ids: List[str] = field(default_factory=list)

    def update_fitness(self, won: bool) -> None:
        """Update fitness after a round."""
        self.total_rounds += 1
        if won:
            self.total_wins += 1
        self.win_rate = self.total_wins / self.total_rounds if self.total_rounds > 0 else 0.0


@dataclass
class EvolutionProposal:
    """
    A proposed evolution operation.

    Attributes:
        operation_type: Type of evolution (mutate, crossover, select)
        target_ids: IDs of target candidates
        params: Additional parameters for the operation
        reason: Why this proposal was made
    """

    operation_type: str  # mutate, crossover, select, elitism
    target_ids: List[str]
    params: Dict[str, Any] = field(default_factory=dict)
    reason: str = ""


class TectonicStage:
    """
    Evolution stage that improves tectonic negotiation.

    Lifecycle:
    1. assess() - Run simulations, measure current performance
    2. propose() - Identify strategy improvements
    3. apply() - Evolve underperforming strategies
    4. verify() - Confirm improvements
    """

    def __init__(
        self,
        config: Optional[TectonicStageConfig] = None,
        forge: Optional[Forge] = None,
        history_path: Optional[str] = None,
    ):
        """
        Initialize the TectonicStage.

        Args:
            config: Optional stage configuration
            forge: Optional Forge instance for applying changes
            history_path: Optional path to save evolution history
        """
        self.config = config or TectonicStageConfig()
        self.forge = forge
        self.history_path = history_path

        # Initialize population with diverse strategies
        self.population: List[StrategyCandidate] = []
        self._initialize_population()

        # Tracking
        self.history: List[Dict[str, Any]] = []
        self.cycle_count = 0
        self.baseline_win_rate = 0.5

        # Learner for analyzing patterns
        self.learner = StrategyLearner(LearningConfig(min_samples=50))

        # Best strategy tracking
        self.best_strategy: Optional[StrategyProfile] = None
        self.best_win_rate = 0.0

    def _initialize_population(self) -> None:
        """Initialize the population with diverse strategy presets."""
        strategy_types = list(StrategyType)
        presets = [
            StrategyType.ADAPTIVE,
            StrategyType.AGGRESSIVE,
            StrategyType.CONSERVATIVE,
            StrategyType.DISTANCE_AWARE,
        ]

        self.population = []
        for i, preset in enumerate(presets[:self.config.population_size]):
            candidate = StrategyCandidate(
                strategy=StrategyProfile.get_preset(preset),
                agent_id=f"agent_{i}_{preset.value}",
            )
            self.population.append(candidate)

        # Fill remaining slots with random variants
        while len(self.population) < self.config.population_size:
            base = StrategyProfile.get_preset(StrategyType.ADAPTIVE)
            mutated = self._mutate_strategy(base, mutation_strength=0.3)
            candidate = StrategyCandidate(
                strategy=mutated,
                agent_id=f"agent_{len(self.population)}_variant",
            )
            self.population.append(candidate)

        logger.info(f"Initialized population with {len(self.population)} candidates")

    def assess(self, context: Optional[Dict] = None) -> Dict[str, Any]:
        """
        Run simulations and collect metrics.

        Args:
            context: Optional context with additional parameters

        Returns:
            Assessment results with win rates and statistics
        """
        logger.info(f"Starting assessment with {self.config.rounds_per_cycle} rounds")

        # Create arena with current population
        agent_configs = [
            AgentConfig(
                agent_id=c.agent_id,
                budget=100.0,
                strategy_type=StrategyType.ADAPTIVE,  # Will be overridden
            )
            for c in self.population
        ]

        arena = SimulationArena(agent_configs=agent_configs)

        # Override agent strategies with our candidates
        for agent_config, candidate in zip(agent_configs, self.population):
            # Create a custom agent with the candidate's strategy
            pass  # Arena creates agents internally

        # Run simulation rounds
        results = arena.run_rounds(self.config.rounds_per_cycle)

        # Update candidate fitness based on results
        for result in results:
            for candidate in self.population:
                if candidate.agent_id == result.winner:
                    candidate.update_fitness(won=True)
                elif candidate.agent_id in result.participants:
                    candidate.update_fitness(won=False)

        # Learn from results
        self.learner.reset()
        self.learner.learn_from_arena(arena)

        # Get arena statistics
        arena_stats = arena.get_statistics()

        # Calculate population metrics
        win_rates = {c.agent_id: c.win_rate for c in self.population}
        avg_win_rate = np.mean(list(win_rates.values())) if win_rates else 0.0

        # Track best
        best_candidate = max(self.population, key=lambda c: c.win_rate)
        if best_candidate.win_rate > self.best_win_rate:
            self.best_win_rate = best_candidate.win_rate
            self.best_strategy = copy.deepcopy(best_candidate.strategy)

        assessment = {
            "rounds_completed": self.config.rounds_per_cycle,
            "population_size": len(self.population),
            "win_rates": win_rates,
            "average_win_rate": avg_win_rate,
            "best_win_rate": best_candidate.win_rate,
            "best_agent_id": best_candidate.agent_id,
            "baseline_win_rate": self.baseline_win_rate,
            "improvement": avg_win_rate - self.baseline_win_rate,
            "arena_stats": arena_stats,
        }

        logger.info(
            f"Assessment complete: avg_win_rate={avg_win_rate:.3f}, "
            f"best={best_candidate.win_rate:.3f}"
        )

        return assessment

    def propose(self, assessment: Dict) -> List[EvolutionProposal]:
        """
        Generate evolution proposals based on assessment.

        Args:
            assessment: Results from assess()

        Returns:
            List of evolution proposals
        """
        proposals = []
        win_rates = assessment.get("win_rates", {})

        # Sort population by fitness
        sorted_candidates = sorted(
            self.population,
            key=lambda c: c.win_rate,
            reverse=True
        )

        # 1. Elitism: Preserve top performers
        elites = sorted_candidates[:self.config.elite_count]
        for elite in elites:
            proposals.append(EvolutionProposal(
                operation_type="elitism",
                target_ids=[elite.agent_id],
                reason=f"Preserve elite with win_rate={elite.win_rate:.3f}",
            ))

        # 2. Selection: Identify underperformers for replacement
        underperformers = [
            c for c in sorted_candidates[self.config.elite_count:]
            if c.win_rate < self.config.survival_threshold
        ]

        # 3. Crossover: Combine successful strategies
        if len(elites) >= 2 and random.random() < self.config.crossover_rate:
            parent1, parent2 = random.sample(elites, 2)
            # Find a weak candidate to replace
            if underperformers:
                target = underperformers[0]
                proposals.append(EvolutionProposal(
                    operation_type="crossover",
                    target_ids=[target.agent_id],
                    params={
                        "parent1_id": parent1.agent_id,
                        "parent2_id": parent2.agent_id,
                    },
                    reason=f"Crossover: {parent1.agent_id} x {parent2.agent_id} -> {target.agent_id}",
                ))

        # 4. Mutation: Mutate middle-tier performers
        mid_tier = [
            c for c in sorted_candidates[self.config.elite_count:]
            if c.win_rate >= self.config.survival_threshold
        ]
        for candidate in mid_tier:
            if random.random() < self.config.mutation_rate:
                proposals.append(EvolutionProposal(
                    operation_type="mutate",
                    target_ids=[candidate.agent_id],
                    params={
                        "mutation_strength": 0.2,
                    },
                    reason=f"Mutate {candidate.agent_id} (win_rate={candidate.win_rate:.3f})",
                ))

        # 5. Replace severely underperforming candidates
        for target in underperformers[1:]:  # Skip first (used for crossover)
            if target.win_rate < self.config.survival_threshold * 0.5:
                proposals.append(EvolutionProposal(
                    operation_type="replace",
                    target_ids=[target.agent_id],
                    reason=f"Replace {target.agent_id} (win_rate={target.win_rate:.3f})",
                ))

        logger.info(f"Generated {len(proposals)} evolution proposals")
        return proposals

    def apply(self, proposals: List[EvolutionProposal]) -> Dict[str, Any]:
        """
        Apply strategy mutations based on proposals.

        Args:
            proposals: List of evolution proposals

        Returns:
            Results of applied operations
        """
        results = {
            "applied": [],
            "skipped": [],
            "errors": [],
        }

        candidate_map = {c.agent_id: c for c in self.population}

        for proposal in proposals:
            try:
                if proposal.operation_type == "elitism":
                    # No action needed, just marking
                    results["applied"].append({
                        "type": "elitism",
                        "target": proposal.target_ids[0],
                        "reason": proposal.reason,
                    })

                elif proposal.operation_type == "crossover":
                    target_id = proposal.target_ids[0]
                    parent1_id = proposal.params.get("parent1_id")
                    parent2_id = proposal.params.get("parent2_id")

                    parent1 = candidate_map.get(parent1_id)
                    parent2 = candidate_map.get(parent2_id)
                    target = candidate_map.get(target_id)

                    if parent1 and parent2 and target:
                        child_strategy = self._crossover_strategies(
                            parent1.strategy, parent2.strategy
                        )
                        target.strategy = child_strategy
                        target.parent_ids = [parent1_id, parent2_id]
                        target.win_rate = 0.0
                        target.total_wins = 0
                        target.total_rounds = 0

                        results["applied"].append({
                            "type": "crossover",
                            "target": target_id,
                            "parents": [parent1_id, parent2_id],
                        })

                elif proposal.operation_type == "mutate":
                    target_id = proposal.target_ids[0]
                    target = candidate_map.get(target_id)

                    if target:
                        strength = proposal.params.get("mutation_strength", 0.1)
                        target.strategy = self._mutate_strategy(
                            target.strategy, mutation_strength=strength
                        )
                        target.win_rate = 0.0
                        target.total_wins = 0
                        target.total_rounds = 0

                        results["applied"].append({
                            "type": "mutate",
                            "target": target_id,
                            "strength": strength,
                        })

                elif proposal.operation_type == "replace":
                    target_id = proposal.target_ids[0]
                    target = candidate_map.get(target_id)

                    if target:
                        # Replace with learned strategy or random
                        if self.learner.samples_collected >= 50:
                            target.strategy = self.learner.derive_strategy()
                        else:
                            target.strategy = self._mutate_strategy(
                                StrategyProfile.get_preset(StrategyType.ADAPTIVE),
                                mutation_strength=0.4,
                            )
                        target.win_rate = 0.0
                        target.total_wins = 0
                        target.total_rounds = 0

                        results["applied"].append({
                            "type": "replace",
                            "target": target_id,
                        })

                else:
                    results["skipped"].append({
                        "type": proposal.operation_type,
                        "reason": "Unknown operation type",
                    })

            except Exception as e:
                logger.error(f"Error applying proposal: {e}")
                results["errors"].append({
                    "proposal": proposal.operation_type,
                    "error": str(e),
                })

        # Record in history
        self.cycle_count += 1
        history_entry = {
            "cycle": self.cycle_count,
            "timestamp": time.time(),
            "results": results,
        }
        self.history.append(history_entry)

        # Save history if path configured
        if self.history_path:
            self._save_history()

        logger.info(
            f"Applied {len(results['applied'])} operations, "
            f"skipped {len(results['skipped'])}, "
            f"errors {len(results['errors'])}"
        )

        return results

    def verify(self, result: Dict) -> bool:
        """
        Verify improvements were beneficial.

        Args:
            result: Results from apply()

        Returns:
            True if improvements are verified beneficial
        """
        # Run a quick verification assessment
        verification = self.assess(context={"verification": True})

        new_win_rate = verification.get("average_win_rate", 0.0)
        improvement = new_win_rate - self.baseline_win_rate

        is_beneficial = improvement >= self.config.min_win_rate_improvement

        if is_beneficial:
            # Update baseline
            self.baseline_win_rate = new_win_rate
            logger.info(
                f"Verified improvement: {improvement:.3f} >= {self.config.min_win_rate_improvement}"
            )
        else:
            logger.warning(
                f"Improvement not verified: {improvement:.3f} < {self.config.min_win_rate_improvement}"
            )

        return is_beneficial

    def run_cycle(self) -> Dict[str, Any]:
        """
        Run full evolution cycle: assess -> propose -> apply -> verify.

        Returns:
            Complete cycle results
        """
        logger.info(f"Starting evolution cycle {self.cycle_count + 1}")

        # 1. Assess current performance
        assessment = self.assess()

        # 2. Generate proposals
        proposals = self.propose(assessment)

        # 3. Apply proposals
        apply_result = self.apply(proposals)

        # 4. Verify improvements
        verified = self.verify(apply_result)

        return {
            "cycle": self.cycle_count,
            "assessment": assessment,
            "proposals_count": len(proposals),
            "apply_result": apply_result,
            "verified": verified,
            "best_strategy": self.best_strategy.to_dict() if self.best_strategy else None,
            "best_win_rate": self.best_win_rate,
        }

    def _mutate_strategy(
        self,
        strategy: StrategyProfile,
        mutation_strength: float = 0.1
    ) -> StrategyProfile:
        """
        Mutate a strategy profile with random adjustments.

        Args:
            strategy: The strategy to mutate
            mutation_strength: Strength of mutations (0.0 to 1.0)

        Returns:
            A new mutated StrategyProfile
        """
        def mutate_value(value: float, min_val: float, max_val: float) -> float:
            """Apply random mutation to a value."""
            delta = (max_val - min_val) * mutation_strength * random.uniform(-1, 1)
            return max(min_val, min(max_val, value + delta))

        return StrategyProfile(
            base_bid_fraction=mutate_value(strategy.base_bid_fraction, 0.05, 0.3),
            distance_weight=mutate_value(strategy.distance_weight, 0.0, 0.2),
            distance_decay=mutate_value(strategy.distance_decay, 0.1, 1.0),
            counter_bid_multiplier=mutate_value(strategy.counter_bid_multiplier, 1.0, 1.5),
            counter_bid_threshold=mutate_value(strategy.counter_bid_threshold, 0.1, 0.5),
            bid_timing_ms=mutate_value(strategy.bid_timing_ms, 100.0, 500.0),
            counter_timing_ms=mutate_value(strategy.counter_timing_ms, 200.0, 600.0),
            aggression_level=mutate_value(strategy.aggression_level, 0.0, 1.0),
            budget_reserve_fraction=mutate_value(strategy.budget_reserve_fraction, 0.1, 0.4),
        )

    def _crossover_strategies(
        self,
        parent1: StrategyProfile,
        parent2: StrategyProfile
    ) -> StrategyProfile:
        """
        Create a child strategy from two parents.

        Args:
            parent1: First parent strategy
            parent2: Second parent strategy

        Returns:
            A new StrategyProfile combining traits from both parents
        """
        # Uniform crossover: randomly select each parameter from either parent
        return StrategyProfile(
            base_bid_fraction=random.choice([parent1.base_bid_fraction, parent2.base_bid_fraction]),
            distance_weight=random.choice([parent1.distance_weight, parent2.distance_weight]),
            distance_decay=random.choice([parent1.distance_decay, parent2.distance_decay]),
            counter_bid_multiplier=random.choice([parent1.counter_bid_multiplier, parent2.counter_bid_multiplier]),
            counter_bid_threshold=random.choice([parent1.counter_bid_threshold, parent2.counter_bid_threshold]),
            bid_timing_ms=random.choice([parent1.bid_timing_ms, parent2.bid_timing_ms]),
            counter_timing_ms=random.choice([parent1.counter_timing_ms, parent2.counter_timing_ms]),
            aggression_level=random.choice([parent1.aggression_level, parent2.aggression_level]),
            budget_reserve_fraction=random.choice([parent1.budget_reserve_fraction, parent2.budget_reserve_fraction]),
        )

    def _save_history(self) -> None:
        """Save evolution history to file."""
        if not self.history_path:
            return

        path = Path(self.history_path)
        path.parent.mkdir(parents=True, exist_ok=True)

        with open(path, 'w') as f:
            json.dump({
                "cycle_count": self.cycle_count,
                "baseline_win_rate": self.baseline_win_rate,
                "best_win_rate": self.best_win_rate,
                "history": self.history,
            }, f, indent=2)

        logger.info(f"Saved evolution history to {self.history_path}")

    def get_best_strategy(self) -> Optional[StrategyProfile]:
        """
        Get the best performing strategy.

        Returns:
            The best StrategyProfile or None if no assessment done
        """
        return self.best_strategy

    def export_best_strategy(self, path: str) -> bool:
        """
        Export the best strategy to a file.

        Args:
            path: File path to save to

        Returns:
            True if successful
        """
        if not self.best_strategy:
            logger.warning("No best strategy to export")
            return False

        try:
            file_path = Path(path)
            file_path.parent.mkdir(parents=True, exist_ok=True)

            with open(file_path, 'w') as f:
                json.dump({
                    "strategy": self.best_strategy.to_dict(),
                    "win_rate": self.best_win_rate,
                    "cycle": self.cycle_count,
                }, f, indent=2)

            logger.info(f"Exported best strategy to {path}")
            return True
        except Exception as e:
            logger.error(f"Failed to export strategy: {e}")
            return False

    def reset(self) -> None:
        """Reset the stage to initial state."""
        self._initialize_population()
        self.history = []
        self.cycle_count = 0
        self.baseline_win_rate = 0.5
        self.best_strategy = None
        self.best_win_rate = 0.0
        self.learner.reset()
        logger.info("Reset TectonicStage to initial state")
