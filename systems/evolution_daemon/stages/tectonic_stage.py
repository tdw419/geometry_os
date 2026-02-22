"""
Tectonic Stage - Substrate Self-Optimization

Enables the EvolutionDaemon to optimize its own WGSL shader substrate
through genetic algorithms and IPC benchmarking.

Triggers:
- MetabolismMonitor detects substrate degradation
- Agent requests performance improvement
- Scheduled tectonic maintenance
"""

import asyncio
import logging
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any
from datetime import datetime
from pathlib import Path

from systems.evolution_daemon.tectonic_fitness_service import (
    TectonicFitnessService, TectonicConfig, FitnessScore
)
from systems.evolution_daemon.tectonic_mutation_engine import TectonicMutationEngine

logger = logging.getLogger("evolution_daemon.tectonic_stage")


@dataclass
class TectonicShiftResult:
    """Result of a tectonic shift operation."""
    success: bool
    generations_run: int
    baseline_ipc: float
    final_ipc: float
    improvement_pct: float
    best_mutation_id: Optional[str] = None
    best_shader_code: Optional[str] = None
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())
    error: Optional[str] = None


class TectonicStage:
    """
    Manages tectonic evolution of the shader substrate.

    The Tectonic Stage:
    1. Monitors substrate performance via MetabolismMonitor
    2. Triggers genetic optimization when needed
    3. Proposes shader upgrades to MasterStage
    4. Broadcasts tectonic events to the visual shell
    """

    def __init__(
        self,
        config: Optional[TectonicConfig] = None,
        evolution_daemon=None
    ):
        self.config = config or TectonicConfig()
        self.daemon = evolution_daemon

        # Services (initialized lazily)
        self.fitness_service: Optional[TectonicFitnessService] = None
        self.mutation_engine: Optional[TectonicMutationEngine] = None

        # State
        self.baseline_ipc: float = 0.0
        self.last_shift_result: Optional[TectonicShiftResult] = None
        self.shift_history: List[TectonicShiftResult] = []

    async def initialize(self) -> bool:
        """Initialize the tectonic stage services."""
        logger.info("Initializing Tectonic Stage...")

        self.fitness_service = TectonicFitnessService(self.config)
        self.mutation_engine = TectonicMutationEngine(mutation_rate=self.config.mutation_rate)

        if not await self.fitness_service.initialize():
            logger.error("Failed to initialize TectonicFitnessService")
            return False

        self.baseline_ipc = self.fitness_service.baseline_score.ipc
        logger.info(f"Tectonic Stage ready (baseline IPC: {self.baseline_ipc:.4f})")
        return True

    async def trigger_tectonic_shift(
        self,
        reason: str = "manual_trigger",
        target_improvement: Optional[float] = None
    ) -> TectonicShiftResult:
        """
        Execute a tectonic shift to optimize the shader substrate.

        Args:
            reason: Why this shift was triggered
            target_improvement: Override config target (0.0-1.0)

        Returns:
            TectonicShiftResult with optimization outcome
        """
        logger.info(f"TECTONIC SHIFT TRIGGERED: {reason}")

        if not self.fitness_service:
            await self.initialize()

        target = target_improvement or self.config.target_improvement
        base_shader = self.fitness_service.shader_path.read_text()
        best_shader = base_shader
        current_best = self.fitness_service.baseline_score

        result = TectonicShiftResult(
            success=False,
            generations_run=0,
            baseline_ipc=current_best.ipc,
            final_ipc=current_best.ipc,
            improvement_pct=0.0
        )

        try:
            for gen in range(1, self.config.generations + 1):
                logger.info(f"   Generation {gen}/{self.config.generations}")

                # Generate mutations from best so far
                variants = self.mutation_engine.generate_mutations(
                    best_shader,
                    count=self.config.population_size
                )

                # Benchmark each variant
                generation_scores = []
                for i, code in enumerate(variants):
                    mutation_id = f"shift-gen{gen:02d}-var{i:02d}"
                    score = await self.fitness_service.benchmark_shader(mutation_id, code)
                    generation_scores.append((code, score))

                # Select best of generation
                valid = [(c, s) for c, s in generation_scores if s.correctness]
                if not valid:
                    logger.warning(f"   Generation {gen}: no valid mutations")
                    continue

                gen_best_code, gen_best_score = max(valid, key=lambda x: x[1].fitness)

                if gen_best_score.fitness > current_best.fitness:
                    improvement = (gen_best_score.ipc - current_best.ipc) / current_best.ipc
                    logger.info(f"   New best: {gen_best_score.mutation_id} (+{improvement*100:.1f}%)")
                    current_best = gen_best_score
                    best_shader = gen_best_code

                result.generations_run = gen

                # Check if target reached
                total_improvement = (current_best.ipc - result.baseline_ipc) / result.baseline_ipc
                if total_improvement >= target:
                    logger.info(f"   Target reached: {total_improvement*100:.1f}%")
                    break

            # Finalize result
            result.final_ipc = current_best.ipc
            result.improvement_pct = (current_best.ipc - result.baseline_ipc) / result.baseline_ipc
            result.best_mutation_id = current_best.mutation_id
            result.best_shader_code = best_shader
            result.success = result.improvement_pct > 0

            logger.info(f"Tectonic shift complete: {result.improvement_pct*100:.1f}% improvement")

        except Exception as e:
            logger.error(f"Tectonic shift failed: {e}")
            result.error = str(e)

        self.last_shift_result = result
        self.shift_history.append(result)
        return result

    def should_trigger_shift(self, current_ipc: float) -> bool:
        """Determine if a tectonic shift should be triggered."""
        if self.baseline_ipc == 0:
            return False

        degradation = (self.baseline_ipc - current_ipc) / self.baseline_ipc
        return degradation > 0.1  # Trigger if 10% degraded

    def get_stats(self) -> Dict[str, Any]:
        """Get tectonic stage statistics."""
        return {
            "baseline_ipc": self.baseline_ipc,
            "shifts_performed": len(self.shift_history),
            "last_shift_success": self.last_shift_result.success if self.last_shift_result else None,
            "total_improvement": sum(s.improvement_pct for s in self.shift_history if s.success),
            "config": {
                "generations": self.config.generations,
                "population_size": self.config.population_size,
                "mutation_rate": self.config.mutation_rate,
                "target_improvement": self.config.target_improvement
            }
        }
