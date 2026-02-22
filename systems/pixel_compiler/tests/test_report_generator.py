# systems/pixel_compiler/tests/test_report_generator.py
import pytest
import json
from systems.pixel_compiler.a2a_load_test.report_generator import (
    StressTestReport,
    ReportGenerator
)


class TestStressTestReport:
    """Tests for stress test report."""

    def test_report_creation(self):
        """Can create a stress test report."""
        report = StressTestReport(title="Scale Test Report")

        assert report.title == "Scale Test Report"
        assert report.results == []

    def test_add_scenario_result(self):
        """Can add scenario results."""
        report = StressTestReport(title="Test")
        report.add_result(
            scenario="quick",
            agent_count=50,
            success=True,
            throughput=1000,
            avg_latency_ms=5.0
        )

        assert len(report.results) == 1
        assert report.results[0]["scenario"] == "quick"
        assert report.results[0]["agent_count"] == 50

    def test_generate_markdown(self):
        """Can generate markdown report."""
        report = StressTestReport(title="Scale Test")
        report.add_result("quick", 50, True, 1000, 5.0)
        report.add_result("extreme", 1000, False, 100, 500.0)

        md = report.to_markdown()

        assert "# Scale Test" in md
        assert "quick" in md
        assert "extreme" in md
        assert "1000" in md  # throughput

    def test_generate_json(self):
        """Can generate JSON report."""
        report = StressTestReport(title="Scale Test")
        report.add_result("quick", 50, True, 1000, 5.0)

        json_str = report.to_json()
        data = json.loads(json_str)

        assert data["title"] == "Scale Test"
        assert data["results"][0]["scenario"] == "quick"

    def test_recommendations_success(self):
        """Report includes success recommendations."""
        report = StressTestReport(title="Scale Test")
        report.add_result("quick", 50, True, 1000, 5.0)

        recommendations = report.get_recommendations()

        assert len(recommendations) > 0
        assert any("pass" in r.lower() or "ready" in r.lower() for r in recommendations)

    def test_recommendations_failure(self):
        """Report includes failure recommendations."""
        report = StressTestReport(title="Scale Test")
        report.add_result("extreme", 1000, False, 100, 500.0)

        recommendations = report.get_recommendations()

        assert any("fail" in r.lower() or "investigate" in r.lower() for r in recommendations)


class TestReportGenerator:
    """Tests for report generator."""

    def test_generator_creation(self):
        """Can create a report generator."""
        generator = ReportGenerator(output_dir="./reports")

        assert generator.output_dir == "./reports"

    def test_generate_multiple_formats(self):
        """Can generate report in multiple formats."""
        generator = ReportGenerator()
        report = StressTestReport(title="Test")
        report.add_result("quick", 50, True, 1000, 5.0)

        outputs = generator.generate(report, formats=["markdown", "json"])

        assert "markdown" in outputs
        assert "json" in outputs
