"""
Insight Analyzer Module

Analyzes feedback and interaction data to derive actionable insights:
- Trend detection
- Sentiment analysis
- Usage pattern recognition
- Anomaly detection
- Recommendation generation
"""

import json
import time
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from pathlib import Path
from typing import Optional
from collections import defaultdict
import logging

logger = logging.getLogger(__name__)


class InsightCategory(Enum):
    """Categories of insights."""

    USABILITY = "usability"
    PERFORMANCE = "performance"
    ENGAGEMENT = "engagement"
    SATISFACTION = "satisfaction"
    ERROR = "error"
    FEATURE = "feature"
    PATTERN = "pattern"
    ANOMALY = "anomaly"


class InsightPriority(Enum):
    """Priority levels for insights."""

    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


@dataclass
class Insight:
    """A single actionable insight."""

    id: str
    category: InsightCategory
    priority: InsightPriority
    title: str
    description: str
    evidence: dict  # Supporting data
    recommendations: list[str]
    confidence: float  # 0.0 to 1.0
    created_at: datetime = field(default_factory=datetime.utcnow)
    expires_at: Optional[datetime] = None
    tags: list[str] = field(default_factory=list)

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "category": self.category.value,
            "priority": self.priority.value,
            "title": self.title,
            "description": self.description,
            "evidence": self.evidence,
            "recommendations": self.recommendations,
            "confidence": self.confidence,
            "created_at": self.created_at.isoformat(),
            "expires_at": self.expires_at.isoformat() if self.expires_at else None,
            "tags": self.tags,
        }


@dataclass
class TrendReport:
    """Report on trends over time."""

    metric_name: str
    time_range: tuple[datetime, datetime]
    data_points: list[tuple[datetime, float]]
    trend_direction: str  # "up", "down", "stable"
    change_percent: float
    is_significant: bool
    forecast: Optional[list[tuple[datetime, float]]] = None

    def to_dict(self) -> dict:
        return {
            "metric_name": self.metric_name,
            "time_range": [
                self.time_range[0].isoformat(),
                self.time_range[1].isoformat(),
            ],
            "data_points": [
                (t.isoformat(), v) for t, v in self.data_points
            ],
            "trend_direction": self.trend_direction,
            "change_percent": self.change_percent,
            "is_significant": self.is_significant,
            "forecast": [
                (t.isoformat(), v) for t, v in self.forecast
            ] if self.forecast else None,
        }


class InsightAnalyzer:
    """
    Analyzes feedback and interaction data to generate insights.

    Features:
    - Trend analysis over time windows
    - Sentiment analysis from text feedback
    - Usage pattern detection
    - Anomaly detection
    - Automated recommendations
    """

    def __init__(
        self,
        storage_path: Optional[Path] = None,
        analysis_window_hours: int = 168,  # 1 week default
        min_sample_size: int = 5,
    ):
        self.storage_path = storage_path or (
            Path.home() / ".geometry_os" / "insights"
        )
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self.analysis_window = timedelta(hours=analysis_window_hours)
        self.min_sample_size = min_sample_size
        self._insights: list[Insight] = []

    # --- Trend Analysis ---

    def analyze_rating_trends(
        self,
        feedback_entries: list,
        time_buckets: int = 7,
    ) -> Optional[TrendReport]:
        """Analyze rating trends over time."""
        if len(feedback_entries) < self.min_sample_size:
            return None

        # Filter to ratings only
        ratings = [
            e for e in feedback_entries
            if hasattr(e, "feedback_type")
            and e.feedback_type.value == "rating"
            and e.content
        ]

        if len(ratings) < self.min_sample_size:
            return None

        # Bucket by time
        now = datetime.utcnow()
        bucket_size = self.analysis_window / time_buckets
        buckets = defaultdict(list)

        for entry in ratings:
            entry_time = entry.created_at
            bucket_idx = int((now - entry_time) / bucket_size)
            if bucket_idx < time_buckets:
                rating = entry.content.get("rating", 0)
                buckets[bucket_idx].append(rating)

        # Calculate averages per bucket
        data_points = []
        for idx in range(time_buckets):
            if buckets[idx]:
                bucket_time = now - (idx * bucket_size)
                avg_rating = sum(buckets[idx]) / len(buckets[idx])
                data_points.append((bucket_time, avg_rating))

        data_points.reverse()  # Oldest first

        if len(data_points) < 2:
            return None

        # Calculate trend
        first_avg = data_points[0][1]
        last_avg = data_points[-1][1]
        change_percent = ((last_avg - first_avg) / first_avg * 100) if first_avg > 0 else 0

        if change_percent > 5:
            direction = "up"
        elif change_percent < -5:
            direction = "down"
        else:
            direction = "stable"

        return TrendReport(
            metric_name="average_rating",
            time_range=(data_points[0][0], data_points[-1][0]),
            data_points=data_points,
            trend_direction=direction,
            change_percent=change_percent,
            is_significant=abs(change_percent) > 10,
        )

    def analyze_error_trends(
        self,
        interaction_events: list,
        time_buckets: int = 7,
    ) -> Optional[TrendReport]:
        """Analyze error rate trends over time."""
        if len(interaction_events) < self.min_sample_size:
            return None

        errors = [
            e for e in interaction_events
            if hasattr(e, "event_type") and e.event_type.value == "error_encounter"
        ]

        if len(errors) < self.min_sample_size:
            return None

        now = datetime.utcnow()
        bucket_size = self.analysis_window / time_buckets
        buckets = defaultdict(int)

        for event in errors:
            event_time = datetime.fromtimestamp(event.timestamp)
            bucket_idx = int((now - event_time) / bucket_size)
            if bucket_idx < time_buckets:
                buckets[bucket_idx] += 1

        data_points = []
        for idx in range(time_buckets):
            bucket_time = now - (idx * bucket_size)
            data_points.append((bucket_time, float(buckets[idx])))

        data_points.reverse()

        if len(data_points) < 2:
            return None

        first_count = data_points[0][1]
        last_count = data_points[-1][1]

        if first_count > 0:
            change_percent = ((last_count - first_count) / first_count * 100)
        else:
            change_percent = 100 if last_count > 0 else 0

        if change_percent > 10:
            direction = "up"
        elif change_percent < -10:
            direction = "down"
        else:
            direction = "stable"

        return TrendReport(
            metric_name="error_count",
            time_range=(data_points[0][0], data_points[-1][0]),
            data_points=data_points,
            trend_direction=direction,
            change_percent=change_percent,
            is_significant=abs(change_percent) > 20,
        )

    # --- Sentiment Analysis ---

    def analyze_sentiment(self, text: str) -> dict:
        """Simple sentiment analysis for text feedback."""
        text_lower = text.lower()

        positive_words = [
            "great", "excellent", "amazing", "love", "fantastic", "wonderful",
            "helpful", "intuitive", "easy", "fast", "beautiful", "smooth",
            "perfect", "awesome", "brilliant", "outstanding", "solid",
        ]

        negative_words = [
            "terrible", "awful", "hate", "horrible", "broken", "buggy",
            "confusing", "difficult", "slow", "ugly", "frustrating", "annoying",
            "worst", "useless", "crash", "fail", "error", "problem",
        ]

        # Count occurrences
        positive_count = sum(1 for word in positive_words if word in text_lower)
        negative_count = sum(1 for word in negative_words if word in text_lower)

        total = positive_count + negative_count
        if total == 0:
            sentiment = "neutral"
            score = 0.5
        else:
            score = positive_count / total
            if score > 0.6:
                sentiment = "positive"
            elif score < 0.4:
                sentiment = "negative"
            else:
                sentiment = "neutral"

        return {
            "sentiment": sentiment,
            "score": score,
            "positive_words": positive_count,
            "negative_words": negative_count,
        }

    def analyze_feedback_sentiment(
        self,
        feedback_entries: list,
    ) -> dict:
        """Analyze overall sentiment from feedback entries."""
        comments = [
            e for e in feedback_entries
            if hasattr(e, "feedback_type")
            and e.feedback_type.value in ("comment", "bug_report", "usability_issue")
            and e.content
        ]

        if not comments:
            return {"total": 0}

        sentiments = {"positive": 0, "neutral": 0, "negative": 0}
        scores = []

        for entry in comments:
            text = entry.content.get("text", "") or entry.content.get("description", "")
            if text:
                result = self.analyze_sentiment(text)
                sentiments[result["sentiment"]] += 1
                scores.append(result["score"])

        return {
            "total": len(comments),
            "distribution": sentiments,
            "average_score": sum(scores) / len(scores) if scores else 0.5,
            "sentiment_ratio": (
                sentiments["positive"] / sentiments["negative"]
                if sentiments["negative"] > 0
                else float("inf") if sentiments["positive"] > 0 else 1.0
            ),
        }

    # --- Pattern Detection ---

    def detect_usage_patterns(
        self,
        interaction_events: list,
    ) -> list[dict]:
        """Detect common usage patterns from interaction data."""
        patterns = []

        if len(interaction_events) < self.min_sample_size:
            return patterns

        # Component co-usage patterns
        component_sequences = defaultdict(int)
        session_components = defaultdict(set)

        for event in interaction_events:
            if hasattr(event, "session_id") and hasattr(event, "component") and event.component:
                session_components[event.session_id].add(event.component)

        # Find commonly co-used components
        for session_id, components in session_components.items():
            if len(components) >= 2:
                comp_list = sorted(components)
                for i, c1 in enumerate(comp_list):
                    for c2 in comp_list[i + 1 :]:
                        component_sequences[(c1, c2)] += 1

        # Identify top patterns
        top_patterns = sorted(
            component_sequences.items(),
            key=lambda x: -x[1],
        )[:5]

        for (comp1, comp2), count in top_patterns:
            if count >= self.min_sample_size:
                patterns.append({
                    "type": "component_couse",
                    "components": [comp1, comp2],
                    "frequency": count,
                    "description": f"Components '{comp1}' and '{comp2}' are frequently used together",
                })

        # Time-of-day patterns
        hour_counts = defaultdict(int)
        for event in interaction_events:
            if hasattr(event, "timestamp"):
                hour = datetime.fromtimestamp(event.timestamp).hour
                hour_counts[hour] += 1

        if hour_counts:
            peak_hour = max(hour_counts.items(), key=lambda x: x[1])
            patterns.append({
                "type": "peak_usage_time",
                "hour": peak_hour[0],
                "count": peak_hour[1],
                "description": f"Peak usage occurs at hour {peak_hour[0]}",
            })

        return patterns

    def detect_anomalies(
        self,
        interaction_events: list,
        feedback_entries: list,
    ) -> list[dict]:
        """Detect anomalies in usage or feedback patterns."""
        anomalies = []

        # Sudden spike in errors
        error_events = [
            e for e in interaction_events
            if hasattr(e, "event_type") and e.event_type.value == "error_encounter"
        ]

        if len(error_events) >= self.min_sample_size:
            # Group by hour
            hour_errors = defaultdict(int)
            for event in error_events:
                hour = int(event.timestamp // 3600)
                hour_errors[hour] += 1

            if hour_errors:
                counts = list(hour_errors.values())
                avg = sum(counts) / len(counts)
                std = (sum((c - avg) ** 2 for c in counts) / len(counts)) ** 0.5

                for hour, count in hour_errors.items():
                    if std > 0 and (count - avg) / std > 2:  # 2 std deviations
                        anomalies.append({
                            "type": "error_spike",
                            "hour": hour,
                            "count": count,
                            "expected": avg,
                            "deviation": (count - avg) / std,
                            "description": f"Error spike detected: {count} errors vs expected {avg:.1f}",
                        })

        # Sudden drop in ratings
        ratings = [
            e for e in feedback_entries
            if hasattr(e, "feedback_type") and e.feedback_type.value == "rating"
        ]

        if len(ratings) >= self.min_sample_size * 2:
            sorted_ratings = sorted(ratings, key=lambda x: x.created_at)
            mid = len(sorted_ratings) // 2
            first_half_avg = sum(e.content.get("rating", 0) for e in sorted_ratings[:mid]) / mid
            second_half_avg = sum(e.content.get("rating", 0) for e in sorted_ratings[mid:]) / (
                len(sorted_ratings) - mid
            )

            if first_half_avg > 0 and (first_half_avg - second_half_avg) / first_half_avg > 0.2:
                anomalies.append({
                    "type": "rating_drop",
                    "before_avg": first_half_avg,
                    "after_avg": second_half_avg,
                    "change_percent": (first_half_avg - second_half_avg) / first_half_avg * 100,
                    "description": f"Rating drop detected: {first_half_avg:.1f} → {second_half_avg:.1f}",
                })

        return anomalies

    # --- Insight Generation ---

    def generate_insights(
        self,
        feedback_entries: list,
        interaction_events: list,
    ) -> list[Insight]:
        """Generate actionable insights from all available data."""
        insights = []
        now = datetime.utcnow()

        # Analyze rating trends
        rating_trend = self.analyze_rating_trends(feedback_entries)
        if rating_trend and rating_trend.is_significant:
            if rating_trend.trend_direction == "down":
                insights.append(Insight(
                    id=f"insight_rating_down_{int(time.time())}",
                    category=InsightCategory.SATISFACTION,
                    priority=InsightPriority.HIGH,
                    title="Declining User Satisfaction",
                    description=f"Average rating has dropped by {abs(rating_trend.change_percent):.1f}%",
                    evidence={"trend": rating_trend.to_dict()},
                    recommendations=[
                        "Investigate recent changes that may have impacted user experience",
                        "Review recent negative feedback for common themes",
                        "Consider user outreach to understand specific concerns",
                    ],
                    confidence=0.7,
                    tags=["satisfaction", "trend", "alert"],
                ))
            elif rating_trend.trend_direction == "up":
                insights.append(Insight(
                    id=f"insight_rating_up_{int(time.time())}",
                    category=InsightCategory.SATISFACTION,
                    priority=InsightPriority.LOW,
                    title="Improving User Satisfaction",
                    description=f"Average rating has improved by {rating_trend.change_percent:.1f}%",
                    evidence={"trend": rating_trend.to_dict()},
                    recommendations=[
                        "Document recent changes that may have contributed to improvement",
                        "Share success with the team",
                    ],
                    confidence=0.7,
                    tags=["satisfaction", "trend", "positive"],
                ))

        # Analyze error trends
        error_trend = self.analyze_error_trends(interaction_events)
        if error_trend and error_trend.trend_direction == "up" and error_trend.is_significant:
            insights.append(Insight(
                id=f"insight_errors_up_{int(time.time())}",
                category=InsightCategory.ERROR,
                priority=InsightPriority.CRITICAL,
                title="Increasing Error Rate",
                description=f"Error count has increased by {error_trend.change_percent:.1f}%",
                evidence={"trend": error_trend.to_dict()},
                recommendations=[
                    "Review error logs for common failure patterns",
                    "Check for recent deployments that may have introduced bugs",
                    "Consider rollback if critical issues are found",
                ],
                confidence=0.8,
                tags=["error", "trend", "critical"],
            ))

        # Analyze sentiment
        sentiment = self.analyze_feedback_sentiment(feedback_entries)
        if sentiment.get("total", 0) >= self.min_sample_size:
            if sentiment["sentiment_ratio"] < 0.5:
                insights.append(Insight(
                    id=f"insight_negative_sentiment_{int(time.time())}",
                    category=InsightCategory.SATISFACTION,
                    priority=InsightPriority.HIGH,
                    title="Negative Feedback Sentiment",
                    description=f"Feedback sentiment is predominantly negative (ratio: {sentiment['sentiment_ratio']:.2f})",
                    evidence={"sentiment": sentiment},
                    recommendations=[
                        "Review negative feedback for actionable improvements",
                        "Prioritize bug fixes and usability improvements",
                        "Consider user communication to address concerns",
                    ],
                    confidence=0.6,
                    tags=["sentiment", "feedback", "alert"],
                ))

        # Detect anomalies
        anomalies = self.detect_anomalies(interaction_events, feedback_entries)
        for anomaly in anomalies:
            priority = InsightPriority.HIGH if anomaly["type"] in ("error_spike", "rating_drop") else InsightPriority.MEDIUM
            insights.append(Insight(
                id=f"insight_anomaly_{anomaly['type']}_{int(time.time())}",
                category=InsightCategory.ANOMALY,
                priority=priority,
                title=f"Anomaly Detected: {anomaly['type'].replace('_', ' ').title()}",
                description=anomaly["description"],
                evidence={"anomaly": anomaly},
                recommendations=[
                    "Investigate the root cause of this anomaly",
                    "Check system logs and recent changes",
                    "Monitor for recurrence",
                ],
                confidence=0.7,
                tags=["anomaly", anomaly["type"]],
            ))

        # Detect usage patterns
        patterns = self.detect_usage_patterns(interaction_events)
        for pattern in patterns[:3]:  # Top 3 patterns
            insights.append(Insight(
                id=f"insight_pattern_{pattern['type']}_{int(time.time())}",
                category=InsightCategory.PATTERN,
                priority=InsightPriority.LOW,
                title=f"Usage Pattern: {pattern['type'].replace('_', ' ').title()}",
                description=pattern["description"],
                evidence={"pattern": pattern},
                recommendations=[
                    "Consider optimizing the user flow for this pattern",
                    "Ensure related features are easily accessible",
                ],
                confidence=0.6,
                tags=["pattern", pattern["type"]],
            ))

        # Unresolved issues insight
        unresolved = [
            e for e in feedback_entries
            if hasattr(e, "resolved") and not e.resolved
            and hasattr(e, "severity") and e.severity.value in ("high", "critical")
        ]
        if len(unresolved) >= 3:
            insights.append(Insight(
                id=f"insight_unresolved_{int(time.time())}",
                category=InsightCategory.USABILITY,
                priority=InsightPriority.HIGH,
                title="Multiple Unresolved High-Priority Issues",
                description=f"{len(unresolved)} high/critical issues remain unresolved",
                evidence={"unresolved_count": len(unresolved)},
                recommendations=[
                    "Prioritize resolution of high-severity issues",
                    "Allocate resources to address backlog",
                    "Consider user communication about known issues",
                ],
                confidence=0.9,
                tags=["unresolved", "backlog", "priority"],
            ))

        self._insights = insights
        return insights

    def save_insights(self, filename: Optional[str] = None) -> Path:
        """Save current insights to a file."""
        filename = filename or f"insights_{int(time.time())}.json"
        path = self.storage_path / filename

        data = [i.to_dict() for i in self._insights]
        with open(path, "w") as f:
            json.dump(data, f, indent=2)

        return path

    def get_summary(self) -> dict:
        """Get a summary of the latest analysis."""
        if not self._insights:
            return {"total": 0}

        by_category = defaultdict(int)
        by_priority = defaultdict(int)

        for insight in self._insights:
            by_category[insight.category.value] += 1
            by_priority[insight.priority.value] += 1

        return {
            "total": len(self._insights),
            "by_category": dict(by_category),
            "by_priority": dict(by_priority),
            "high_priority_count": by_priority.get("high", 0) + by_priority.get("critical", 0),
            "generated_at": datetime.utcnow().isoformat(),
        }
