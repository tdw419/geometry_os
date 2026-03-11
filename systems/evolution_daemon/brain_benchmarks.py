"""
Brain Fitness Benchmarks

Provides meaningful fitness evaluation functions for brain evolution.
These benchmarks assess output quality beyond simple coherence.
"""
import logging
import re

logger = logging.getLogger(__name__)


def coherence_benchmark(text: str) -> float:
    """
    Evaluate text coherence based on multiple factors.

    Factors:
    - Word diversity (vocabulary richness)
    - Sentence structure (proper punctuation)
    - Semantic flow (transition words)

    Args:
        text: Generated text to evaluate

    Returns:
        Coherence score (0-1)
    """
    if not text or len(text) < 5:
        return 0.0

    score = 0.0

    # 1. Word diversity (0-0.3)
    words = text.lower().split()
    if words:
        unique_ratio = len(set(words)) / len(words)
        score += min(0.3, unique_ratio * 0.3)

    # 2. Sentence structure (0-0.3)
    sentences = re.split(r'[.!?]+', text)
    valid_sentences = [s.strip() for s in sentences if s.strip()]
    if len(valid_sentences) > 1:
        # Check for proper capitalization
        proper_starts = sum(1 for s in valid_sentences if s[0].isupper())
        structure_score = proper_starts / len(valid_sentences) * 0.3
        score += min(0.3, structure_score)
    elif len(valid_sentences) == 1:
        score += 0.1  # Single sentence is okay but not ideal

    # 3. Transition words (0-0.2)
    transitions = ['and', 'but', 'then', 'so', 'because', 'when', 'while', 'after', 'before', 'however']
    transition_count = sum(1 for t in transitions if f' {t} ' in f' {text.lower()} ')
    score += min(0.2, transition_count * 0.05)

    # 4. Length appropriateness (0-0.2)
    word_count = len(words)
    if 10 <= word_count <= 100:
        score += 0.2
    elif 5 <= word_count < 10 or 100 < word_count <= 200:
        score += 0.1

    return min(1.0, score)


def perplexity_benchmark(prompt: str, completion: str) -> float:
    """
    Estimate perplexity-like score for prompt-completion pair.

    Lower is better. Uses proxy metrics since we can't compute true perplexity
    without the full model.

    Args:
        prompt: Input prompt
        completion: Generated completion

    Returns:
        Perplexity-like score (0-1, lower is better)
    """
    if not completion:
        return 1.0  # Maximum perplexity for empty output

    score = 0.0

    # 1. Relevance: check if completion relates to prompt
    prompt_words = set(prompt.lower().split())
    completion_words = set(completion.lower().split())
    overlap = len(prompt_words & completion_words)
    relevance = overlap / max(len(prompt_words), 1)
    score += (1 - relevance) * 0.3  # Lower overlap = higher perplexity

    # 2. Repetition penalty
    completion_list = completion.lower().split()
    if len(completion_list) > 2:
        bigrams = list(zip(completion_list[:-1], completion_list[1:]))
        unique_bigrams = len(set(bigrams))
        repetition_rate = 1 - (unique_bigrams / len(bigrams))
        score += repetition_rate * 0.3

    # 3. Length appropriateness
    if len(completion_list) < 3:
        score += 0.2  # Too short
    elif len(completion_list) > 100:
        score += 0.1  # Verbose

    # 4. Coherence factor
    coherence = coherence_benchmark(completion)
    score += (1 - coherence) * 0.2

    return min(1.0, score)


def run_benchmark_suite(texts: list[str]) -> dict:
    """
    Run all benchmarks on a list of texts.

    Args:
        texts: List of generated texts

    Returns:
        Dictionary with benchmark results
    """
    results = {
        'coherence': [],
        'avg_coherence': 0.0,
    }

    for text in texts:
        results['coherence'].append(coherence_benchmark(text))

    if results['coherence']:
        results['avg_coherence'] = sum(results['coherence']) / len(results['coherence'])

    return results
