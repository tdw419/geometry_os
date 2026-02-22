# vlm_health_checker.py
"""
VLMHealthChecker - Health Monitoring for PixelRTS Cartridges

Provides health monitoring for PixelRTS cartridges using vision-language
model findings and entropy-based analysis. Detects corruption, pattern
anomalies, and provides healing recommendations.

Features:
- Entropy-based health detection
- Edge density analysis
- VLM findings parsing for anomaly detection
- Healing recommendation generation
- Baseline comparison for integrity verification
"""
import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass, field
from enum import Enum

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "VLMHealthChecker requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )

try:
    import cv2
except ImportError:
    raise ImportError(
        "VLMHealthChecker requires OpenCV. "
        "Install with: pip install opencv-python"
    )


class AnomalyType(Enum):
    """Types of anomalies that can be detected in PixelRTS cartridges."""
    CORRUPTION = "corruption"
    PATTERN = "pattern"
    STRUCTURAL = "structural"
    ENTROPY = "entropy"
    MISSING_REGION = "missing_region"
    COLOR_SHIFT = "color_shift"


@dataclass
class Anomaly:
    """Represents a detected anomaly in a PixelRTS cartridge."""
    type: AnomalyType
    location: str
    severity: str  # "low", "medium", "high"
    description: str
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class HealthCheckResult:
    """Result of a health check on a PixelRTS cartridge."""
    is_healthy: bool
    anomalies: List[Anomaly]
    entropy: float
    edge_density: float
    entropy_diff: Optional[float] = None  # Difference from baseline
    edge_density_diff: Optional[float] = None  # Difference from baseline
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class HealingRecommendation:
    """Recommendation for healing a detected anomaly."""
    action: str
    priority: str  # "low", "medium", "high"
    steps: List[str]
    success_probability: float
    metadata: Dict[str, Any] = field(default_factory=dict)


class VLMHealthChecker:
    """
    Health checker for PixelRTS cartridges using VLM findings.

    Combines entropy analysis, edge detection, and VLM-based pattern
    recognition to detect and diagnose issues with PixelRTS cartridges.
    """

    # Thresholds for health detection
    DEFAULT_ENTROPY_THRESHOLD = 0.3  # Relative difference threshold
    DEFAULT_EDGE_DENSITY_THRESHOLD = 0.2  # Relative difference threshold

    def __init__(
        self,
        image_path: str,
        baseline: Optional[HealthCheckResult] = None,
        entropy_threshold: float = DEFAULT_ENTROPY_THRESHOLD,
        edge_density_threshold: float = DEFAULT_EDGE_DENSITY_THRESHOLD
    ):
        """
        Initialize VLMHealthChecker with an image.

        Args:
            image_path: Path to PNG image file
            baseline: Optional baseline HealthCheckResult for comparison
            entropy_threshold: Threshold for entropy difference (0-1)
            edge_density_threshold: Threshold for edge density difference (0-1)
        """
        self.image_path = image_path
        self.baseline = baseline
        self.entropy_threshold = entropy_threshold
        self.edge_density_threshold = edge_density_threshold

        # Load image
        self._load_image()

    def _load_image(self):
        """Load the image for analysis."""
        pil_image = Image.open(self.image_path)

        # Ensure RGBA
        if pil_image.mode != 'RGBA':
            pil_image = pil_image.convert('RGBA')

        self.image = np.array(pil_image)
        self.height, self.width = self.image.shape[:2]

        # Convert to grayscale for analysis
        if len(self.image.shape) == 3:
            self.grayscale = cv2.cvtColor(
                self.image[:, :, :3],
                cv2.COLOR_RGB2GRAY
            )
        else:
            self.grayscale = self.image

    def calculate_entropy(self, image: Optional[np.ndarray] = None) -> float:
        """
        Calculate Shannon entropy of the image.

        Args:
            image: Optional image array (uses self.grayscale if None)

        Returns:
            Entropy value in bits per pixel
        """
        if image is None:
            image = self.grayscale

        # Calculate histogram
        hist = cv2.calcHist([image], [0], None, [256], [0, 256])
        hist = hist.flatten() / hist.sum()

        # Remove zero probabilities
        hist = hist[hist > 0]

        # Calculate entropy
        entropy = -np.sum(hist * np.log2(hist))

        return float(entropy)

    def calculate_edge_density(self) -> float:
        """
        Calculate edge density using Sobel operator.

        Returns:
            Edge density (proportion of edge pixels)
        """
        # Apply Sobel operators
        sobel_x = cv2.Sobel(self.grayscale, cv2.CV_64F, 1, 0, ksize=3)
        sobel_y = cv2.Sobel(self.grayscale, cv2.CV_64F, 0, 1, ksize=3)

        # Calculate gradient magnitude
        gradient_magnitude = np.sqrt(sobel_x**2 + sobel_y**2)

        # Normalize to 0-255 range
        gradient_magnitude = np.clip(gradient_magnitude, 0, 255).astype(np.uint8)

        # Count edge pixels (above threshold)
        threshold = np.mean(gradient_magnitude) + np.std(gradient_magnitude)
        edge_pixels = np.sum(gradient_magnitude > threshold)
        edge_density = edge_pixels / (self.width * self.height)

        return float(edge_density)

    def health_check(self) -> HealthCheckResult:
        """
        Perform health check on the PixelRTS cartridge.

        Returns:
            HealthCheckResult with health status and any detected anomalies
        """
        # Calculate metrics
        entropy = self.calculate_entropy()
        edge_density = self.calculate_edge_density()

        anomalies = []
        entropy_diff = None
        edge_density_diff = None

        if self.baseline is not None:
            # Compare against baseline
            entropy_diff = abs(entropy - self.baseline.entropy)
            edge_density_diff = abs(edge_density - self.baseline.edge_density)

            # Normalize differences
            if self.baseline.entropy > 0:
                entropy_diff_ratio = entropy_diff / self.baseline.entropy
            else:
                entropy_diff_ratio = entropy_diff

            if self.baseline.edge_density > 0:
                edge_density_diff_ratio = edge_density_diff / self.baseline.edge_density
            else:
                edge_density_diff_ratio = edge_density_diff

            # Check for anomalies
            if entropy_diff_ratio > self.entropy_threshold:
                anomalies.append(Anomaly(
                    type=AnomalyType.ENTROPY,
                    location="global",
                    severity="high" if entropy_diff_ratio > self.entropy_threshold * 2 else "medium",
                    description=f"Entropy deviation detected: {entropy_diff_ratio:.2%} difference",
                    metadata={"entropy_diff": entropy_diff, "ratio": entropy_diff_ratio}
                ))

            if edge_density_diff_ratio > self.edge_density_threshold:
                anomalies.append(Anomaly(
                    type=AnomalyType.STRUCTURAL,
                    location="global",
                    severity="high" if edge_density_diff_ratio > self.edge_density_threshold * 2 else "medium",
                    description=f"Edge density deviation detected: {edge_density_diff_ratio:.2%} difference",
                    metadata={"edge_density_diff": edge_density_diff, "ratio": edge_density_diff_ratio}
                ))

        # Determine health status
        is_healthy = len(anomalies) == 0

        return HealthCheckResult(
            is_healthy=is_healthy,
            anomalies=anomalies,
            entropy=entropy,
            edge_density=edge_density,
            entropy_diff=entropy_diff,
            edge_density_diff=edge_density_diff,
            metadata={
                "width": self.width,
                "height": self.height,
                "has_baseline": self.baseline is not None
            }
        )

    def parse_vlm_findings_for_anomalies(
        self,
        vlm_findings: Dict[str, Any]
    ) -> List[Anomaly]:
        """
        Parse VLM (Vision-Language Model) findings to detect anomalies.

        Args:
            vlm_findings: Dictionary containing VLM analysis results

        Returns:
            List of detected Anomalies
        """
        anomalies = []

        # Check for corruption
        if vlm_findings.get("corruption_detected", False):
            anomalies.append(Anomaly(
                type=AnomalyType.CORRUPTION,
                location="global",
                severity="high",
                description="VLM detected corruption in the cartridge",
                metadata={"vlm_confidence": vlm_findings.get("confidence", 0.0)}
            ))

        # Check for unexpected patterns
        unexpected_patterns = vlm_findings.get("unexpected_patterns", [])
        for pattern in unexpected_patterns:
            anomalies.append(Anomaly(
                type=AnomalyType.PATTERN,
                location="unknown",
                severity="medium",
                description=f"Unexpected pattern: {pattern}",
                metadata={"pattern_description": pattern}
            ))

        # Check for missing regions
        missing_regions = vlm_findings.get("missing_regions", [])
        for region in missing_regions:
            if len(region) == 4:
                x, y, w, h = region
                anomalies.append(Anomaly(
                    type=AnomalyType.MISSING_REGION,
                    location=f"({x}, {y}, {w}, {h})",
                    severity="high",
                    description=f"Missing region at {region}",
                    metadata={"bbox": region}
                ))

        # Check for structural damage
        structural_damage = vlm_findings.get("structural_damage", [])
        for damage in structural_damage:
            anomalies.append(Anomaly(
                type=AnomalyType.STRUCTURAL,
                location="unknown",
                severity="high" if "fragmentation" in damage.lower() else "medium",
                description=f"Structural issue: {damage}",
                metadata={"damage_description": damage}
            ))

        # Check for color shifts
        if vlm_findings.get("color_shift_detected", False):
            anomalies.append(Anomaly(
                type=AnomalyType.COLOR_SHIFT,
                location="global",
                severity="medium",
                description="VLM detected color shift in the cartridge",
                metadata={"shift_details": vlm_findings.get("color_shift_details", {})}
            ))

        return anomalies

    def generate_healing_recommendation(
        self,
        anomalies: List[Anomaly]
    ) -> Dict[str, Any]:
        """
        Generate healing recommendations based on detected anomalies.

        Args:
            anomalies: List of detected Anomalies

        Returns:
            Dictionary with healing recommendation (action, priority, steps)
        """
        if not anomalies:
            return {
                "action": "none",
                "priority": "low",
                "steps": ["No healing required - cartridge is healthy"],
                "success_probability": 1.0
            }

        # Determine overall severity
        high_severity = any(a.severity == "high" for a in anomalies)
        medium_severity = any(a.severity == "medium" for a in anomalies)

        if high_severity:
            priority = "high"
            success_probability = 0.6
        elif medium_severity:
            priority = "medium"
            success_probability = 0.8
        else:
            priority = "low"
            success_probability = 0.9

        # Group anomalies by type
        anomaly_types = {a.type for a in anomalies}

        # Generate steps based on anomaly types
        steps = []

        if AnomalyType.CORRUPTION in anomaly_types:
            steps.append("Restore from backup or reconstruct from metadata")
            steps.append("Verify checksum integrity after restoration")

        if AnomalyType.PATTERN in anomaly_types:
            steps.append("Apply pattern correction using Hilbert curve validation")
            steps.append("Re-encode affected regions with proper spatial mapping")

        if AnomalyType.STRUCTURAL in anomaly_types:
            steps.append("Repair structural damage using edge-aware interpolation")
            steps.append("Validate repaired regions against expected format")

        if AnomalyType.MISSING_REGION in anomaly_types:
            steps.append("Reconstruct missing regions from neighboring data")
            steps.append("Cross-reference with metadata if available")

        if AnomalyType.ENTROPY in anomaly_types:
            steps.append("Analyze entropy deviation source (compression vs corruption)")
            steps.append("Apply entropy normalization if appropriate")

        if AnomalyType.COLOR_SHIFT in anomaly_types:
            steps.append("Correct color shift using histogram matching")
            steps.append("Validate color integrity after correction")

        # Add general steps
        steps.append("Run full health check after healing")
        steps.append("Update baseline if healing successful")

        # Determine action
        if AnomalyType.CORRUPTION in anomaly_types or AnomalyType.MISSING_REGION in anomaly_types:
            action = "restore"
        elif AnomalyType.STRUCTURAL in anomaly_types:
            action = "repair"
        elif AnomalyType.PATTERN in anomaly_types or AnomalyType.COLOR_SHIFT in anomaly_types:
            action = "correct"
        elif AnomalyType.ENTROPY in anomaly_types:
            action = "analyze"
        else:
            action = "investigate"

        return {
            "action": action,
            "priority": priority,
            "steps": steps,
            "success_probability": success_probability,
            "anomaly_count": len(anomalies),
            "anomaly_types": [a.value for a in anomaly_types]
        }
