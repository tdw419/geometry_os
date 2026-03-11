"""Brain Evolution Hook - Triggers cognitive engine evolution.

This hook integrates PixelBrain with the Evolution Daemon, enabling:
1. Weight atlas mutations (fine-tuning)
2. WGSL shader evolution (architecture search)
3. Fitness-based selection (keep improvements, revert regressions)

The brain evolves alongside the OS, creating a self-improving cognitive core.
"""

import logging
import random
from dataclasses import dataclass, field
from datetime import datetime
from typing import Any

import numpy as np

logger = logging.getLogger(__name__)


@dataclass
class MutationRecord:
    """Record of a brain mutation for tracking."""
    timestamp: str
    sector: str
    mutation_type: str
    fitness_before: float
    fitness_after: float
    kept: bool
    details: dict[str, Any] = field(default_factory=dict)


class BrainEvolutionHook:
    """Hook for evolving PixelBrain through Evolution Daemon.

    This hook is called during evolution cycles and can:
    - Mutate weight sectors in the brain atlas
    - Evolve WGSL shader code
    - Evaluate fitness and keep only improvements

    Usage:
        hook = BrainEvolutionHook(brain_path="tinystories_brain.rts.png")
        daemon.register_hook('evolution_cycle', hook.on_evolution_cycle)
    """

    def __init__(
        self,
        brain_path: str = "tinystories_brain.rts.png",
        mutation_rate: float = 0.01,
        fitness_threshold: float = 0.0,  # Keep if fitness_after >= fitness_before + threshold
        test_prompts: list[str] | None = None,
        use_adaptive_sector_selection: bool = True
    ):
        """Initialize the brain evolution hook.

        Args:
            brain_path: Path to the brain atlas file
            mutation_rate: Rate for weight mutations (0-1)
            fitness_threshold: Minimum improvement to keep mutation
            test_prompts: Prompts for fitness evaluation
            use_adaptive_sector_selection: Weight sector selection by historical success rate
        """
        self.brain_path = brain_path
        self.mutation_rate = mutation_rate
        self.fitness_threshold = fitness_threshold
        self.use_adaptive_sector_selection = use_adaptive_sector_selection
        self.mutation_history: list[MutationRecord] = []
        self._brain_atlas: np.ndarray | None = None
        self._shader_backup: str | None = None

        # Default test prompts for fitness evaluation
        self.test_prompts = test_prompts or [
            "Once upon a time",
            "The little dog",
            "She went to the"
        ]

        # Visual bridge for emitting visual feedback
        self.visual_bridge = None
        try:
            from systems.visual_shell.api.visual_bridge import VisualBridgeClient
            self.visual_bridge = VisualBridgeClient()
            logger.info("Connected to visual bridge for brain evolution feedback")
        except ImportError:
            logger.debug("Visual bridge not available for brain evolution")

    async def on_evolution_cycle(self, cycle_data: dict[str, Any]) -> dict[str, Any]:
        """Called during each evolution cycle.

        Args:
            cycle_data: Data from the evolution daemon including:
                - evolve_brain: Whether to evolve brain this cycle
                - cycle_number: Current cycle number
                - daemon: Reference to EvolutionDaemon instance

        Returns:
            Result dict with mutation details
        """
        if not cycle_data.get('evolve_brain', False):
            return {"skipped": True, "reason": "brain evolution not enabled"}

        cycle_number = cycle_data.get('cycle_number', 0)

        # Randomly decide if we should mutate this cycle (10% chance)
        if random.random() > 0.1:
            return {"skipped": True, "reason": "random skip (90% probability)"}

        # Select mutation type and sector
        mutation_type = random.choice(["weights", "weights", "shader"])  # Bias toward weights
        sector = self._select_sector(cycle_data)

        result = {
            "cycle": cycle_number,
            "mutation_type": mutation_type,
            "sector": sector,
            "timestamp": datetime.utcnow().isoformat()
        }

        try:
            if mutation_type == "weights":
                mutation_result = await self._mutate_weights(sector, cycle_data)
            else:
                mutation_result = await self._mutate_shader(cycle_data)

            result.update(mutation_result)

        except Exception as e:
            logger.error(f"Brain mutation failed: {e}")
            result["error"] = str(e)
            result["success"] = False

        return result

    def _select_sector(self, cycle_data: dict[str, Any]) -> str:
        """Select which sector to mutate.

        Sectors are weighted by their historical success rate when adaptive
        selection is enabled. Falls back to uniform random selection otherwise.
        """
        sectors = [
            "embeddings",
            "attention_layer_0",
            "attention_layer_1",
            "ffn_layer_0",
            "ffn_layer_1",
            "lm_head"
        ]

        if not self.use_adaptive_sector_selection:
            return random.choice(sectors)

        # Calculate success rates per sector
        success_rates = self._calculate_sector_success_rates(sectors)

        # Convert to numpy arrays for weighted selection
        sector_array = np.array(sectors)
        weights = np.array([success_rates[s] for s in sectors])

        # Normalize weights to sum to 1
        total = weights.sum()
        if total > 0:
            normalized_weights = weights / total
        else:
            # Fallback to uniform if no history
            normalized_weights = np.ones(len(sectors)) / len(sectors)

        # Log sector weights
        weights_str = ", ".join(f"{s}={w:.3f}" for s, w in zip(sectors, normalized_weights))
        logger.info(f"Sector weights: {weights_str}")

        # Weighted random selection
        selected = np.random.choice(sector_array, p=normalized_weights)
        return str(selected)

    def _calculate_sector_success_rates(self, sectors: list[str]) -> dict[str, float]:
        """Calculate success rate (kept_count / total_attempts) for each sector.

        Args:
            sectors: List of sector names to calculate rates for

        Returns:
            Dict mapping sector name to success rate (0.0 to 1.0)
        """
        success_rates = {}

        for sector in sectors:
            # Filter mutation history for this sector
            sector_mutations = [m for m in self.mutation_history if m.sector == sector]

            if not sector_mutations:
                # No history - use default weight (encourages exploration)
                success_rates[sector] = 0.5
                continue

            # Calculate kept_count / total_attempts
            kept_count = sum(1 for m in sector_mutations if m.kept)
            total_attempts = len(sector_mutations)
            success_rate = kept_count / total_attempts if total_attempts > 0 else 0.5

            success_rates[sector] = success_rate

        return success_rates

    async def _mutate_weights(self, sector: str, cycle_data: dict[str, Any]) -> dict[str, Any]:
        """Mutate weight sector in the brain atlas.

        This applies a mutation, evaluates fitness, and keeps only if improved.
        """
        from systems.evolution_daemon.brain_mutations import (
            evaluate_brain_fitness,
            mutate_weight_sector,
        )

        # Load brain atlas if not cached
        if self._brain_atlas is None:
            self._brain_atlas = self._load_brain_atlas()
            if self._brain_atlas is None:
                return {"success": False, "error": "Could not load brain atlas"}

        # Evaluate fitness before mutation
        fitness_before = evaluate_brain_fitness(
            self.brain_path,
            self.test_prompts,
            criteria="coherence"
        )

        # Backup current sector
        sector_backup = self._backup_sector(sector)

        # Apply mutation
        mutation_type = random.choice(["gaussian", "uniform"])
        mutated_atlas = mutate_weight_sector(
            self._brain_atlas,
            sector=sector,
            rate=self.mutation_rate,
            mutation_type=mutation_type
        )

        # Evaluate fitness after mutation
        fitness_after = evaluate_brain_fitness(
            self.brain_path,
            self.test_prompts,
            criteria="coherence"
        )

        # Decide whether to keep mutation
        improvement = fitness_after - fitness_before
        keep = improvement >= self.fitness_threshold

        if not keep:
            # Revert mutation
            self._restore_sector(sector, sector_backup)
            self._brain_atlas = self._load_brain_atlas()  # Reload
        else:
            # Save mutated atlas
            self._save_brain_atlas()

            # Emit visual feedback for kept mutation
            if self.visual_bridge:
                try:
                    # Emit atlas glow for the mutated sector
                    indices = self._get_sector_indices(sector)
                    self.visual_bridge.emit_atlas_glow(indices, intensity=0.8)
                    logger.debug(f"Emitted atlas glow for sector {sector}")

                    # Emit thought pulse for the improvement
                    self.visual_bridge.emit_thought_pulse(
                        token_id=hash(sector) % 50257,
                        position=(100, 100),
                        intensity=min(1.0, improvement + 0.5)
                    )
                except Exception as e:
                    logger.warning(f"Failed to emit visual feedback: {e}")

        # Record mutation
        record = MutationRecord(
            timestamp=datetime.utcnow().isoformat(),
            sector=sector,
            mutation_type=mutation_type,
            fitness_before=fitness_before,
            fitness_after=fitness_after,
            kept=keep
        )
        self.mutation_history.append(record)

        logger.info(
            f"Brain mutation: sector={sector}, type={mutation_type}, "
            f"fitness={fitness_before:.3f}->{fitness_after:.3f}, kept={keep}"
        )

        return {
            "success": True,
            "sector": sector,
            "mutation_type": mutation_type,
            "fitness_before": fitness_before,
            "fitness_after": fitness_after,
            "improvement": improvement,
            "kept": keep
        }

    async def _mutate_shader(self, cycle_data: dict[str, Any]) -> dict[str, Any]:
        """Mutate WGSL shader code.

        This evolves the shader architecture through controlled mutations.
        """

        # For now, just log that shader mutation was attempted
        # Full implementation would load, mutate, evaluate, and save shader

        mutation_type = random.choice(["activation", "normalization", "attention"])

        logger.info(f"Shader mutation attempted: type={mutation_type}")

        return {
            "success": True,
            "mutation_type": mutation_type,
            "note": "Shader mutation logged (full implementation pending)"
        }

    def _load_brain_atlas(self) -> np.ndarray | None:
        """Load brain atlas from file."""
        try:
            import os

            from PIL import Image

            # Look for brain file in common locations
            search_paths = [
                self.brain_path,
                f"systems/visual_shell/brains/{self.brain_path}",
                f"brains/{self.brain_path}",
                f".geometry/brains/{self.brain_path}"
            ]

            for path in search_paths:
                if os.path.exists(path):
                    img = Image.open(path)
                    atlas = np.array(img, dtype=np.float16) / 255.0
                    logger.info(f"Loaded brain atlas from {path}")
                    return atlas

            logger.warning(f"Brain atlas not found: {self.brain_path}")
            return None

        except Exception as e:
            logger.error(f"Failed to load brain atlas: {e}")
            return None

    def _save_brain_atlas(self) -> bool:
        """Save brain atlas to file."""
        try:
            import os

            from PIL import Image

            if self._brain_atlas is None:
                return False

            # Save to primary location
            save_path = self.brain_path
            os.makedirs(os.path.dirname(save_path) if os.path.dirname(save_path) else ".", exist_ok=True)

            # Convert back to uint8 for saving
            atlas_uint8 = (self._brain_atlas * 255).astype(np.uint8)
            img = Image.fromarray(atlas_uint8)
            img.save(save_path)

            logger.info(f"Saved brain atlas to {save_path}")
            return True

        except Exception as e:
            logger.error(f"Failed to save brain atlas: {e}")
            return False

    def _backup_sector(self, sector: str) -> np.ndarray:
        """Backup a sector of the brain atlas."""
        from systems.evolution_daemon.brain_mutations import _get_sector_bounds

        bounds = _get_sector_bounds(sector)
        if bounds is None or self._brain_atlas is None:
            return np.array([])

        x_start, x_end, y_start, y_end = bounds
        return self._brain_atlas[y_start:y_end, x_start:x_end].copy()

    def _restore_sector(self, sector: str, backup: np.ndarray):
        """Restore a sector from backup."""
        from systems.evolution_daemon.brain_mutations import _get_sector_bounds

        bounds = _get_sector_bounds(sector)
        if bounds is None or self._brain_atlas is None or backup.size == 0:
            return

        x_start, x_end, y_start, y_end = bounds
        self._brain_atlas[y_start:y_end, x_start:x_end] = backup

    def _get_sector_indices(self, sector: str) -> list[int]:
        """Get pixel indices for a sector (for glow effect)."""
        from systems.evolution_daemon.brain_mutations import _get_sector_bounds

        bounds = _get_sector_bounds(sector)
        if bounds is None:
            return []

        x_start, x_end, y_start, y_end = bounds
        # Return center indices for glow effect
        center_x = (x_start + x_end) // 2
        center_y = (y_start + y_end) // 2
        # Return indices in a small grid around center
        indices = []
        for dy in range(-2, 3):
            for dx in range(-2, 3):
                idx = (center_y + dy) * 1024 + (center_x + dx)
                if 0 <= idx < 1024 * 1024:
                    indices.append(idx)
        return indices

    def get_mutation_stats(self) -> dict[str, Any]:
        """Get statistics about mutation history."""
        if not self.mutation_history:
            return {"total": 0}

        kept = [m for m in self.mutation_history if m.kept]
        reverted = [m for m in self.mutation_history if not m.kept]

        avg_improvement = 0.0
        if kept:
            improvements = [m.fitness_after - m.fitness_before for m in kept]
            avg_improvement = sum(improvements) / len(improvements)

        return {
            "total": len(self.mutation_history),
            "kept": len(kept),
            "reverted": len(reverted),
            "keep_rate": len(kept) / len(self.mutation_history) if self.mutation_history else 0,
            "avg_improvement": avg_improvement,
            "sectors_mutated": list(set(m.sector for m in self.mutation_history))
        }


def register_hook(daemon=None) -> bool:
    """Register brain evolution hook with Evolution Daemon.

    This is the entry point called by the daemon during initialization.

    Args:
        daemon: EvolutionDaemon instance (optional, creates new if None)

    Returns:
        True if registration succeeded, False otherwise
    """
    try:
        if daemon is None:
            from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
            daemon = EvolutionDaemon()

        # Create hook instance
        hook = BrainEvolutionHook()

        # Register with daemon's hook system
        if hasattr(daemon, 'register_hook'):
            daemon.register_hook('evolution_cycle', hook.on_evolution_cycle)
            logger.info("Brain evolution hook registered with daemon")
            return True
        else:
            # Daemon doesn't support hooks yet - use mutation target registration
            logger.warning("Daemon doesn't support hooks, using mutation target registration")
            return _register_as_mutation_target(daemon, hook)

    except Exception as e:
        logger.warning(f"Brain evolution hook registration failed: {e}")
        return False


def _register_as_mutation_target(daemon, hook: BrainEvolutionHook) -> bool:
    """Fallback: Register as mutation target instead of hook."""
    try:
        if hasattr(daemon, 'register_mutation_target'):
            from systems.evolution_daemon.brain_mutations import (
                evaluate_brain_fitness,
                mutate_shader,
                mutate_weight_sector,
            )

            # Register weight mutation
            daemon.register_mutation_target(
                name="pixel_brain_weights",
                mutate_fn=mutate_weight_sector,
                evaluate_fn=lambda: evaluate_brain_fitness(
                    hook.brain_path,
                    hook.test_prompts
                ),
                sector="cognitive"
            )

            # Register shader mutation
            daemon.register_mutation_target(
                name="pixel_brain_shaders",
                mutate_fn=mutate_shader,
                evaluate_fn=lambda: 0.5,  # Default fitness
                sector="cognitive"
            )

            logger.info("PixelBrain registered as mutation target")
            return True

        else:
            logger.warning("Daemon doesn't support mutation targets either")
            return False

    except Exception as e:
        logger.error(f"Failed to register as mutation target: {e}")
        return False
