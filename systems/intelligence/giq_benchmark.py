#!/usr/bin/env python3
"""
Geometry OS: GIQ Benchmark Framework

Geometric Intelligence Quotient (GIQ) benchmarks for measuring
geometric reasoning capabilities.

Benchmark Categories:
1. Spatial Transformation - Rotation, translation, scaling
2. Pattern Recognition - Symmetry, tessellation detection
3. Topology Understanding - Connectivity, genus, Euler characteristic
4. Symmetry Detection - Reflection, rotation, translation symmetry

Usage:
    python3 giq_benchmark.py --run-all
    python3 giq_benchmark.py --category spatial
    python3 giq_benchmark.py --test rotation_90
"""

import argparse
import json
import math
import random
import time
from dataclasses import dataclass, field, asdict
from typing import List, Dict, Tuple, Optional, Callable, Any
from pathlib import Path
from datetime import datetime
from enum import Enum


class BenchmarkCategory(Enum):
    SPATIAL = "spatial"
    PATTERN = "pattern"
    TOPOLOGY = "topology"
    SYMMETRY = "symmetry"


@dataclass
class BenchmarkResult:
    """Result of a single benchmark test."""
    test_id: str
    category: str
    passed: bool
    score: float  # 0.0 to 1.0
    time_ms: float
    details: Dict[str, Any] = field(default_factory=dict)
    error: Optional[str] = None


@dataclass
class BenchmarkSuite:
    """Collection of benchmark results."""
    timestamp: str
    total_tests: int
    passed: int
    failed: int
    total_score: float
    category_scores: Dict[str, float]
    results: List[BenchmarkResult]
    giq_score: float  # Overall GIQ (0-100)


class SpatialTransforms:
    """Spatial transformation benchmarks."""

    @staticmethod
    def rotation_90(points: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
        """Rotate points 90 degrees counterclockwise around origin."""
        return [(-y, x) for x, y in points]

    @staticmethod
    def rotation_180(points: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
        """Rotate points 180 degrees around origin."""
        return [(-x, -y) for x, y in points]

    @staticmethod
    def rotation_arbitrary(points: List[Tuple[float, float]], angle_deg: float) -> List[Tuple[float, float]]:
        """Rotate points by arbitrary angle."""
        rad = math.radians(angle_deg)
        cos_a, sin_a = math.cos(rad), math.sin(rad)
        return [(x * cos_a - y * sin_a, x * sin_a + y * cos_a) for x, y in points]

    @staticmethod
    def scale(points: List[Tuple[float, float]], sx: float, sy: float) -> List[Tuple[float, float]]:
        """Scale points by factors sx, sy."""
        return [(x * sx, y * sy) for x, y in points]

    @staticmethod
    def translate(points: List[Tuple[float, float]], dx: float, dy: float) -> List[Tuple[float, float]]:
        """Translate points by dx, dy."""
        return [(x + dx, y + dy) for x, y in points]

    @staticmethod
    def reflect_x(points: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
        """Reflect points across x-axis."""
        return [(x, -y) for x, y in points]

    @staticmethod
    def reflect_y(points: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
        """Reflect points across y-axis."""
        return [(-x, y) for x, y in points]

    @staticmethod
    def compose_transforms(points: List[Tuple[float, float]],
                          transforms: List[Tuple[str, Any]]) -> List[Tuple[float, float]]:
        """Apply multiple transforms in sequence."""
        result = points
        for t_type, t_params in transforms:
            if t_type == 'rotate':
                result = SpatialTransforms.rotation_arbitrary(result, t_params)
            elif t_type == 'scale':
                result = SpatialTransforms.scale(result, *t_params)
            elif t_type == 'translate':
                result = SpatialTransforms.translate(result, *t_params)
            elif t_type == 'reflect_x':
                result = SpatialTransforms.reflect_x(result)
            elif t_type == 'reflect_y':
                result = SpatialTransforms.reflect_y(result)
        return result


class PatternRecognition:
    """Pattern recognition benchmarks."""

    @staticmethod
    def detect_symmetry_axis(points: List[Tuple[float, float]]) -> List[float]:
        """Detect axes of reflection symmetry."""
        if len(points) < 2:
            return []

        axes = []
        xs = [p[0] for p in points]
        ys = [p[1] for p in points]

        # Check vertical symmetry (x = constant)
        x_mid = (min(xs) + max(xs)) / 2
        if PatternRecognition._check_vertical_symmetry(points, x_mid):
            axes.append(x_mid)

        # Check horizontal symmetry (y = constant)
        y_mid = (min(ys) + max(ys)) / 2
        if PatternRecognition._check_horizontal_symmetry(points, y_mid):
            axes.append(y_mid)

        return axes

    @staticmethod
    def _check_vertical_symmetry(points: List[Tuple[float, float]], axis_x: float, tolerance: float = 0.01) -> bool:
        """Check if points are symmetric about vertical axis."""
        reflected = [(2 * axis_x - x, y) for x, y in points]
        return PatternRecognition._point_sets_match(points, reflected, tolerance)

    @staticmethod
    def _check_horizontal_symmetry(points: List[Tuple[float, float]], axis_y: float, tolerance: float = 0.01) -> bool:
        """Check if points are symmetric about horizontal axis."""
        reflected = [(x, 2 * axis_y - y) for x, y in points]
        return PatternRecognition._point_sets_match(points, reflected, tolerance)

    @staticmethod
    def _point_sets_match(set1: List[Tuple[float, float]], set2: List[Tuple[float, float]], tolerance: float) -> bool:
        """Check if two point sets match within tolerance."""
        if len(set1) != len(set2):
            return False

        for p1 in set1:
            if not any(abs(p1[0] - p2[0]) < tolerance and abs(p1[1] - p2[1]) < tolerance for p2 in set2):
                return False
        return True

    @staticmethod
    def detect_rotation_symmetry(points: List[Tuple[float, float]]) -> List[int]:
        """Detect rotation symmetry orders (2, 3, 4, 6)."""
        orders = []

        for order in [2, 3, 4, 6]:
            if PatternRecognition._check_rotation_symmetry(points, order):
                orders.append(order)

        return orders

    @staticmethod
    def _check_rotation_symmetry(points: List[Tuple[float, float]], order: int, tolerance: float = 0.01) -> bool:
        """Check if points have n-fold rotational symmetry."""
        angle = 360 / order
        rotated = SpatialTransforms.rotation_arbitrary(points, angle)
        return PatternRecognition._point_sets_match(points, rotated, tolerance)

    @staticmethod
    def classify_tessellation(points: List[Tuple[float, float]]) -> str:
        """Classify tessellation pattern type."""
        if len(points) < 4:
            return "insufficient"

        # Check for regular patterns
        xs = sorted(set(round(p[0], 1) for p in points))
        ys = sorted(set(round(p[1], 1) for p in points))

        # Check square grid
        if len(xs) > 1 and len(ys) > 1:
            x_spacing = xs[1] - xs[0]
            y_spacing = ys[1] - ys[0]
            if abs(x_spacing - y_spacing) < 0.1:
                return "square"
            elif abs(x_spacing - y_spacing * math.sqrt(3)) < 0.1:
                return "hexagonal"
            else:
                return "rectangular"

        return "irregular"


class TopologyAnalysis:
    """Topology understanding benchmarks."""

    @staticmethod
    def compute_euler_characteristic(vertices: int, edges: int, faces: int) -> int:
        """Compute Euler characteristic: V - E + F."""
        return vertices - edges + faces

    @staticmethod
    def classify_surface(euler: int) -> str:
        """Classify surface type from Euler characteristic."""
        if euler == 2:
            return "sphere"
        elif euler == 0:
            return "torus"
        elif euler == -2:
            return "double_torus"
        elif euler < -2:
            return f"genus_{(-euler // 2 + 1)}_surface"
        else:
            return "unknown"

    @staticmethod
    def compute_genus(euler: int) -> int:
        """Compute genus from Euler characteristic."""
        return (2 - euler) // 2

    @staticmethod
    def check_connectivity(graph: Dict[int, List[int]]) -> int:
        """Count connected components in graph."""
        visited = set()
        components = 0

        for node in graph:
            if node not in visited:
                components += 1
                TopologyAnalysis._dfs(graph, node, visited)

        return components

    @staticmethod
    def _dfs(graph: Dict[int, List[int]], node: int, visited: set):
        """Depth-first search helper."""
        visited.add(node)
        for neighbor in graph.get(node, []):
            if neighbor not in visited:
                TopologyAnalysis._dfs(graph, neighbor, visited)

    @staticmethod
    def detect_holes(ring_points: List[List[Tuple[float, float]]]) -> int:
        """Count holes in a shape defined by rings."""
        # Using even-odd rule: exterior ring + interior rings = holes
        return max(0, len(ring_points) - 1)


class SymmetryDetection:
    """Symmetry detection benchmarks."""

    @staticmethod
    def find_symmetry_group(points: List[Tuple[float, float]]) -> Dict[str, Any]:
        """Find all symmetries of a point set."""
        result = {
            'reflection_axes': [],
            'rotation_orders': [],
            'center': None,
            'has_point_symmetry': False
        }

        if len(points) < 2:
            return result

        # Find centroid
        cx = sum(p[0] for p in points) / len(points)
        cy = sum(p[1] for p in points) / len(points)
        result['center'] = (cx, cy)

        # Check reflection symmetries
        result['reflection_axes'] = PatternRecognition.detect_symmetry_axis(points)

        # Check rotation symmetries
        result['rotation_orders'] = PatternRecognition.detect_rotation_symmetry(points)

        # Check point symmetry (180° rotation)
        result['has_point_symmetry'] = 2 in result['rotation_orders']

        return result

    @staticmethod
    def classify_spatial_group(symmetries: Dict[str, Any]) -> str:
        """Classify the spatial symmetry group."""
        n_reflections = len(symmetries.get('reflection_axes', []))
        rotations = symmetries.get('rotation_orders', [])

        if not rotations and n_reflections == 0:
            return "C1"  # No symmetry

        if rotations == [2] and n_reflections == 0:
            return "C2"  # Only 2-fold rotation

        if rotations == [2] and n_reflections == 2:
            return "D2"  # 2-fold + 2 reflections

        if rotations == [2, 4] and n_reflections == 4:
            return "D4"  # Square symmetry

        if rotations == [2, 3, 6] and n_reflections == 6:
            return "D6"  # Hexagonal symmetry

        if n_reflections > 0 and not rotations:
            return "Cs"  # Only reflection

        return "Cn"  # General rotation group


class GIQBenchmark:
    """Main benchmark runner for Geometric Intelligence Quotient."""

    def __init__(self):
        self.results: List[BenchmarkResult] = []
        self.spatial = SpatialTransforms()
        self.pattern = PatternRecognition()
        self.topology = TopologyAnalysis()
        self.symmetry = SymmetryDetection()

    def run_all(self) -> BenchmarkSuite:
        """Run all benchmark tests."""
        self.results = []

        # Spatial transformation tests
        self._run_spatial_tests()

        # Pattern recognition tests
        self._run_pattern_tests()

        # Topology tests
        self._run_topology_tests()

        # Symmetry tests
        self._run_symmetry_tests()

        return self._compile_results()

    def run_category(self, category: BenchmarkCategory) -> BenchmarkSuite:
        """Run tests for a specific category."""
        self.results = []

        if category == BenchmarkCategory.SPATIAL:
            self._run_spatial_tests()
        elif category == BenchmarkCategory.PATTERN:
            self._run_pattern_tests()
        elif category == BenchmarkCategory.TOPOLOGY:
            self._run_topology_tests()
        elif category == BenchmarkCategory.SYMMETRY:
            self._run_symmetry_tests()

        return self._compile_results()

    def _run_spatial_tests(self):
        """Run spatial transformation benchmarks."""
        # Test 1: 90° rotation
        start = time.time()
        points = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        expected = [(0, 1), (-1, 0), (0, -1), (1, 0)]
        result = SpatialTransforms.rotation_90(points)
        passed = result == expected
        self.results.append(BenchmarkResult(
            test_id="spatial_rotation_90",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"input": points, "expected": expected, "got": result}
        ))

        # Test 2: 180° rotation
        start = time.time()
        result = SpatialTransforms.rotation_180(points)
        expected = [(-1, 0), (0, -1), (1, 0), (0, 1)]
        passed = result == expected
        self.results.append(BenchmarkResult(
            test_id="spatial_rotation_180",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"input": points, "expected": expected, "got": result}
        ))

        # Test 3: Arbitrary rotation (45°)
        start = time.time()
        points = [(1, 0)]
        result = SpatialTransforms.rotation_arbitrary(points, 45)
        expected_x = math.cos(math.radians(45))
        expected_y = math.sin(math.radians(45))
        passed = abs(result[0][0] - expected_x) < 0.0001 and abs(result[0][1] - expected_y) < 0.0001
        self.results.append(BenchmarkResult(
            test_id="spatial_rotation_45",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"angle": 45, "expected": (expected_x, expected_y), "got": result[0]}
        ))

        # Test 4: Scale
        start = time.time()
        points = [(1, 2), (3, 4)]
        result = SpatialTransforms.scale(points, 2, 0.5)
        expected = [(2, 1), (6, 2)]
        passed = result == expected
        self.results.append(BenchmarkResult(
            test_id="spatial_scale",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"scale": (2, 0.5), "expected": expected, "got": result}
        ))

        # Test 5: Translation
        start = time.time()
        points = [(0, 0), (1, 1)]
        result = SpatialTransforms.translate(points, 5, -3)
        expected = [(5, -3), (6, -2)]
        passed = result == expected
        self.results.append(BenchmarkResult(
            test_id="spatial_translate",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"delta": (5, -3), "expected": expected, "got": result}
        ))

        # Test 6: Composed transforms
        start = time.time()
        points = [(1, 0)]
        transforms = [('rotate', 90), ('scale', (2, 2)), ('translate', (0, 1))]
        result = SpatialTransforms.compose_transforms(points, transforms)
        # After rotation: (0, 1), after scale: (0, 2), after translate: (0, 3)
        expected = [(0, 3)]
        passed = result == expected
        self.results.append(BenchmarkResult(
            test_id="spatial_compose",
            category="spatial",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"transforms": transforms, "expected": expected, "got": result}
        ))

    def _run_pattern_tests(self):
        """Run pattern recognition benchmarks."""
        # Test 1: Detect square symmetry
        start = time.time()
        points = [(0, 0), (1, 0), (1, 1), (0, 1)]
        axes = PatternRecognition.detect_symmetry_axis(points)
        # Square should have symmetry axes
        passed = len(axes) >= 2
        self.results.append(BenchmarkResult(
            test_id="pattern_square_symmetry",
            category="pattern",
            passed=passed,
            score=len(axes) / 2 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"points": points, "axes_found": axes}
        ))

        # Test 2: Rotation symmetry
        start = time.time()
        # Regular hexagon points
        points = [(math.cos(math.radians(i * 60)), math.sin(math.radians(i * 60))) for i in range(6)]
        orders = PatternRecognition.detect_rotation_symmetry(points)
        passed = 6 in orders or 3 in orders or 2 in orders
        self.results.append(BenchmarkResult(
            test_id="pattern_rotation_symmetry",
            category="pattern",
            passed=passed,
            score=len(orders) / 3 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"points": "hexagon", "orders_found": orders}
        ))

        # Test 3: Tessellation classification
        start = time.time()
        # Square grid
        points = [(i, j) for i in range(3) for j in range(3)]
        tess_type = PatternRecognition.classify_tessellation(points)
        passed = tess_type == "square"
        self.results.append(BenchmarkResult(
            test_id="pattern_tessellation_square",
            category="pattern",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"expected": "square", "got": tess_type}
        ))

    def _run_topology_tests(self):
        """Run topology understanding benchmarks."""
        # Test 1: Euler characteristic - sphere
        start = time.time()
        euler = TopologyAnalysis.compute_euler_characteristic(8, 12, 6)  # Cube
        expected = 2
        passed = euler == expected
        self.results.append(BenchmarkResult(
            test_id="topology_euler_cube",
            category="topology",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"V": 8, "E": 12, "F": 6, "euler": euler, "expected": expected}
        ))

        # Test 2: Surface classification
        start = time.time()
        surface = TopologyAnalysis.classify_surface(0)  # Torus
        expected = "torus"
        passed = surface == expected
        self.results.append(BenchmarkResult(
            test_id="topology_classify_torus",
            category="topology",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"euler": 0, "expected": expected, "got": surface}
        ))

        # Test 3: Genus computation
        start = time.time()
        genus = TopologyAnalysis.compute_genus(-4)  # Double torus
        expected = 3
        passed = genus == expected
        self.results.append(BenchmarkResult(
            test_id="topology_genus",
            category="topology",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"euler": -4, "expected_genus": expected, "got": genus}
        ))

        # Test 4: Connectivity
        start = time.time()
        graph = {0: [1, 2], 1: [0], 2: [0], 3: [4], 4: [3]}  # Two components
        components = TopologyAnalysis.check_connectivity(graph)
        expected = 2
        passed = components == expected
        self.results.append(BenchmarkResult(
            test_id="topology_connectivity",
            category="topology",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"graph": graph, "expected_components": expected, "got": components}
        ))

    def _run_symmetry_tests(self):
        """Run symmetry detection benchmarks."""
        # Test 1: Find symmetry group of square
        start = time.time()
        points = [(0, 0), (1, 0), (1, 1), (0, 1)]
        symmetries = SymmetryDetection.find_symmetry_group(points)
        group = SymmetryDetection.classify_spatial_group(symmetries)
        passed = group == "D4" or group.startswith("D")
        self.results.append(BenchmarkResult(
            test_id="symmetry_square_group",
            category="symmetry",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"points": "square", "symmetries": symmetries, "group": group}
        ))

        # Test 2: Point symmetry
        start = time.time()
        points = [(-1, -1), (1, 1), (-1, 1), (1, -1)]
        symmetries = SymmetryDetection.find_symmetry_group(points)
        passed = symmetries['has_point_symmetry']
        self.results.append(BenchmarkResult(
            test_id="symmetry_point_symmetry",
            category="symmetry",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"points": points, "has_point_symmetry": symmetries['has_point_symmetry']}
        ))

        # Test 3: Asymmetric shape
        start = time.time()
        points = [(0, 0), (1, 2), (3, 1)]  # Scalene triangle
        symmetries = SymmetryDetection.find_symmetry_group(points)
        group = SymmetryDetection.classify_spatial_group(symmetries)
        passed = group == "C1"  # No symmetry
        self.results.append(BenchmarkResult(
            test_id="symmetry_asymmetric",
            category="symmetry",
            passed=passed,
            score=1.0 if passed else 0.0,
            time_ms=(time.time() - start) * 1000,
            details={"points": points, "group": group}
        ))

    def _compile_results(self) -> BenchmarkSuite:
        """Compile all results into a suite."""
        total_tests = len(self.results)
        passed = sum(1 for r in self.results if r.passed)
        failed = total_tests - passed

        # Calculate category scores
        category_scores = {}
        for cat in BenchmarkCategory:
            cat_results = [r for r in self.results if r.category == cat.value]
            if cat_results:
                category_scores[cat.value] = sum(r.score for r in cat_results) / len(cat_results)
            else:
                category_scores[cat.value] = 0.0

        # Calculate overall GIQ score (0-100)
        total_score = sum(r.score for r in self.results) / total_tests if total_tests > 0 else 0
        giq_score = total_score * 100

        return BenchmarkSuite(
            timestamp=datetime.now().isoformat(),
            total_tests=total_tests,
            passed=passed,
            failed=failed,
            total_score=total_score,
            category_scores=category_scores,
            results=self.results,
            giq_score=giq_score
        )

    def to_json(self, suite: BenchmarkSuite) -> str:
        """Convert suite to JSON string."""
        return json.dumps({
            "timestamp": suite.timestamp,
            "total_tests": suite.total_tests,
            "passed": suite.passed,
            "failed": suite.failed,
            "total_score": suite.total_score,
            "category_scores": suite.category_scores,
            "giq_score": suite.giq_score,
            "results": [asdict(r) for r in suite.results]
        }, indent=2)


def main():
    parser = argparse.ArgumentParser(description="Geometry OS GIQ Benchmark")
    parser.add_argument("--run-all", action="store_true", help="Run all benchmarks")
    parser.add_argument("--category", choices=["spatial", "pattern", "topology", "symmetry"],
                       help="Run specific category")
    parser.add_argument("--output", "-o", help="Output file for results (JSON)")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

    args = parser.parse_args()

    benchmark = GIQBenchmark()

    if args.run_all:
        suite = benchmark.run_all()
    elif args.category:
        suite = benchmark.run_category(BenchmarkCategory(args.category))
    else:
        parser.print_help()
        return

    # Print results
    print(f"\n{'='*60}")
    print(f"GIQ BENCHMARK RESULTS")
    print(f"{'='*60}")
    print(f"Timestamp: {suite.timestamp}")
    print(f"Total Tests: {suite.total_tests}")
    print(f"Passed: {suite.passed}")
    print(f"Failed: {suite.failed}")
    print(f"\nGIQ Score: {suite.giq_score:.1f}/100")
    print(f"\nCategory Scores:")
    for cat, score in suite.category_scores.items():
        print(f"  {cat}: {score*100:.1f}%")

    if args.verbose:
        print(f"\nDetailed Results:")
        for r in suite.results:
            status = "✓" if r.passed else "✗"
            print(f"  [{status}] {r.test_id}: {r.score:.2f} ({r.time_ms:.2f}ms)")

    # Output to file
    if args.output:
        with open(args.output, 'w') as f:
            f.write(benchmark.to_json(suite))
        print(f"\nResults saved to: {args.output}")


if __name__ == "__main__":
    main()
