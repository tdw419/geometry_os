"""
Hybrid Brain Evolution Hook - Integrates HybridBrain with Evolution Daemon.

Enables autonomous brain evolution through:
1. Weight sector mutations via HybridBrain.mutate_weights()
2. Fitness evaluation with attention pattern analysis
3. Glass Box visualization of evolution progress
"""

import logging
import random
from dataclasses import dataclass, field
from datetime import datetime
from typing import Any, Optional

import numpy as np

logger = logging.getLogger(__name__)


@dataclass
class HybridMutationRecord:
    """Record of a brain mutation for tracking."""
    timestamp: str
    sector: str
    mutation_type: str
    scale: float
    fitness_before: float
    fitness_after: float
    attention_entropy_before: float
    attention_entropy_after: float
    kept: bool
    details: dict = field(default_factory=dict)


class HybridBrainEvolutionHook:
    """Hook for evolving HybridBrain through Evolution Daemon.

    This hook integrates the HybridBrain (Hilbert atlas + PyTorch inference)
    with the Evolution Daemon for autonomous brain improvement.

    Usage:
        hook = HybridBrainEvolutionHook(brain_path="gpt_neo_125m_brain_fixed.rts.png")
        daemon.register_hook('evolution_cycle', hook.on_evolution_cycle)
    """

    # Sectors that are safe to mutate (not LayerNorm, which is catastrophic)
    MUTATABLE_SECTORS = [
        # Attention projections
        "layer_{i}_attn_q_proj_w",
        "layer_{i}_attn_k_proj_w",
        "layer_{i}_attn_v_proj_w",
        "layer_{i}_attn_out_proj_w",
        # MLP
        "layer_{i}_mlp_c_fc_w",
        "layer_{i}_mlp_c_proj_w",
        # Embeddings (with caution)
        "embeddings",
    ]

    def __init__(
        self,
        brain_path: str = "gpt_neo_125m_brain_fixed.rts.png",
        mutation_rate: float = 0.01,
        fitness_threshold: float = 0.0,
        test_prompts: Optional[list[str]] = None,
        max_layers: int = 12
    ):
        """Initialize the hybrid brain evolution hook.

        Args:
            brain_path: Path to the brain atlas PNG file
            mutation_rate: Base rate for weight mutations (0-1)
            fitness_threshold: Minimum improvement to keep mutation
            test_prompts: Prompts for fitness evaluation
            max_layers: Number of transformer layers
        """
        self.brain_path = brain_path
        self.mutation_rate = mutation_rate
        self.fitness_threshold = fitness_threshold
        self.max_layers = max_layers
        self.mutation_history: list[HybridMutationRecord] = []

        # Default test prompts
        self.test_prompts = test_prompts or [
            "The computer",
            "Once upon a time",
            "The little dog"
        ]

        # HybridBrain instance (lazy-loaded)
        self._brain = None
        self._tokenizer = None

        # Visual bridge for Glass Box feedback
        self.visual_bridge = None
        try:
            from systems.visual_shell.api.visual_bridge import broadcast_thought
            self._broadcast_thought = broadcast_thought
            logger.info("Connected to visual bridge for evolution feedback")
        except ImportError:
            self._broadcast_thought = None
            logger.debug("Visual bridge not available")

    def _get_brain(self):
        """Get or create HybridBrain instance."""
        if self._brain is None:
            from systems.visual_shell.wgsl.hybrid_brain import HybridBrain
            self._brain = HybridBrain(self.brain_path)
            logger.info(f"Loaded HybridBrain from {self.brain_path}")
        return self._brain

    def _get_tokenizer(self):
        """Get or create tokenizer."""
        if self._tokenizer is None:
            from transformers import AutoTokenizer
            self._tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
        return self._tokenizer

    def _get_mutatable_sectors(self) -> list[str]:
        """Get list of all mutatable sectors for this brain."""
        sectors = []
        for i in range(self.max_layers):
            for pattern in self.MUTATABLE_SECTORS:
                sector = pattern.format(i=i)
                sectors.append(sector)
        return sectors

    async def on_evolution_cycle(self, cycle_data: dict[str, Any]) -> dict[str, Any]:
        """Called during each evolution cycle.

        Args:
            cycle_data: Data from the evolution daemon

        Returns:
            Result dict with mutation details
        """
        if not cycle_data.get('evolve_brain', True):
            return {"skipped": True, "reason": "brain evolution disabled"}

        cycle_number = cycle_data.get('cycle_number', 0)

        # Random chance to skip (90% probability to allow other evolution)
        if random.random() > 0.1:
            return {"skipped": True, "reason": "random skip (90% probability)"}

        # Select sector and mutation parameters
        sector = self._select_sector()
        mutation_type = random.choice(["noise", "scale", "perturb"])
        scale = self.mutation_rate * random.uniform(0.5, 2.0)

        result = {
            "cycle": cycle_number,
            "sector": sector,
            "mutation_type": mutation_type,
            "scale": scale,
            "timestamp": datetime.utcnow().isoformat()
        }

        try:
            mutation_result = await self._apply_mutation(sector, mutation_type, scale)
            result.update(mutation_result)

            # Broadcast to Glass Box
            await self._broadcast_mutation(result)

        except Exception as e:
            logger.error(f"Brain mutation failed: {e}")
            result["error"] = str(e)
            result["success"] = False

        return result

    def _select_sector(self) -> str:
        """Select which sector to mutate using adaptive weighting."""
        sectors = self._get_mutatable_sectors()

        if not self.mutation_history:
            return random.choice(sectors)

        # Calculate success rates per sector
        success_rates = {}
        for sector in sectors:
            sector_mutations = [m for m in self.mutation_history if m.sector == sector]
            if sector_mutations:
                kept = sum(1 for m in sector_mutations if m.kept)
                success_rates[sector] = kept / len(sector_mutations)
            else:
                success_rates[sector] = 0.5  # Default for unexplored

        # Weighted random selection
        weights = np.array([success_rates.get(s, 0.5) for s in sectors])
        weights = weights / weights.sum()

        return np.random.choice(sectors, p=weights)

    async def _apply_mutation(
        self,
        sector: str,
        mutation_type: str,
        scale: float
    ) -> dict[str, Any]:
        """Apply and evaluate a mutation."""

        brain = self._get_brain()

        # Evaluate fitness before
        fitness_before, entropy_before = await self._evaluate_fitness()

        # Define mutation function
        def mutation_fn(weights):
            if mutation_type == "noise":
                noise = np.random.randn(*weights.shape).astype(np.float32)
                return weights + noise * scale * weights.std()
            elif mutation_type == "scale":
                factor = 1.0 + scale * np.random.randn()
                return weights * factor
            elif mutation_type == "perturb":
                # Perturb random subset of weights
                mask = np.random.random(weights.shape) < 0.1
                perturbation = np.random.randn(*weights.shape).astype(np.float32) * scale * weights.std()
                result = weights.copy()
                result[mask] += perturbation[mask]
                return result
            return weights

        # Apply mutation
        success = brain.mutate_weights(sector, mutation_fn)

        if not success:
            return {"success": False, "error": f"Sector '{sector}' not found"}

        # Evaluate fitness after
        fitness_after, entropy_after = await self._evaluate_fitness()

        # Decide whether to keep
        improvement = fitness_after - fitness_before
        keep = improvement >= self.fitness_threshold

        if not keep:
            # Reload brain to revert (simple approach)
            self._brain = None
            brain = self._get_brain()

        # Record mutation
        record = HybridMutationRecord(
            timestamp=datetime.utcnow().isoformat(),
            sector=sector,
            mutation_type=mutation_type,
            scale=scale,
            fitness_before=fitness_before,
            fitness_after=fitness_after,
            attention_entropy_before=entropy_before,
            attention_entropy_after=entropy_after,
            kept=keep
        )
        self.mutation_history.append(record)

        logger.info(
            f"Brain mutation: sector={sector}, type={mutation_type}, "
            f"fitness={fitness_before:.3f}->{fitness_after:.3f}, kept={keep}"
        )

        return {
            "success": True,
            "fitness_before": fitness_before,
            "fitness_after": fitness_after,
            "entropy_before": entropy_before,
            "entropy_after": entropy_after,
            "improvement": improvement,
            "kept": keep
        }

    def _evaluate_fitness(self) -> tuple[float, float]:
        """Evaluate brain fitness using test prompts.

        Returns:
            Tuple of (fitness_score, average_attention_entropy)
        """
        brain = self._get_brain()
        tokenizer = self._get_tokenizer()

        fitness_scores = []
        entropy_values = []

        for prompt in self.test_prompts[:3]:  # Limit to 3 for speed
            tokens = tokenizer.encode(prompt)

            # Generate with attention capture
            result = brain.generate_with_attention(tokens, max_tokens=5)

            # Calculate fitness from generation quality
            if result.get("attention_history"):
                avg_entropy = np.mean([
                    np.mean([p["entropy"] for p in event["patterns"] if p.get("entropy")])
                    for event in result["attention_history"]
                ])
                entropy_values.append(avg_entropy)

                # Higher entropy = more diverse attention = potentially better
                # But too high entropy = unfocused = bad
                # Sweet spot around 1.0-2.0
                optimal_entropy = 1.5
                entropy_distance = abs(avg_entropy - optimal_entropy)
                fitness = 1.0 / (1.0 + entropy_distance)
                fitness_scores.append(fitness)

        avg_fitness = np.mean(fitness_scores) if fitness_scores else 0.5
        avg_entropy = np.mean(entropy_values) if entropy_values else 1.0

        return avg_fitness, avg_entropy

    async def _broadcast_mutation(self, result: dict[str, Any]):
        """Broadcast mutation event to Glass Box."""
        if self._broadcast_thought is None:
            return

        try:
            import asyncio

            # Create thought payload
            thought = {
                "type": "weight_mutation",
                "sector": result.get("sector"),
                "mutation_type": result.get("mutation_type"),
                "scale": result.get("scale"),
                "fitness_before": result.get("fitness_before"),
                "fitness_after": result.get("fitness_after"),
                "kept": result.get("kept"),
                "content": f"Mutated {result.get('sector')} - {'kept' if result.get('kept') else 'reverted'}",
                "timestamp": datetime.utcnow().timestamp()
            }

            # Broadcast to Glass Box
            if asyncio.iscoroutinefunction(self._broadcast_thought):
                await self._broadcast_thought(thought)
            else:
                self._broadcast_thought(thought)

        except Exception as e:
            logger.warning(f"Failed to broadcast mutation: {e}")

    def get_evolution_stats(self) -> dict[str, Any]:
        """Get statistics about evolution history."""
        if not self.mutation_history:
            return {"total": 0}

        kept = [m for m in self.mutation_history if m.kept]
        reverted = [m for m in self.mutation_history if not m.kept]

        avg_fitness_improvement = 0.0
        if kept:
            improvements = [m.fitness_after - m.fitness_before for m in kept]
            avg_fitness_improvement = np.mean(improvements)

        sector_stats = {}
        for record in self.mutation_history:
            if record.sector not in sector_stats:
                sector_stats[record.sector] = {"attempts": 0, "kept": 0}
            sector_stats[record.sector]["attempts"] += 1
            if record.kept:
                sector_stats[record.sector]["kept"] += 1

        return {
            "total_mutations": len(self.mutation_history),
            "kept": len(kept),
            "reverted": len(reverted),
            "keep_rate": len(kept) / len(self.mutation_history),
            "avg_fitness_improvement": avg_fitness_improvement,
            "sectors_mutated": list(sector_stats.keys()),
            "sector_stats": sector_stats
        }


def register_hybrid_brain_hook(daemon=None) -> bool:
    """Register hybrid brain evolution hook with Evolution Daemon.

    Args:
        daemon: EvolutionDaemon instance (optional)

    Returns:
        True if registration succeeded
    """
    try:
        if daemon is None:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
            daemon = EvolutionDaemon()

        hook = HybridBrainEvolutionHook()

        if hasattr(daemon, 'register_hook'):
            daemon.register_hook('evolution_cycle', hook.on_evolution_cycle)
            logger.info("Hybrid brain evolution hook registered")
            return True
        else:
            logger.warning("Daemon doesn't support hooks")
            return False

    except Exception as e:
        logger.error(f"Failed to register hybrid brain hook: {e}")
        return False
