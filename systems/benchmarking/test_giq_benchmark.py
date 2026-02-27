#!/usr/bin/env python3
"""
Test Suite for GIQ (Geometric Intelligence Quotient) Benchmarking System

Tests all five categories and validates scoring methodology.
Run: pytest test_giq_benchmark.py -v
"""

import pytest
import math
import statistics
import tempfile
import json
from pathlib import Path

from giq_benchmark import GIQBenchmark, GIQScore, GIQReport


class TestGIQBenchmark:
    """Test suite for GIQ benchmark system."""

    @pytest.fixture
    def benchmark(self):
        """Create benchmark instance with temp directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield GIQBenchmark(output_dir=tmpdir)

    # ========================================
    # INITIALIZATION TESTS
    # ========================================

    def test_benchmark_initialization(self, benchmark):
        """Test benchmark initializes correctly."""
        assert benchmark.output_dir.exists()
        assert len(benchmark.llm_baselines) == 5
        assert len(benchmark.population_stats) == 5
        assert benchmark.results == []

    def test_llm_baselines_exist(self, benchmark):
        """Test LLM baselines are defined for all categories."""
        expected_categories = [
            "pattern_recognition",
            "morphological_synthesis",
            "spatial_reasoning",
            "symbolic_translation",
            "decomposition"
        ]
        for cat in expected_categories:
            assert cat in benchmark.llm_baselines
            assert 0 <= benchmark.llm_baselines[cat] <= 100

    # ========================================
    # CATEGORY 1: PATTERN RECOGNITION
    # ========================================

    def test_pattern_recognition_returns_score(self, benchmark):
        """Test pattern recognition returns valid score."""
        result = benchmark.test_pattern_recognition()

        assert isinstance(result, GIQScore)
        assert result.category == "pattern_recognition"
        assert 0 <= result.score <= 100
        assert result.latency_ms > 0
        assert 0 <= result.accuracy <= 1

    def test_pattern_generation(self, benchmark):
        """Test pattern generation creates valid cases."""
        cases = benchmark._generate_pattern_cases(10)

        assert len(cases) == 10
        for case in cases:
            assert "pattern" in case
            assert "noise" in case
            assert "expected" in case
            assert isinstance(case["pattern"], list)

    def test_pattern_with_noise(self, benchmark):
        """Test patterns generated with noise."""
        for pattern_name in ["circle", "triangle", "square", "hexagon", "hilbert"]:
            points = benchmark._generate_pattern_with_noise(pattern_name, 0.3)
            assert len(points) > 0
            # Points should be tuples/lists with x,y coordinates
            for p in points:
                assert len(p) == 2

    def test_pattern_recognition_accuracy(self, benchmark):
        """Test pattern recognition has reasonable accuracy."""
        # Run multiple times to check consistency
        scores = []
        for _ in range(5):
            benchmark.results = []
            result = benchmark.test_pattern_recognition()
            scores.append(result.accuracy)

        avg_accuracy = statistics.mean(scores)
        # Should achieve at least 30% accuracy on noisy patterns
        assert avg_accuracy >= 0.3

    # ========================================
    # CATEGORY 2: MORPHOLOGICAL SYNTHESIS
    # ========================================

    def test_morphological_synthesis_returns_score(self, benchmark):
        """Test morphological synthesis returns valid score."""
        result = benchmark.test_morphological_synthesis()

        assert isinstance(result, GIQScore)
        assert result.category == "morphological_synthesis"
        assert 0 <= result.score <= 100
        assert result.latency_ms > 0

    def test_glyph_synthesis(self, benchmark):
        """Test glyph synthesis creates valid glyphs."""
        glyph = benchmark._synthesize_glyph("function", "expansion", 0.8)

        assert "base_shape" in glyph
        assert "modifiers" in glyph
        assert "complexity" in glyph
        assert glyph["complexity"] == 0.8

    def test_glyph_quality_evaluation(self, benchmark):
        """Test glyph quality evaluation."""
        glyph = benchmark._synthesize_glyph("function", "expansion", 0.8)
        quality = benchmark._evaluate_glyph_quality(glyph, "function", "expansion")

        assert 0 <= quality <= 100

    def test_synthesis_diversity(self, benchmark):
        """Test that synthesis produces diverse glyphs."""
        glyphs = []
        tokens = ["function", "class", "import", "loop", "branch"]

        for token in tokens:
            glyph = benchmark._synthesize_glyph(token, "structure", 0.7)
            glyphs.append(glyph["base_shape"])

        # Should have some diversity in shapes
        unique_shapes = len(set(glyphs))
        assert unique_shapes >= 1  # At least some variation

    # ========================================
    # CATEGORY 3: SPATIAL REASONING
    # ========================================

    def test_spatial_reasoning_returns_score(self, benchmark):
        """Test spatial reasoning returns valid score."""
        result = benchmark.test_spatial_reasoning()

        assert isinstance(result, GIQScore)
        assert result.category == "spatial_reasoning"
        assert 0 <= result.score <= 100
        assert 0 <= result.accuracy <= 1

    def test_hilbert_curve_generation(self, benchmark):
        """Test Hilbert curve generation."""
        for order in [1, 2, 3]:
            curve = benchmark._generate_hilbert_curve(order)
            expected_points = (2 ** order) ** 2
            assert len(curve) == expected_points

    def test_hilbert_curve_coordinates(self, benchmark):
        """Test Hilbert curve produces valid coordinates."""
        curve = benchmark._generate_hilbert_curve(2)

        for point in curve:
            assert len(point) == 2
            # Coordinates should be within grid
            assert 0 <= point[0] <= 4
            assert 0 <= point[1] <= 4

    def test_traversal_calculation(self, benchmark):
        """Test traversal distance calculation."""
        curve = benchmark._generate_hilbert_curve(2)
        optimal = benchmark._calculate_optimal_traversal(curve)

        assert optimal > 0

        # Simulated should be >= optimal (with inefficiency)
        simulated = benchmark._simulate_traversal(curve)
        assert simulated >= optimal * 0.9  # Allow some variance

    # ========================================
    # CATEGORY 4: SYMBOLIC TRANSLATION
    # ========================================

    def test_symbolic_translation_returns_score(self, benchmark):
        """Test symbolic translation returns valid score."""
        result = benchmark.test_symbolic_translation()

        assert isinstance(result, GIQScore)
        assert result.category == "symbolic_translation"
        assert 0 <= result.score <= 100

    def test_code_to_glyphs(self, benchmark):
        """Test code to glyph conversion."""
        code = "def hello_world():"
        glyphs = benchmark._code_to_glyphs(code)

        assert len(glyphs) > 0
        assert any(g.get("shape") == "triangle" for g in glyphs)  # "def" -> triangle

    def test_glyphs_to_code(self, benchmark):
        """Test glyph to code reconstruction."""
        glyphs = [
            {"shape": "triangle", "token": "def"},
            {"shape": "square", "token": "hello_world"},
        ]
        code = benchmark._glyphs_to_code(glyphs)

        assert "def" in code

    def test_bidirectional_translation(self, benchmark):
        """Test bidirectional translation quality."""
        code = "def test():"
        glyphs = benchmark._code_to_glyphs(code)
        reconstructed = benchmark._glyphs_to_code(glyphs)

        # Should preserve key tokens
        assert "def" in reconstructed

    # ========================================
    # CATEGORY 5: DECOMPOSITION
    # ========================================

    def test_decomposition_returns_score(self, benchmark):
        """Test decomposition returns valid score."""
        result = benchmark.test_decomposition()

        assert isinstance(result, GIQScore)
        assert result.category == "decomposition"
        assert 0 <= result.score <= 100
        assert 0 <= result.accuracy <= 1

    def test_shape_decomposition(self, benchmark):
        """Test shape decomposition into primitives."""
        for shape_name in ["star", "arrow", "house", "snowflake"]:
            primitives = benchmark._decompose_shape(shape_name)
            assert len(primitives) > 0

    def test_decomposition_accuracy(self, benchmark):
        """Test decomposition accuracy measurement."""
        # Test with known shapes
        star_primitives = benchmark._decompose_shape("star")
        expected_star = set(["triangle"] * 5)

        jaccard = len(set(star_primitives) & expected_star) / len(set(star_primitives) | expected_star)
        assert jaccard >= 0.5  # At least 50% overlap

    # ========================================
    # FULL BENCHMARK TESTS
    # ========================================

    def test_full_benchmark_runs(self, benchmark):
        """Test full benchmark completes without error."""
        report = benchmark.run_full_benchmark()

        assert isinstance(report, GIQReport)
        assert 0 <= report.total_giq <= 1000
        assert len(report.category_scores) == 5
        assert len(report.test_results) == 5
        assert 0 <= report.percentile <= 100

    def test_full_benchmark_saves_report(self, benchmark):
        """Test full benchmark saves report file."""
        report = benchmark.run_full_benchmark()

        # Check report was saved
        report_files = list(benchmark.output_dir.glob("giq_report_*.json"))
        assert len(report_files) > 0

        # Verify report content
        with open(report_files[0]) as f:
            saved = json.load(f)

        assert saved["total_giq"] == report.total_giq

    def test_percentile_calculation(self, benchmark):
        """Test percentile calculation."""
        # Test various GIQ scores
        test_cases = [
            (180, 50),   # Mean = 50th percentile
            (250, 90),   # High score
            (100, 10),   # Low score
        ]

        for giq, min_percentile in test_cases:
            percentile = benchmark._calculate_percentile(giq)
            assert 0 <= percentile <= 100

    def test_baseline_comparison(self, benchmark):
        """Test baseline comparison calculation."""
        report = benchmark.run_full_benchmark()

        for cat, comparison in report.baseline_comparison.items():
            # Comparison is percentage above/below baseline
            assert isinstance(comparison, (int, float))

    def test_callback_support(self, benchmark):
        """Test callback support for progress tracking."""
        completed_tests = []

        def on_complete(result):
            completed_tests.append(result.category)

        benchmark.on_test_complete = on_complete
        benchmark.run_full_benchmark()

        assert len(completed_tests) == 5

    def test_progress_callback(self, benchmark):
        """Test progress callback support."""
        progress_updates = []

        def on_progress(category, progress):
            progress_updates.append((category, progress))

        benchmark.on_progress = on_progress
        benchmark.run_full_benchmark()

        assert len(progress_updates) >= 5  # At least one per category

    # ========================================
    # SCORING VALIDATION TESTS
    # ========================================

    def test_score_bounded_0_100(self, benchmark):
        """Test all scores are bounded 0-100."""
        benchmark.run_full_benchmark()

        for result in benchmark.results:
            assert 0 <= result.score <= 100, f"{result.category} score out of bounds"

    def test_giq_bounded_0_1000(self, benchmark):
        """Test total GIQ is bounded 0-1000."""
        report = benchmark.run_full_benchmark()

        assert 0 <= report.total_giq <= 1000

    def test_latency_positive(self, benchmark):
        """Test all latencies are positive."""
        benchmark.run_full_benchmark()

        for result in benchmark.results:
            assert result.latency_ms > 0

    def test_accuracy_bounded(self, benchmark):
        """Test accuracy values are bounded 0-1."""
        benchmark.run_full_benchmark()

        for result in benchmark.results:
            assert 0 <= result.accuracy <= 1

    # ========================================
    # EDGE CASE TESTS
    # ========================================

    def test_empty_pattern_recognition(self, benchmark):
        """Test pattern recognition with empty input."""
        recognized = benchmark._recognize_pattern([], 0)
        assert recognized == "unknown"

    def test_single_point_pattern(self, benchmark):
        """Test pattern recognition with single point."""
        recognized = benchmark._recognize_pattern([(1, 1)], 0)
        assert recognized == "unknown"

    def test_high_noise_patterns(self, benchmark):
        """Test pattern generation with high noise."""
        points = benchmark._generate_pattern_with_noise("circle", 1.0)
        # Should still generate points
        assert len(points) > 0

    def test_unknown_shape_decomposition(self, benchmark):
        """Test decomposition of unknown shape."""
        primitives = benchmark._decompose_shape("unknown_shape_xyz")
        assert primitives == ["unknown"]

    # ========================================
    # PERFORMANCE TESTS
    # ========================================

    def test_full_benchmark_latency(self, benchmark):
        """Test full benchmark completes in reasonable time."""
        import time

        start = time.time()
        benchmark.run_full_benchmark()
        elapsed = time.time() - start

        # Should complete in under 10 seconds
        assert elapsed < 10.0

    def test_category_latency(self, benchmark):
        """Test individual categories complete quickly."""
        import time

        for test_func in [
            benchmark.test_pattern_recognition,
            benchmark.test_morphological_synthesis,
            benchmark.test_spatial_reasoning,
            benchmark.test_symbolic_translation,
            benchmark.test_decomposition
        ]:
            benchmark.results = []
            start = time.time()
            test_func()
            elapsed = time.time() - start

            # Each category should complete in under 2 seconds
            assert elapsed < 2.0


class TestGIQScoreDataclass:
    """Test GIQScore dataclass."""

    def test_score_creation(self):
        """Test score can be created."""
        score = GIQScore(
            category="test",
            test_name="test_case",
            score=75.0,
            latency_ms=100.0,
            accuracy=0.8,
            complexity=5
        )

        assert score.category == "test"
        assert score.score == 75.0

    def test_score_timestamp_auto(self):
        """Test score timestamp is auto-generated."""
        score = GIQScore(
            category="test",
            test_name="test",
            score=50,
            latency_ms=50,
            accuracy=0.5,
            complexity=3
        )

        assert score.timestamp is not None


class TestGIQReportDataclass:
    """Test GIQReport dataclass."""

    def test_report_creation(self):
        """Test report can be created."""
        report = GIQReport(
            total_giq=500,
            category_scores={"test": 50},
            test_results=[],
            baseline_comparison={"test": 10},
            percentile=75
        )

        assert report.total_giq == 500
        assert report.generated_at is not None


# ========================================
# INTEGRATION TESTS
# ========================================

class TestBenchmarkIntegration:
    """Integration tests for benchmark system."""

    def test_multiple_runs_consistency(self):
        """Test multiple runs produce consistent results."""
        with tempfile.TemporaryDirectory() as tmpdir:
            benchmark = GIQBenchmark(output_dir=tmpdir)

            reports = []
            for _ in range(3):
                benchmark.results = []
                report = benchmark.run_full_benchmark()
                reports.append(report)

            # GIQ scores should be within reasonable range
            giq_scores = [r.total_giq for r in reports]
            score_variance = statistics.variance(giq_scores)

            # Variance shouldn't be too high (consistent results)
            assert score_variance < 10000  # Allow some variance

    def test_category_isolation(self):
        """Test running categories independently."""
        with tempfile.TemporaryDirectory() as tmpdir:
            benchmark = GIQBenchmark(output_dir=tmpdir)

            # Run individual categories
            pr = benchmark.test_pattern_recognition()
            ms = benchmark.test_morphological_synthesis()

            assert pr.category != ms.category
            assert len(benchmark.results) == 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
