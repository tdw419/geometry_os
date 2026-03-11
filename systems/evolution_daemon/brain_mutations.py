"""
Brain Mutations - Evolution Daemon Integration for PixelBrain

Enables the Evolution Daemon to mutate the cognitive engine through:
1. Weight atlas sectors - fine-tuning neural weights via Gaussian/uniform noise
2. WGSL shader code - architecture search via activation/normalization mutations

This module bridges the Evolution Daemon and PixelBrain, enabling self-improvement
of the OS's cognitive capabilities through evolutionary optimization.

Example Usage:
    >>> import numpy as np
    >>> from systems.evolution_daemon.brain_mutations import (
    ...     mutate_weight_sector, mutate_shader, evaluate_brain_fitness
    ... )
    >>>
    >>> # Mutate a weight sector
    >>> atlas = np.zeros((1024, 1024, 4), dtype=np.float16)
    >>> mutated = mutate_weight_sector(atlas, "embeddings", rate=0.01)
    >>>
    >>> # Mutate shader code
    >>> shader = "fn silu(x: f32) -> f32 { return x / (1.0 + exp(-x)); }"
    >>> mutated_shader = mutate_shader(shader, mutation_type="activation")
    >>>
    >>> # Evaluate fitness
    >>> score = evaluate_brain_fitness("brain.rts.png", ["test prompt"])
    >>> print(f"Fitness score: {score}")

Sector Layout (1024x1024 atlas):
    - embeddings: (0-256, 0-512) - Token embeddings
    - attention_layer_0: (256-384, 0-256) - First attention layer
    - attention_layer_1: (384-512, 0-256) - Second attention layer
    - ffn_layer_0: (256-384, 256-512) - First feedforward layer
    - ffn_layer_1: (384-512, 256-512) - Second feedforward layer
    - lm_head: (512-1024, 512-1024) - Language model head
"""

import logging
import random

import numpy as np

logger = logging.getLogger(__name__)


def mutate_weight_sector(
    atlas: np.ndarray,
    sector: str,
    rate: float = 0.01,
    mutation_type: str = "gaussian"
) -> np.ndarray:
    """
    Apply mutation to a weight sector in the atlas.

    Mutates a specific sector of the weight atlas in-place by adding noise.
    The mutation type determines how the noise is applied.

    Args:
        atlas: Weight atlas array (1024x1024x4), dtype should be float16
        sector: Sector name. Valid options: "embeddings", "attention_layer_0",
            "attention_layer_1", "ffn_layer_0", "ffn_layer_1", "lm_head"
        rate: Mutation rate (0-1). For gaussian, this is the std deviation.
            For uniform, this is the probability of mutating each weight.
        mutation_type: "gaussian" adds normal noise with std=rate,
            "uniform" randomly perturbs weights with probability=rate

    Returns:
        The same atlas array (modified in-place)

    Example:
        >>> atlas = load_weight_atlas("brain.rts.png")
        >>> # Apply gentle mutation to attention layer
        >>> mutated = mutate_weight_sector(atlas, "attention_layer_0", rate=0.005)
        >>> save_weight_atlas("brain_mutated.rts.png", mutated)
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


def _get_sector_bounds(sector: str) -> tuple[int, int, int, int] | None:
    """
    Get pixel bounds for a weight sector.

    Returns the (x_start, x_end, y_start, y_end) coordinates for the named sector
    within the 1024x1024 weight atlas.

    Args:
        sector: Sector name

    Returns:
        Tuple of bounds or None if sector name is unknown
    """
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

    Performs syntax-aware mutations on WGSL compute shaders used by PixelBrain.
    Each mutation type targets a specific aspect of the shader architecture.

    Args:
        original_code: Original WGSL shader code as a string
        mutation_type: Type of mutation to apply:
            - "activation": Swaps activation functions (silu, relu, gelu, tanh)
            - "normalization": Swaps normalization patterns (layer_norm, rms_norm)
            - "attention": Modifies attention scaling computations

    Returns:
        Mutated WGSL code string. Returns original code unchanged if the
        mutation pattern is not found or mutation_type is unknown.

    Example:
        >>> shader = '''
        ... fn silu(x: f32) -> f32 {
        ...     return x / (1.0 + exp(-x));
        ... }
        ... '''
        >>> mutated = mutate_shader(shader, mutation_type="activation")
        >>> # May replace silu with relu, gelu, or tanh
    """
    mutations = {
        "activation": _mutate_activation,
        "normalization": _mutate_normalization,
        "attention": _mutate_attention_pattern,
    }

    mutator = mutations.get(mutation_type, lambda x: x)
    return mutator(original_code)


def _mutate_activation(code: str) -> str:
    """
    Mutate activation functions in shader code.

    Randomly selects an activation function from the available set and
    replaces the current silu implementation. This enables architecture
    search across different non-linearities.

    Args:
        code: WGSL shader code containing activation functions

    Returns:
        Mutated code with potentially different activation function
    """
    activations = [
        ("silu(x)", "x / (1.0 + exp(-x))"),
        ("relu(x)", "max(0.0, x)"),
        ("gelu(x)", "0.5 * x * (1.0 + tanh(0.7978845608 * (x + 0.044715 * x * x * x)))"),
        ("tanh(x)", "tanh(x)"),
    ]

    result = code
    if "silu" in code.lower():
        new_act = random.choice(activations)
        result = code.replace(
            "return x / (1.0 + exp(-x));",
            f"return {new_act[1]};"
        )

    return result


def _mutate_normalization(code: str) -> str:
    """
    Mutate normalization patterns in shader code.

    With 30% probability, replaces layer_norm with rms_norm. This can
    affect training stability and inference quality.

    Args:
        code: WGSL shader code containing normalization

    Returns:
        Potentially mutated code with different normalization
    """
    if "layer_norm" in code and random.random() < 0.3:
        return code.replace("layer_norm", "rms_norm")
    return code


def _mutate_attention_pattern(code: str) -> str:
    """
    Mutate attention computation in shader code.

    With 20% probability, replaces dynamic sqrt scaling with a constant
    approximation. This is a minor optimization that may slightly affect
    attention quality.

    Args:
        code: WGSL shader code containing attention computation

    Returns:
        Potentially mutated code with different attention scaling
    """
    if "score / sqrt" in code and random.random() < 0.2:
        return code.replace(
            "score / sqrt(f32(HEAD_DIM))",
            "score * 0.3535"  # Approximate 1/sqrt(8)
        )
    return code


def evaluate_brain_fitness(
    brain_path: str,
    test_prompts: list[str],
    criteria: str = "coherence"
) -> float:
    """
    Evaluate brain fitness using benchmark suite.

    Uses the PixelBrain service to generate completions for test prompts,
    then evaluates them using the brain_benchmarks module. This provides
    a fitness score for evolutionary selection.

    Args:
        brain_path: Path to brain atlas (e.g., "tinystories_brain.rts.png").
            Note: This parameter is for API compatibility; the actual brain
            is accessed via the PixelBrain service.
        test_prompts: List of test prompts to evaluate. Should cover diverse
            tasks to get meaningful fitness scores.
        criteria: Fitness criteria (currently only "coherence" is used).

    Returns:
        Fitness score from 0.0 to 1.0, where higher is better.
        Returns 0.0 if the PixelBrain service is unavailable or an error occurs.

    Example:
        >>> prompts = [
        ...     "The quick brown fox",
        ...     "Once upon a time",
        ...     "The meaning of life is"
        ... ]
        >>> score = evaluate_brain_fitness("brain.rts.png", prompts)
        >>> if score > 0.7:
        ...     print("Brain is performing well!")
    """
    try:
        from systems.evolution_daemon.brain_benchmarks import run_benchmark_suite
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

        service = get_pixel_brain_service()

        if not service.is_available():
            logger.debug("PixelBrain service not available for fitness evaluation")
            return 0.0

        # Generate completions for all test prompts
        completions = []
        for prompt in test_prompts:
            result = service.generate(prompt, max_tokens=10)
            completions.append(result.get('text', ''))

        # Run benchmark suite on completions
        results = run_benchmark_suite(completions)

        return results.get('avg_coherence', 0.0)

    except Exception as e:
        logger.error(f"Fitness evaluation failed: {e}")
        return 0.0


def register_brain_as_evolution_target() -> bool:
    """
    Register PixelBrain as an evolution target with the Evolution Daemon.

    This function connects the brain mutation capabilities to the Evolution
    Daemon, allowing it to automatically evolve the cognitive engine. Two
    mutation targets are registered:

    1. pixel_brain_weights: Mutates weight atlas sectors
    2. pixel_brain_shaders: Mutates WGSL shader code

    Returns:
        True if registration succeeded, False if the Evolution Daemon is
        not available or registration failed.

    Example:
        >>> if register_brain_as_evolution_target():
        ...     print("Brain is now evolving!")
        ... else:
        ...     print("Evolution Daemon not available")

    Note:
        This should be called during system initialization. The Evolution
        Daemon will handle the mutation schedule and fitness evaluation.
    """
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
            evaluate_fn=lambda: 0.5,  # Default fitness for shader mutations
            sector="cognitive"
        )

        logger.info("PixelBrain registered as evolution target")
        return True

    except Exception as e:
        logger.warning(f"Failed to register evolution target: {e}")
        return False
