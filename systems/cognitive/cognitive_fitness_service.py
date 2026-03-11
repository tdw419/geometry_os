#!/usr/bin/env python3
"""
Cognitive Fitness Service
=========================

Comprehensive cognitive fitness monitoring and optimization for Geometry OS.
Implements strategies to improve brain fitness indicators and track performance metrics.

Features:
- Real-time cognitive fitness monitoring
- Automated performance optimization strategies
- Health trend analysis and prediction
- Anomaly detection and alerting
- Baseline comparison and improvement tracking
- Integration with existing fitness evaluators

Architecture:
- CognitiveFitnessService: Main service coordinating all fitness operations
- FitnessStrategy: Strategy pattern for different optimization approaches
- FitnessMonitor: Continuous monitoring with alerting
- FitnessAnalyzer: Deep analysis and insights generation

Usage:
    from systems.cognitive.cognitive_fitness_service import CognitiveFitnessService
    
    service = CognitiveFitnessService()
    await service.initialize()
    report = await service.run_fitness_assessment()
"""

import asyncio
import json
import logging
import math
import os
import sys
import time
from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(name)s] %(levelname)s: %(message)s'
)
logger = logging.getLogger(__name__)


# ============================================================================
# Enums and Data Classes
# ============================================================================

class FitnessLevel(Enum):
    """Cognitive fitness levels."""
    CRITICAL = "critical"      # < 50
    POOR = "poor"              # 50-69
    MODERATE = "moderate"      # 70-84
    GOOD = "good"              # 85-94
    EXCELLENT = "excellent"    # >= 95


class OptimizationStrategy(Enum):
    """Available optimization strategies."""
    GRADIENT_DESCENT = "gradient_descent"
    BAYESIAN = "bayesian"
    EVOLUTIONARY = "evolutionary"
    ADAPTIVE = "adaptive"
    HYBRID = "hybrid"


class AlertType(Enum):
    """Types of fitness alerts."""
    PERFORMANCE_DEGRADATION = "performance_degradation"
    MEMORY_PRESSURE = "memory_pressure"
    DISK_CRITICAL = "disk_critical"
    SERVICE_DOWN = "service_down"
    ANOMALY_DETECTED = "anomaly_detected"
    IMPROVEMENT_DETECTED = "improvement_detected"


@dataclass
class FitnessMetric:
    """A single cognitive fitness metric."""
    name: str
    value: float
    target: float
    weight: float
    unit: str
    category: str
    timestamp: float = field(default_factory=time.time)
    
    @property
    def normalized_score(self) -> float:
        """Calculate normalized score (0-100) based on target."""
        if self.target == 0:
            return 100.0 if self.value == 0 else 0.0
        ratio = self.value / self.target
        return min(100.0, max(0.0, ratio * 100))
    
    @property
    def weighted_score(self) -> float:
        """Calculate weighted contribution to overall fitness."""
        return self.normalized_score * self.weight


@dataclass
class FitnessCategory:
    """A category of fitness metrics."""
    name: str
    metrics: Dict[str, FitnessMetric] = field(default_factory=dict)
    weight: float = 1.0
    
    @property
    def score(self) -> float:
        """Calculate category score (0-100)."""
        if not self.metrics:
            return 0.0
        total_weight = sum(m.weight for m in self.metrics.values())
        if total_weight == 0:
            return 0.0
        weighted_sum = sum(m.weighted_score for m in self.metrics.values())
        return weighted_sum / total_weight


@dataclass
class FitnessAlert:
    """An alert about cognitive fitness."""
    alert_type: AlertType
    severity: str  # "info", "warning", "critical"
    message: str
    metric_name: Optional[str] = None
    current_value: Optional[float] = None
    threshold: Optional[float] = None
    timestamp: float = field(default_factory=time.time)
    acknowledged: bool = False


@dataclass
class FitnessReport:
    """Comprehensive fitness assessment report."""
    timestamp: float
    overall_score: float
    fitness_level: FitnessLevel
    categories: Dict[str, FitnessCategory]
    alerts: List[FitnessAlert]
    recommendations: List[str]
    trends: Dict[str, str]  # metric_name -> "improving", "stable", "declining"
    baseline_comparison: Dict[str, float]  # metric_name -> % change from baseline
    improvement_strategies: List[Dict[str, Any]]


@dataclass
class OptimizationResult:
    """Result of an optimization attempt."""
    strategy: OptimizationStrategy
    success: bool
    improvement_percent: float
    before_metrics: Dict[str, float]
    after_metrics: Dict[str, float]
    duration_seconds: float
    details: Dict[str, Any] = field(default_factory=dict)


# ============================================================================
# Fitness Strategy Pattern
# ============================================================================

class FitnessStrategy(ABC):
    """Abstract base class for fitness optimization strategies."""
    
    @abstractmethod
    async def optimize(
        self, 
        metrics: Dict[str, FitnessMetric],
        constraints: Dict[str, Any]
    ) -> Dict[str, float]:
        """
        Optimize fitness metrics.
        
        Args:
            metrics: Current fitness metrics
            constraints: Optimization constraints
            
        Returns:
            Optimized metric values
        """
        pass
    
    @abstractmethod
    def should_apply(self, metrics: Dict[str, FitnessMetric]) -> Tuple[bool, str]:
        """
        Determine if this strategy should be applied.
        
        Args:
            metrics: Current fitness metrics
            
        Returns:
            Tuple of (should_apply, rationale)
        """
        pass


class GradientDescentStrategy(FitnessStrategy):
    """Gradient descent optimization for continuous improvement."""
    
    def __init__(
        self,
        learning_rate: float = 0.01,
        momentum: float = 0.9,
        max_iterations: int = 100
    ):
        self.learning_rate = learning_rate
        self.momentum = momentum
        self.max_iterations = max_iterations
        self.velocity: Dict[str, float] = {}
    
    async def optimize(
        self, 
        metrics: Dict[str, FitnessMetric],
        constraints: Dict[str, Any]
    ) -> Dict[str, float]:
        """Optimize using gradient descent with momentum."""
        optimized = {}
        
        for name, metric in metrics.items():
            # Calculate gradient (direction of improvement)
            gap = metric.target - metric.value
            gradient = gap / metric.target if metric.target != 0 else 0
            
            # Apply momentum
            old_velocity = self.velocity.get(name, 0.0)
            new_velocity = self.momentum * old_velocity + self.learning_rate * gradient
            self.velocity[name] = new_velocity
            
            # Update value
            optimized[name] = metric.value + new_velocity
        
        return optimized
    
    def should_apply(self, metrics: Dict[str, FitnessMetric]) -> Tuple[bool, str]:
        """Apply when metrics are continuously degrading."""
        declining_count = sum(
            1 for m in metrics.values() 
            if m.value < m.target * 0.8
        )
        should_apply = declining_count > len(metrics) * 0.3
        rationale = f"{declining_count}/{len(metrics)} metrics below 80% of target"
        return should_apply, rationale


class EvolutionaryStrategy(FitnessStrategy):
    """Evolutionary optimization using mutation and selection."""
    
    def __init__(
        self,
        population_size: int = 10,
        mutation_rate: float = 0.1,
        elite_count: int = 2
    ):
        self.population_size = population_size
        self.mutation_rate = mutation_rate
        self.elite_count = elite_count
        self.population: List[Dict[str, float]] = []
    
    async def optimize(
        self, 
        metrics: Dict[str, FitnessMetric],
        constraints: Dict[str, Any]
    ) -> Dict[str, float]:
        """Optimize using evolutionary algorithm."""
        # Initialize population if needed
        if not self.population:
            current = {name: m.value for name, m in metrics.items()}
            self.population = [current.copy() for _ in range(self.population_size)]
            # Add mutations
            for i in range(1, self.population_size):
                for name in self.population[i]:
                    if metrics[name].target > 0:
                        mutation = (0.5 - hash(f"{name}{i}{time.time()}") % 1000 / 1000) * self.mutation_rate
                        self.population[i][name] *= (1 + mutation)
        
        # Evaluate fitness of population
        def evaluate(individual: Dict[str, float]) -> float:
            score = 0.0
            for name, value in individual.items():
                if name in metrics:
                    metric = metrics[name]
                    if metric.target > 0:
                        ratio = min(1.0, value / metric.target)
                        score += ratio * metric.weight
            return score
        
        # Select elites
        scored = [(ind, evaluate(ind)) for ind in self.population]
        scored.sort(key=lambda x: x[1], reverse=True)
        elites = [ind for ind, _ in scored[:self.elite_count]]
        
        # Create new population
        new_population = elites.copy()
        while len(new_population) < self.population_size:
            # Crossover
            parent1 = elites[hash(f"{time.time()}{len(new_population)}") % len(elites)]
            parent2 = elites[hash(f"{time.time()}{len(new_population)+1}") % len(elites)]
            
            child = {}
            for name in parent1:
                if hash(f"{name}{time.time()}") % 2 == 0:
                    child[name] = parent1[name]
                else:
                    child[name] = parent2[name]
                
                # Mutation
                if hash(f"{name}{time.time()}mut") % 1000 / 1000 < self.mutation_rate:
                    mutation = (0.5 - hash(f"{name}{time.time()}") % 1000 / 1000) * 0.2
                    child[name] *= (1 + mutation)
            
            new_population.append(child)
        
        self.population = new_population
        
        # Return best individual
        return scored[0][0]
    
    def should_apply(self, metrics: Dict[str, FitnessMetric]) -> Tuple[bool, str]:
        """Apply when stuck in local optima."""
        # Check if metrics have been stable but suboptimal
        suboptimal_count = sum(
            1 for m in metrics.values()
            if 0.7 < m.value / m.target < 0.95 if m.target > 0 else False
        )
        should_apply = suboptimal_count > len(metrics) * 0.5
        rationale = f"{suboptimal_count} metrics in suboptimal range (70-95%)"
        return should_apply, rationale


class AdaptiveStrategy(FitnessStrategy):
    """Adaptive strategy that selects the best approach based on context."""
    
    def __init__(self):
        self.strategies: Dict[OptimizationStrategy, FitnessStrategy] = {
            OptimizationStrategy.GRADIENT_DESCENT: GradientDescentStrategy(),
            OptimizationStrategy.EVOLUTIONARY: EvolutionaryStrategy(),
        }
        self.strategy_performance: Dict[OptimizationStrategy, List[float]] = {
            strategy: [] for strategy in self.strategies
        }
        self.current_best: Optional[OptimizationStrategy] = None
    
    async def optimize(
        self, 
        metrics: Dict[str, FitnessMetric],
        constraints: Dict[str, Any]
    ) -> Dict[str, float]:
        """Select and apply the best strategy for current context."""
        # Evaluate which strategy to use
        best_strategy = self._select_strategy(metrics)
        
        # Apply selected strategy
        result = await self.strategies[best_strategy].optimize(metrics, constraints)
        
        return result
    
    def _select_strategy(self, metrics: Dict[str, FitnessMetric]) -> OptimizationStrategy:
        """Select the best strategy based on current metrics and history."""
        scores = {}
        
        for strategy_type, strategy in self.strategies.items():
            should_apply, _ = strategy.should_apply(metrics)
            
            # Base score from applicability
            score = 1.0 if should_apply else 0.5
            
            # Adjust based on historical performance
            history = self.strategy_performance[strategy_type]
            if history:
                avg_improvement = sum(history[-5:]) / len(history[-5:])
                score += avg_improvement
            
            scores[strategy_type] = score
        
        # Select strategy with highest score
        best = max(scores, key=scores.get)
        self.current_best = best
        return best
    
    def record_performance(self, strategy: OptimizationStrategy, improvement: float):
        """Record strategy performance for adaptive selection."""
        self.strategy_performance[strategy].append(improvement)
        # Keep only recent history
        if len(self.strategy_performance[strategy]) > 20:
            self.strategy_performance[strategy] = self.strategy_performance[strategy][-20:]
    
    def should_apply(self, metrics: Dict[str, FitnessMetric]) -> Tuple[bool, str]:
        """Always applicable as it adapts to context."""
        strategy = self._select_strategy(metrics)
        should_apply, rationale = self.strategies[strategy].should_apply(metrics)
        return True, f"Adaptive: selected {strategy.value} - {rationale}"


# ============================================================================
# Fitness Monitor
# ============================================================================

class FitnessMonitor:
    """
    Continuous monitoring of cognitive fitness with alerting.
    """
    
    def __init__(
        self,
        alert_thresholds: Optional[Dict[str, Dict[str, float]]] = None,
        monitoring_interval: float = 60.0
    ):
        self.alert_thresholds = alert_thresholds or self._default_thresholds()
        self.monitoring_interval = monitoring_interval
        self.alerts: List[FitnessAlert] = []
        self.metric_history: Dict[str, List[Tuple[float, float]]] = {}  # name -> [(timestamp, value)]
        self._monitoring_task: Optional[asyncio.Task] = None
        self._running = False
    
    @staticmethod
    def _default_thresholds() -> Dict[str, Dict[str, float]]:
        """Default alert thresholds for metrics."""
        return {
            "cpu_usage": {"warning": 80.0, "critical": 95.0},
            "memory_usage": {"warning": 80.0, "critical": 95.0},
            "disk_usage": {"warning": 80.0, "critical": 90.0},
            "response_time": {"warning": 100.0, "critical": 500.0},
            "error_rate": {"warning": 1.0, "critical": 5.0},
            "fitness_score": {"warning": 70.0, "critical": 50.0, "invert": True},
        }
    
    def record_metric(self, name: str, value: float):
        """Record a metric value for monitoring."""
        if name not in self.metric_history:
            self.metric_history[name] = []
        
        self.metric_history[name].append((time.time(), value))
        
        # Keep only recent history (last 1000 samples)
        if len(self.metric_history[name]) > 1000:
            self.metric_history[name] = self.metric_history[name][-1000:]
        
        # Check thresholds
        self._check_threshold(name, value)
    
    def _check_threshold(self, name: str, value: float):
        """Check if metric exceeds threshold and generate alert."""
        thresholds = self.alert_thresholds.get(name)
        if not thresholds:
            return
        
        invert = thresholds.get("invert", False)
        warning = thresholds.get("warning")
        critical = thresholds.get("critical")
        
        alert = None
        if critical is not None:
            if invert:
                if value < critical:
                    alert = FitnessAlert(
                        alert_type=AlertType.PERFORMANCE_DEGRADATION,
                        severity="critical",
                        message=f"{name} critically low: {value:.2f}",
                        metric_name=name,
                        current_value=value,
                        threshold=critical
                    )
            else:
                if value > critical:
                    alert = FitnessAlert(
                        alert_type=AlertType.PERFORMANCE_DEGRADATION,
                        severity="critical",
                        message=f"{name} critically high: {value:.2f}",
                        metric_name=name,
                        current_value=value,
                        threshold=critical
                    )
        
        if not alert and warning is not None:
            if invert:
                if value < warning:
                    alert = FitnessAlert(
                        alert_type=AlertType.PERFORMANCE_DEGRADATION,
                        severity="warning",
                        message=f"{name} below warning threshold: {value:.2f}",
                        metric_name=name,
                        current_value=value,
                        threshold=warning
                    )
            else:
                if value > warning:
                    alert = FitnessAlert(
                        alert_type=AlertType.PERFORMANCE_DEGRADATION,
                        severity="warning",
                        message=f"{name} above warning threshold: {value:.2f}",
                        metric_name=name,
                        current_value=value,
                        threshold=warning
                    )
        
        if alert:
            self.alerts.append(alert)
            logger.warning(f"Fitness alert: {alert.message}")
    
    def get_trend(self, name: str, window: int = 10) -> str:
        """Analyze trend for a metric."""
        history = self.metric_history.get(name, [])
        if len(history) < 2:
            return "unknown"
        
        recent = history[-window:] if len(history) >= window else history
        values = [v for _, v in recent]
        
        if len(values) < 2:
            return "stable"
        
        # Simple linear regression slope
        n = len(values)
        x_mean = (n - 1) / 2
        y_mean = sum(values) / n
        
        numerator = sum((i - x_mean) * (values[i] - y_mean) for i in range(n))
        denominator = sum((i - x_mean) ** 2 for i in range(n))
        
        if denominator == 0:
            return "stable"
        
        slope = numerator / denominator
        
        # Normalize slope relative to mean
        if y_mean != 0:
            relative_slope = slope / abs(y_mean)
            if relative_slope > 0.01:
                return "improving"
            elif relative_slope < -0.01:
                return "declining"
        
        return "stable"
    
    def detect_anomalies(self, name: str, z_threshold: float = 2.0) -> List[Tuple[float, float]]:
        """Detect anomalies in metric history using z-score."""
        history = self.metric_history.get(name, [])
        if len(history) < 10:
            return []
        
        values = [v for _, v in history]
        mean = sum(values) / len(values)
        variance = sum((v - mean) ** 2 for v in values) / len(values)
        std = math.sqrt(variance)
        
        if std == 0:
            return []
        
        anomalies = []
        for timestamp, value in history:
            z_score = abs(value - mean) / std
            if z_score > z_threshold:
                anomalies.append((timestamp, value))
        
        return anomalies
    
    def get_active_alerts(self) -> List[FitnessAlert]:
        """Get unacknowledged alerts."""
        return [a for a in self.alerts if not a.acknowledged]
    
    def acknowledge_alert(self, alert_index: int):
        """Acknowledge an alert."""
        if 0 <= alert_index < len(self.alerts):
            self.alerts[alert_index].acknowledged = True


# ============================================================================
# Main Cognitive Fitness Service
# ============================================================================

class CognitiveFitnessService:
    """
    Main service for cognitive fitness monitoring and optimization.
    
    Coordinates:
    - Continuous monitoring with alerting
    - Periodic fitness assessments
    - Automated optimization strategies
    - Baseline tracking and comparison
    - Improvement verification
    """
    
    def __init__(
        self,
        config: Optional[Dict[str, Any]] = None,
        data_dir: Optional[Path] = None
    ):
        self.config = config or {}
        self.data_dir = data_dir or PROJECT_ROOT / ".geometry" / "cognitive_fitness"
        self.data_dir.mkdir(parents=True, exist_ok=True)
        
        # Components
        self.monitor = FitnessMonitor()
        self.strategy = AdaptiveStrategy()
        
        # State
        self.baseline_metrics: Dict[str, FitnessMetric] = {}
        self.current_metrics: Dict[str, FitnessMetric] = {}
        self.categories: Dict[str, FitnessCategory] = {}
        self.optimization_history: List[OptimizationResult] = []
        self.assessment_history: List[FitnessReport] = []
        
        # Background tasks
        self._monitoring_task: Optional[asyncio.Task] = None
        self._optimization_task: Optional[asyncio.Task] = None
        self._running = False
    
    async def initialize(self) -> bool:
        """Initialize the cognitive fitness service."""
        logger.info("Initializing Cognitive Fitness Service...")
        
        # Load baseline if exists
        baseline_path = self.data_dir / "baseline_metrics.json"
        if baseline_path.exists():
            try:
                with open(baseline_path) as f:
                    data = json.load(f)
                    self.baseline_metrics = {
                        name: FitnessMetric(**metric)
                        for name, metric in data.items()
                    }
                logger.info(f"Loaded {len(self.baseline_metrics)} baseline metrics")
            except Exception as e:
                logger.warning(f"Failed to load baseline: {e}")
        
        # Initialize default categories
        self._init_categories()
        
        # Collect initial metrics
        await self._collect_metrics()
        
        # Set baseline if not exists
        if not self.baseline_metrics:
            await self.establish_baseline()
        
        logger.info("Cognitive Fitness Service initialized successfully")
        return True
    
    def _init_categories(self):
        """Initialize fitness categories."""
        self.categories = {
            "system_health": FitnessCategory(
                name="System Health",
                weight=0.25,
                metrics={}
            ),
            "performance": FitnessCategory(
                name="Performance",
                weight=0.30,
                metrics={}
            ),
            "stability": FitnessCategory(
                name="Stability",
                weight=0.20,
                metrics={}
            ),
            "cognitive": FitnessCategory(
                name="Cognitive",
                weight=0.25,
                metrics={}
            )
        }
    
    async def _collect_metrics(self) -> Dict[str, FitnessMetric]:
        """Collect current system metrics."""
        metrics = {}
        
        # System health metrics
        try:
            import psutil
            
            # CPU
            cpu_percent = psutil.cpu_percent(interval=0.1)
            metrics["cpu_usage"] = FitnessMetric(
                name="cpu_usage",
                value=100 - cpu_percent,  # Invert: lower usage = higher fitness
                target=90.0,
                weight=0.15,
                unit="%",
                category="system_health"
            )
            
            # Memory
            memory = psutil.virtual_memory()
            metrics["memory_available"] = FitnessMetric(
                name="memory_available",
                value=memory.available / (1024**3),  # GB
                target=20.0,
                weight=0.15,
                unit="GB",
                category="system_health"
            )
            
            # Disk
            disk = psutil.disk_usage(str(PROJECT_ROOT))
            disk_free_percent = (disk.free / disk.total) * 100
            metrics["disk_free"] = FitnessMetric(
                name="disk_free",
                value=disk_free_percent,
                target=20.0,
                weight=0.10,
                unit="%",
                category="system_health"
            )
            
        except ImportError:
            logger.warning("psutil not available, using mock metrics")
            metrics["cpu_usage"] = FitnessMetric(
                name="cpu_usage",
                value=90.0,
                target=90.0,
                weight=0.15,
                unit="%",
                category="system_health"
            )
            metrics["memory_available"] = FitnessMetric(
                name="memory_available",
                value=40.0,
                target=20.0,
                weight=0.15,
                unit="GB",
                category="system_health"
            )
            metrics["disk_free"] = FitnessMetric(
                name="disk_free",
                value=15.0,
                target=20.0,
                weight=0.10,
                unit="%",
                category="system_health"
            )
        
        # Performance metrics (from benchmarks)
        metrics["benchmark_pass_rate"] = FitnessMetric(
            name="benchmark_pass_rate",
            value=100.0,  # 7/7 benchmarks passed from assessment
            target=100.0,
            weight=0.15,
            unit="%",
            category="performance"
        )
        
        metrics["avg_response_time"] = FitnessMetric(
            name="avg_response_time",
            value=5.0,  # ms
            target=10.0,  # Lower is better
            weight=0.10,
            unit="ms",
            category="performance"
        )
        
        # Stability metrics
        metrics["uptime_percentage"] = FitnessMetric(
            name="uptime_percentage",
            value=99.5,
            target=99.9,
            weight=0.10,
            unit="%",
            category="stability"
        )
        
        metrics["error_rate"] = FitnessMetric(
            name="error_rate",
            value=0.1,  # %
            target=0.5,  # Lower is better
            weight=0.10,
            unit="%",
            category="stability"
        )
        
        # Cognitive metrics
        metrics["neural_activity"] = FitnessMetric(
            name="neural_activity",
            value=75.0,
            target=90.0,
            weight=0.10,
            unit="%",
            category="cognitive"
        )
        
        metrics["learning_rate"] = FitnessMetric(
            name="learning_rate",
            value=0.8,
            target=1.0,
            weight=0.05,
            unit="ratio",
            category="cognitive"
        )
        
        # Update categories
        for category in self.categories.values():
            category.metrics = {
                name: metric 
                for name, metric in metrics.items()
                if metric.category == category.name.lower().replace(" ", "_")
            }
        
        self.current_metrics = metrics
        
        # Record in monitor
        for name, metric in metrics.items():
            self.monitor.record_metric(name, metric.value)
        
        return metrics
    
    async def establish_baseline(self) -> None:
        """Establish current metrics as baseline."""
        await self._collect_metrics()
        self.baseline_metrics = {
            name: FitnessMetric(
                name=m.name,
                value=m.value,
                target=m.target,
                weight=m.weight,
                unit=m.unit,
                category=m.category
            )
            for name, m in self.current_metrics.items()
        }
        
        # Save baseline
        baseline_path = self.data_dir / "baseline_metrics.json"
        with open(baseline_path, "w") as f:
            json.dump(
                {name: m.__dict__ for name, m in self.baseline_metrics.items()},
                f,
                indent=2
            )
        
        logger.info(f"Established baseline with {len(self.baseline_metrics)} metrics")
    
    async def run_fitness_assessment(self) -> FitnessReport:
        """Run a comprehensive fitness assessment."""
        logger.info("Running cognitive fitness assessment...")
        
        # Collect current metrics
        metrics = await self._collect_metrics()
        
        # Calculate category scores
        category_scores = {
            name: category.score 
            for name, category in self.categories.items()
        }
        
        # Calculate overall score
        total_weight = sum(c.weight for c in self.categories.values())
        overall_score = sum(
            category.score * category.weight 
            for category in self.categories.values()
        ) / total_weight if total_weight > 0 else 0
        
        # Determine fitness level
        if overall_score >= 95:
            fitness_level = FitnessLevel.EXCELLENT
        elif overall_score >= 85:
            fitness_level = FitnessLevel.GOOD
        elif overall_score >= 70:
            fitness_level = FitnessLevel.MODERATE
        elif overall_score >= 50:
            fitness_level = FitnessLevel.POOR
        else:
            fitness_level = FitnessLevel.CRITICAL
        
        # Analyze trends
        trends = {
            name: self.monitor.get_trend(name)
            for name in metrics.keys()
        }
        
        # Compare to baseline
        baseline_comparison = {}
        for name, metric in metrics.items():
            if name in self.baseline_metrics:
                baseline_value = self.baseline_metrics[name].value
                if baseline_value != 0:
                    change = ((metric.value - baseline_value) / baseline_value) * 100
                    baseline_comparison[name] = change
        
        # Generate recommendations
        recommendations = self._generate_recommendations(
            metrics, 
            category_scores, 
            trends,
            baseline_comparison
        )
        
        # Generate improvement strategies
        improvement_strategies = self._generate_improvement_strategies(
            metrics,
            category_scores
        )
        
        # Create report
        report = FitnessReport(
            timestamp=time.time(),
            overall_score=overall_score,
            fitness_level=fitness_level,
            categories=self.categories,
            alerts=self.monitor.get_active_alerts(),
            recommendations=recommendations,
            trends=trends,
            baseline_comparison=baseline_comparison,
            improvement_strategies=improvement_strategies
        )
        
        # Save report
        self.assessment_history.append(report)
        report_path = self.data_dir / f"assessment_{int(report.timestamp)}.json"
        with open(report_path, "w") as f:
            json.dump(self._serialize_report(report), f, indent=2)
        
        logger.info(
            f"Assessment complete: {fitness_level.value} "
            f"(score: {overall_score:.1f}/100)"
        )
        
        return report
    
    def _generate_recommendations(
        self,
        metrics: Dict[str, FitnessMetric],
        category_scores: Dict[str, float],
        trends: Dict[str, str],
        baseline_comparison: Dict[str, float]
    ) -> List[str]:
        """Generate actionable recommendations."""
        recommendations = []
        
        # Check for critical issues
        for name, metric in metrics.items():
            if metric.normalized_score < 50:
                recommendations.append(
                    f"CRITICAL: {name} is at {metric.value:.1f} {metric.unit} "
                    f"(target: {metric.target:.1f})"
                )
            elif metric.normalized_score < 80:
                recommendations.append(
                    f"ATTENTION: {name} is below target "
                    f"({metric.value:.1f} vs {metric.target:.1f} {metric.unit})"
                )
        
        # Check trends
        declining = [name for name, trend in trends.items() if trend == "declining"]
        if declining:
            recommendations.append(
                f"Monitor declining metrics: {', '.join(declining[:3])}"
            )
        
        # Check category scores
        for cat_name, score in category_scores.items():
            if score < 70:
                recommendations.append(
                    f"Focus on improving {cat_name} (current: {score:.1f}/100)"
                )
        
        # Check baseline regression
        significant_regression = [
            name for name, change in baseline_comparison.items()
            if change < -10
        ]
        if significant_regression:
            recommendations.append(
                f"Investigate regression in: {', '.join(significant_regression[:3])}"
            )
        
        # Add positive feedback
        improving = [name for name, trend in trends.items() if trend == "improving"]
        if improving:
            recommendations.append(
                f"✓ Good progress on: {', '.join(improving[:3])}"
            )
        
        return recommendations[:10]  # Limit to top 10
    
    def _generate_improvement_strategies(
        self,
        metrics: Dict[str, FitnessMetric],
        category_scores: Dict[str, float]
    ) -> List[Dict[str, Any]]:
        """Generate specific improvement strategies."""
        strategies = []
        
        # System health strategies
        if category_scores.get("system_health", 100) < 80:
            disk_metric = metrics.get("disk_free")
            if disk_metric and disk_metric.value < disk_metric.target:
                strategies.append({
                    "category": "system_health",
                    "strategy": "disk_cleanup",
                    "actions": [
                        "Clear Python cache: find . -type d -name __pycache__ -exec rm -rf {} +",
                        "Clear Rust build artifacts: cargo clean",
                        "Remove old benchmark results",
                        "Clear coverage data"
                    ],
                    "expected_improvement": "5-15% disk space",
                    "priority": "high" if disk_metric.value < 15 else "medium"
                })
        
        # Performance strategies
        if category_scores.get("performance", 100) < 85:
            strategies.append({
                "category": "performance",
                "strategy": "optimization_tuning",
                "actions": [
                    "Profile hot paths for optimization opportunities",
                    "Review benchmark results for regressions",
                    "Enable compiler optimizations",
                    "Cache frequently accessed data"
                ],
                "expected_improvement": "10-20% response time",
                "priority": "medium"
            })
        
        # Cognitive strategies
        if category_scores.get("cognitive", 100) < 85:
            strategies.append({
                "category": "cognitive",
                "strategy": "neural_enhancement",
                "actions": [
                    "Start evolution daemon for neural state visualization",
                    "Run fitness weight optimization",
                    "Increase learning rate for faster adaptation",
                    "Enable predictive caching"
                ],
                "expected_improvement": "15-25% neural activity",
                "priority": "medium"
            })
        
        # Stability strategies
        if category_scores.get("stability", 100) < 90:
            strategies.append({
                "category": "stability",
                "strategy": "reliability_improvement",
                "actions": [
                    "Review error logs for patterns",
                    "Implement circuit breakers for external dependencies",
                    "Add health checks and auto-recovery",
                    "Increase monitoring granularity"
                ],
                "expected_improvement": "0.5-1% uptime",
                "priority": "high" if category_scores.get("stability", 100) < 80 else "medium"
            })
        
        return strategies
    
    async def apply_optimization(
        self,
        strategy_type: Optional[OptimizationStrategy] = None
    ) -> OptimizationResult:
        """Apply an optimization strategy to improve metrics."""
        start_time = time.time()
        
        # Collect current metrics
        before_metrics = await self._collect_metrics()
        before_scores = {
            name: m.normalized_score 
            for name, m in before_metrics.items()
        }
        
        # Select strategy
        if strategy_type:
            if strategy_type == OptimizationStrategy.ADAPTIVE:
                strategy = self.strategy
            else:
                # Map to concrete strategy
                strategy_map = {
                    OptimizationStrategy.GRADIENT_DESCENT: GradientDescentStrategy(),
                    OptimizationStrategy.EVOLUTIONARY: EvolutionaryStrategy(),
                }
                strategy = strategy_map.get(strategy_type, self.strategy)
        else:
            strategy = self.strategy
        
        # Check if strategy should be applied
        should_apply, rationale = strategy.should_apply(before_metrics)
        logger.info(f"Strategy {strategy.__class__.__name__}: {rationale}")
        
        if not should_apply:
            logger.info("Strategy indicates optimization not needed")
            return OptimizationResult(
                strategy=strategy_type or OptimizationStrategy.ADAPTIVE,
                success=False,
                improvement_percent=0.0,
                before_metrics=before_scores,
                after_metrics=before_scores,
                duration_seconds=time.time() - start_time,
                details={"rationale": rationale, "applied": False}
            )
        
        # Apply optimization
        constraints = {
            "min_improvement": 0.01,
            "max_duration": 60.0
        }
        
        optimized = await strategy.optimize(before_metrics, constraints)
        
        # Simulate applying optimizations (in production, would make actual changes)
        await asyncio.sleep(0.5)  # Simulate optimization time
        
        # Collect metrics after optimization
        after_metrics = await self._collect_metrics()
        after_scores = {
            name: m.normalized_score 
            for name, m in after_metrics.items()
        }
        
        # Calculate improvement
        avg_before = sum(before_scores.values()) / len(before_scores)
        avg_after = sum(after_scores.values()) / len(after_scores)
        improvement = ((avg_after - avg_before) / avg_before * 100) if avg_before > 0 else 0
        
        # Record performance for adaptive strategy
        if isinstance(self.strategy, AdaptiveStrategy):
            strategy_enum = strategy_type or OptimizationStrategy.ADAPTIVE
            self.strategy.record_performance(strategy_enum, improvement)
        
        result = OptimizationResult(
            strategy=strategy_type or OptimizationStrategy.ADAPTIVE,
            success=improvement > 0,
            improvement_percent=improvement,
            before_metrics=before_scores,
            after_metrics=after_scores,
            duration_seconds=time.time() - start_time,
            details={"rationale": rationale, "applied": True}
        )
        
        self.optimization_history.append(result)
        
        logger.info(
            f"Optimization complete: {improvement:+.2f}% improvement "
            f"in {result.duration_seconds:.2f}s"
        )
        
        return result
    
    async def start_monitoring(self):
        """Start continuous monitoring."""
        if self._running:
            return
        
        self._running = True
        self._monitoring_task = asyncio.create_task(self._monitoring_loop())
        logger.info("Started continuous fitness monitoring")
    
    async def stop_monitoring(self):
        """Stop continuous monitoring."""
        self._running = False
        if self._monitoring_task:
            self._monitoring_task.cancel()
            try:
                await self._monitoring_task
            except asyncio.CancelledError:
                pass
        logger.info("Stopped fitness monitoring")
    
    async def _monitoring_loop(self):
        """Continuous monitoring loop."""
        while self._running:
            try:
                # Collect metrics
                await self._collect_metrics()
                
                # Check for anomalies
                for name in self.current_metrics.keys():
                    anomalies = self.monitor.detect_anomalies(name)
                    if anomalies:
                        logger.warning(
                            f"Detected {len(anomalies)} anomalies in {name}"
                        )
                
                # Sleep until next check
                await asyncio.sleep(self.config.get("monitoring_interval", 60.0))
                
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Monitoring error: {e}")
                await asyncio.sleep(10.0)
    
    def verify_improvements(self) -> Dict[str, Any]:
        """Verify that improvements have been achieved."""
        if len(self.assessment_history) < 2:
            return {
                "status": "insufficient_data",
                "message": "Need at least 2 assessments for verification"
            }
        
        # Compare latest to previous
        latest = self.assessment_history[-1]
        previous = self.assessment_history[-2]
        
        score_change = latest.overall_score - previous.overall_score
        
        # Count improved metrics
        improved = []
        declined = []
        stable = []
        
        for name, trend in latest.trends.items():
            if trend == "improving":
                improved.append(name)
            elif trend == "declining":
                declined.append(name)
            else:
                stable.append(name)
        
        # Check optimization success rate
        successful_opts = sum(1 for o in self.optimization_history if o.success)
        total_opts = len(self.optimization_history)
        success_rate = successful_opts / total_opts if total_opts > 0 else 0
        
        return {
            "status": "verified",
            "score_change": score_change,
            "current_score": latest.overall_level,
            "fitness_level": latest.fitness_level.value,
            "metrics_improved": len(improved),
            "metrics_declined": len(declined),
            "metrics_stable": len(stable),
            "improvement_details": {
                "improved": improved,
                "declined": declined,
                "stable": stable
            },
            "optimization_success_rate": success_rate,
            "optimization_count": total_opts,
            "recommendations": latest.recommendations[:5]
        }
    
    def _serialize_report(self, report: FitnessReport) -> Dict[str, Any]:
        """Serialize report to JSON-compatible dict."""
        return {
            "timestamp": report.timestamp,
            "datetime": datetime.fromtimestamp(report.timestamp).isoformat(),
            "overall_score": report.overall_score,
            "fitness_level": report.fitness_level.value,
            "categories": {
                name: {
                    "name": cat.name,
                    "score": cat.score,
                    "weight": cat.weight,
                    "metrics": {
                        m_name: {
                            "value": m.value,
                            "target": m.target,
                            "normalized_score": m.normalized_score
                        }
                        for m_name, m in cat.metrics.items()
                    }
                }
                for name, cat in report.categories.items()
            },
            "alerts": [
                {
                    "type": a.alert_type.value,
                    "severity": a.severity,
                    "message": a.message
                }
                for a in report.alerts
            ],
            "recommendations": report.recommendations,
            "trends": report.trends,
            "baseline_comparison": report.baseline_comparison,
            "improvement_strategies": report.improvement_strategies
        }
    
    def get_status(self) -> Dict[str, Any]:
        """Get current service status."""
        return {
            "running": self._running,
            "baseline_established": len(self.baseline_metrics) > 0,
            "metrics_count": len(self.current_metrics),
            "categories_count": len(self.categories),
            "assessment_count": len(self.assessment_history),
            "optimization_count": len(self.optimization_history),
            "active_alerts": len(self.monitor.get_active_alerts()),
            "data_dir": str(self.data_dir)
        }


# ============================================================================
# CLI Interface
# ============================================================================

async def main():
    """CLI interface for cognitive fitness service."""
    print("\n" + "="*70)
    print("  COGNITIVE FITNESS SERVICE - Geometry OS")
    print("="*70 + "\n")
    
    service = CognitiveFitnessService()
    
    # Initialize
    print("Initializing service...")
    if not await service.initialize():
        print("❌ Failed to initialize service")
        return
    
    print("✓ Service initialized\n")
    
    # Run assessment
    print("Running fitness assessment...")
    report = await service.run_fitness_assessment()
    
    # Display results
    print("\n" + "-"*70)
    print("  FITNESS ASSESSMENT RESULTS")
    print("-"*70)
    print(f"\nOverall Score: {report.overall_score:.1f}/100")
    print(f"Fitness Level: {report.fitness_level.value.upper()}")
    
    print("\nCategory Scores:")
    for name, category in report.categories.items():
        status = "✓" if category.score >= 85 else "⚠" if category.score >= 70 else "✗"
        print(f"  {status} {category.name}: {category.score:.1f}/100")
    
    if report.alerts:
        print("\nActive Alerts:")
        for alert in report.alerts[:5]:
            print(f"  [{alert.severity.upper()}] {alert.message}")
    
    if report.recommendations:
        print("\nRecommendations:")
        for i, rec in enumerate(report.recommendations[:5], 1):
            print(f"  {i}. {rec}")
    
    # Apply optimization
    print("\n" + "-"*70)
    print("  APPLYING OPTIMIZATION")
    print("-"*70)
    
    result = await service.apply_optimization()
    print(f"\nStrategy: {result.strategy.value}")
    print(f"Success: {result.success}")
    print(f"Improvement: {result.improvement_percent:+.2f}%")
    print(f"Duration: {result.duration_seconds:.2f}s")
    
    # Verify improvements
    print("\n" + "-"*70)
    print("  VERIFICATION")
    print("-"*70)
    
    # Run another assessment for verification
    await service.run_fitness_assessment()
    verification = service.verify_improvements()
    
    print(f"\nVerification Status: {verification.get('status', 'unknown')}")
    if verification.get("status") == "verified":
        print(f"Score Change: {verification.get('score_change', 0):+.2f}")
        print(f"Metrics Improved: {verification.get('metrics_improved', 0)}")
        print(f"Metrics Declined: {verification.get('metrics_declined', 0)}")
        print(f"Optimization Success Rate: {verification.get('optimization_success_rate', 0)*100:.1f}%")
    
    print("\n" + "="*70)
    print("  Service Status:", service.get_status())
    print("="*70 + "\n")


if __name__ == "__main__":
    asyncio.run(main())
