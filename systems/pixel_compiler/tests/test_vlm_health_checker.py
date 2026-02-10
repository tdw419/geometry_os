# tests/test_vlm_health_checker.py
"""
Tests for VLMHealthChecker module.

VLMHealthChecker provides health monitoring for PixelRTS cartridges using
vision-language model findings and entropy-based analysis.
"""
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Any, Optional


def test_health_checker_initialization():
    """Test that VLMHealthChecker can be initialized with an image."""
    # Create a simple test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from vlm_health_checker import VLMHealthChecker
        checker = VLMHealthChecker(temp_path)
        assert checker.image_path == temp_path
        assert checker.image is not None
        assert checker.width == 64
        assert checker.height == 64
        assert checker.baseline is None
    finally:
        Path(temp_path).unlink()


def test_health_check_without_baseline():
    """Test health check when no baseline is available."""
    from vlm_health_checker import VLMHealthChecker, HealthCheckResult

    # Create a test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        checker = VLMHealthChecker(temp_path)
        result = checker.health_check()

        # Should return a HealthCheckResult
        assert isinstance(result, HealthCheckResult)
        assert result.is_healthy is True  # No baseline means no comparison, assume healthy
        assert result.anomalies == []
        assert result.entropy_diff is None
        assert result.edge_density_diff is None
    finally:
        Path(temp_path).unlink()


def test_health_check_with_corruption():
    """Test that health check detects corruption compared to baseline."""
    from vlm_health_checker import VLMHealthChecker, HealthCheckResult, AnomalyType

    # Create baseline image (clean pattern)
    baseline_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Create a gradient pattern
    for i in range(64):
        baseline_array[i, :, :] = [i * 4, 128, 64, 255]
    baseline_img = Image.fromarray(baseline_array, 'RGBA')

    # Create corrupted image (same pattern with noise)
    corrupted_array = baseline_array.copy()
    np.random.seed(42)
    noise = np.random.randint(-50, 50, (64, 64, 4), dtype=np.int16)
    corrupted_array = np.clip(corrupted_array.astype(np.int16) + noise, 0, 255).astype(np.uint8)
    corrupted_img = Image.fromarray(corrupted_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        baseline_img.save(f)
        baseline_path = f.name

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        corrupted_img.save(f)
        corrupted_path = f.name

    try:
        # First establish baseline
        baseline_checker = VLMHealthChecker(baseline_path)
        baseline_result = baseline_checker.health_check()

        # Then check corrupted image against baseline
        checker = VLMHealthChecker(corrupted_path, baseline=baseline_result)
        result = checker.health_check()

        assert isinstance(result, HealthCheckResult)
        # Corrupted image should be detected as unhealthy
        assert result.is_healthy is False
        assert len(result.anomalies) > 0
        # Should have entropy and edge density differences
        assert result.entropy_diff is not None
        assert result.edge_density_diff is not None
    finally:
        Path(baseline_path).unlink()
        Path(corrupted_path).unlink()


def test_parse_vlm_findings_for_anomalies():
    """Test parsing VLM findings to detect anomalies."""
    from vlm_health_checker import VLMHealthChecker, AnomalyType

    # Create a test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        checker = VLMHealthChecker(temp_path)

        # Simulate VLM findings with various issues
        vlm_findings = {
            "corruption_detected": True,
            "unexpected_patterns": ["artifacts in top-left", "color bleeding"],
            "missing_regions": [(10, 10, 20, 20)],
            "structural_damage": ["edge fragmentation at row 30-35"]
        }

        anomalies = checker.parse_vlm_findings_for_anomalies(vlm_findings)

        assert len(anomalies) > 0
        # Check that we have different types of anomalies
        anomaly_types = {a.type for a in anomalies}
        assert AnomalyType.CORRUPTION in anomaly_types
        assert AnomalyType.PATTERN in anomaly_types
    finally:
        Path(temp_path).unlink()


def test_generate_healing_recommendation():
    """Test generation of healing recommendations based on anomalies."""
    from vlm_health_checker import VLMHealthChecker, Anomaly, AnomalyType

    # Create a test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        checker = VLMHealthChecker(temp_path)

        # Create test anomalies
        anomalies = [
            Anomaly(
                type=AnomalyType.CORRUPTION,
                location="top-left",
                severity="high",
                description="Bit corruption detected in header region"
            ),
            Anomaly(
                type=AnomalyType.PATTERN,
                location="center",
                severity="medium",
                description="Unexpected color gradient deviation"
            )
        ]

        recommendation = checker.generate_healing_recommendation(anomalies)

        assert isinstance(recommendation, dict)
        assert "action" in recommendation
        assert "priority" in recommendation
        assert "steps" in recommendation
        assert isinstance(recommendation["steps"], list)
        assert len(recommendation["steps"]) > 0
        # High severity should result in high priority
        assert recommendation["priority"] in ("low", "medium", "high")
    finally:
        Path(temp_path).unlink()


def test_entropy_based_health_check():
    """Test entropy-based health detection."""
    from vlm_health_checker import VLMHealthChecker

    # Create a low-entropy image (uniform pattern)
    uniform_array = np.zeros((64, 64, 4), dtype=np.uint8)
    uniform_array[:, :] = [128, 128, 128, 255]
    uniform_img = Image.fromarray(uniform_array, 'RGBA')

    # Create a high-entropy image (random noise)
    np.random.seed(42)
    noise_array = np.random.randint(0, 256, (64, 64, 4), dtype=np.uint8)
    noise_img = Image.fromarray(noise_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        uniform_img.save(f)
        uniform_path = f.name

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        noise_img.save(f)
        noise_path = f.name

    try:
        # Check uniform image
        uniform_checker = VLMHealthChecker(uniform_path)
        uniform_entropy = uniform_checker.calculate_entropy()

        # Check noise image
        noise_checker = VLMHealthChecker(noise_path)
        noise_entropy = noise_checker.calculate_entropy()

        # Noise should have higher entropy
        assert noise_entropy > uniform_entropy
        # Uniform image should have very low entropy
        assert uniform_entropy < 1.0
    finally:
        Path(uniform_path).unlink()
        Path(noise_path).unlink()
