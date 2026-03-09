"""
Brain Mutations - Evolution Daemon Integration for PixelBrain

Enables the Evolution Daemon to mutate:
1. Weight atlas sectors (fine-tuning)
2. WGSL shader code (architecture search)
3. GeoASM orchestration (control flow evolution)

This makes the OS capable of improving its own cognitive engine.
"""

import numpy as np
from typing import Optional, List, Dict, Tuple
import logging
import random

logger = logging.getLogger(__name__)


def mutate_weight_sector(
    atlas: np.ndarray,
    sector: str,
    rate: float = 0.01,
    mutation_type: str = "gaussian"
) -> np.ndarray:
    """
    Apply mutation to a weight sector in the atlas.

    Args:
        atlas: Weight atlas array (1024x1024x4)
        sector: Sector name (e.g., "attention_layer_0", "embeddings")
        rate: Mutation rate (0-1)
        mutation_type: "gaussian", "uniform", or "crossover"

    Returns:
        Modified atlas (in-place mutation)
    """
    # Get sector bounds
    bounds = _get_sector_bounds(sector)
    if bounds is None:
        logger.warning(f"Unknown sector: {sector}")
        return atlas

    x_start, x_end, y_start, y_end = bounds
    sector_slice = atlas[y_start:y_end, x_start:x_end]

    if mutation_type == "gaussian":
        noise = np.random.normal(0, rate, sector_slice.shape).astype(np.float16)
        sector_slice = sector_slice + noise
    elif mutation_type == "uniform":
        mask = np.random.random(sector_slice.shape) < rate
        noise = np.random.uniform(-0.1, 0.1, sector_slice.shape).astype(np.float16)
        sector_slice = np.where(mask, sector_slice + noise, sector_slice)

    atlas[y_start:y_end, x_start:x_end] = sector_slice
    return atlas


def _get_sector_bounds(sector: str) -> Optional[Tuple[int, int, int, int]]:
    """Get pixel bounds for a weight sector."""
    # Approximate sector locations in 1024x1024 atlas
    sectors = {
        "embeddings": (0, 256, 0, 512),
        "attention_layer_0": (256, 384, 0, 256),
        "attention_layer_1": (384, 512, 0, 256),
        "ffn_layer_0": (256, 384, 256, 512),
        "ffn_layer_1": (384, 512, 256, 512),
        "lm_head": (512, 1024, 512, 1024),
    }
    return sectors.get(sector)


def mutate_shader(
    original_code: str,
    mutation_type: str = "activation"
) -> str:
    """
    Apply mutation to WGSL shader code.

    Args:
        original_code: Original WGSL code
        mutation_type: Type of mutation to apply

    Returns:
        Mutated WGSL code
    """
    mutations = {
        "activation": _mutate_activation,
        "normalization": _mutate_normalization,
        "attention": _mutate_attention_pattern,
    }

    mutator = mutations.get(mutation_type, lambda x: x)
    return mutator(original_code)


def _mutate_activation(code: str) -> str:
    """Mutate activation functions."""
    activations = [
        ("silu(x)", "x / (1.0 + exp(-x))"),
        ("relu(x)", "max(0.0, x)"),
        ("gelu(x)", "0.5 * x * (1.0 + tanh(0.7978845608 * (x + 0.044715 * x * x * x)))"),
        ("tanh(x)", "tanh(x)"),
    ]

    result = code
    if "silu" in code.lower():
        # Randomly replace with different activation
        new_act = random.choice(activations)
        result = code.replace(
            "return x / (1.0 + exp(-x));",
            f"return {new_act[1]};"
        )

    return result


def _mutate_normalization(code: str) -> str:
    """Mutate normalization patterns."""
    # Swap layer norm with RMS norm occasionally
    if "layer_norm" in code and random.random() < 0.3:
        return code.replace("layer_norm", "rms_norm")
    return code


def _mutate_attention_pattern(code: str) -> str:
    """Mutate attention computation."""
    # Occasionally add attention scaling variants
    if "score / sqrt" in code and random.random() < 0.2:
        return code.replace(
            "score / sqrt(f32(HEAD_DIM))",
            "score * 0.3535"  # Approximate 1/sqrt(8)
        )
    return code


def evaluate_brain_fitness(
    brain_path: str,
    test_prompts: List[str],
    criteria: str = "coherence"
) -> float:
    """
    Evaluate brain fitness on test cases.

    Args:
        brain_path: Path to brain atlas
        test_prompts: Test prompts to evaluate
        criteria: Fitness criteria

    Returns:
        Fitness score (0-1)
    """
    try:
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

        service = get_pixel_brain_service()

        if not service.is_available():
            return 0.0

        # Run test prompts and evaluate outputs
        total_score = 0.0

        for prompt in test_prompts:
            result = service.generate(prompt, max_tokens=10)
            text = result.get('text', '')

            # Simple coherence check
            score = _evaluate_coherence(text)
            total_score += score

        return total_score / len(test_prompts)

    except Exception as e:
        logger.error(f"Fitness evaluation failed: {e}")
        return 0.0


def _evaluate_coherence(text: str) -> float:
    """Simple coherence evaluation."""
    if not text or len(text) < 5:
        return 0.0

    # Check for basic coherence signals
    score = 0.5

    # Has spaces (word-like)
    if ' ' in text:
        score += 0.1

    # Has common words
    common = ['the', 'a', 'is', 'was', 'to', 'and']
    for word in common:
        if word in text.lower():
            score += 0.05

    # Not all same character
    if len(set(text)) > 3:
        score += 0.1

    return min(1.0, score)


# Evolution Daemon Integration
def register_brain_as_evolution_target():
    """Register PixelBrain as an evolution target."""
    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Register weight mutation
        daemon.register_mutation_target(
            name="pixel_brain_weights",
            mutate_fn=mutate_weight_sector,
            evaluate_fn=lambda: evaluate_brain_fitness("tinystories_brain.rts.png", ["test"]),
            sector="cognitive"
        )

        # Register shader mutation
        daemon.register_mutation_target(
            name="pixel_brain_shaders",
            mutate_fn=mutate_shader,
            evaluate_fn=lambda: 0.5,  # TODO: Shader fitness
            sector="cognitive"
        )

        logger.info("PixelBrain registered as evolution target")
        return True

    except Exception as e:
        logger.warning(f"Failed to register evolution target: {e}")
        return False
