# systems/pixel_compiler/tests/test_a2a_benchmark.py
import pytest
from systems.pixel_compiler.a2a_load_test.benchmark_suite import (
    BenchmarkSuite,
    BenchmarkConfig,
    BenchmarkResult
)


class TestBenchmarkConfig:
    """Tests for benchmark configuration."""

    def test_default_config(self):
        """Default config has reasonable values."""
        config = BenchmarkConfig()

        assert config.agent_counts == [10, 50, 100]
        assert config.message_counts == [100, 500, 1000]
        assert config.topologies == ["star", "mesh", "ring"]

    def test_custom_config(self):
        """Custom config overrides defaults."""
        config = BenchmarkConfig(
            agent_counts=[5, 10],
            message_counts=[50],
            topologies=["star"]
        )

        assert config.agent_counts == [5, 10]
        assert config.message_counts == [50]
        assert config.topologies == ["star"]


class TestBenchmarkSuite:
    """Tests for the benchmark suite."""

    @pytest.mark.asyncio
    async def test_run_single_benchmark(self):
        """Suite can run a single benchmark."""
        config = BenchmarkConfig(
            agent_counts=[2],
            message_counts=[10],
            topologies=["star"]
        )

        suite = BenchmarkSuite(
            router_url="ws://localhost:8766",
            config=config
        )

        results = await suite.run()

        assert len(results) >= 1
        assert all(r.success for r in results)

    @pytest.mark.asyncio
    async def test_benchmark_generates_report(self):
        """Suite generates a summary report."""
        config = BenchmarkConfig(
            agent_counts=[2, 3],
            message_counts=[10],
            topologies=["star"]
        )

        suite = BenchmarkSuite(
            router_url="ws://localhost:8766",
            config=config
        )

        await suite.run()
        report = suite.get_report()

        assert "summary" in report
        assert "results" in report
        assert "config" in report

    @pytest.mark.asyncio
    async def test_benchmark_saves_json(self):
        """Suite can save results to JSON."""
        import tempfile
        import os

        config = BenchmarkConfig(
            agent_counts=[2],
            message_counts=[10],
            topologies=["star"]
        )

        suite = BenchmarkSuite(
            router_url="ws://localhost:8766",
            config=config
        )

        await suite.run()

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            temp_path = f.name

        try:
            suite.save_report(temp_path)

            assert os.path.exists(temp_path)

            import json
            with open(temp_path) as f:
                data = json.load(f)

            assert "summary" in data
        finally:
            os.unlink(temp_path)


class TestCLI:
    """Tests for CLI entry point."""

    def test_cli_import(self):
        """CLI module can be imported."""
        from systems.pixel_compiler.a2a_load_test.cli import main
        assert callable(main)

    def test_cli_parse_args(self):
        """CLI parses arguments correctly."""
        from systems.pixel_compiler.a2a_load_test.cli import parse_args

        args = parse_args([
            "--agents", "10,50,100",
            "--messages", "100,500",
            "--topologies", "star,mesh",
            "--output", "results.json"
        ])

        assert args.agents == [10, 50, 100]
        assert args.messages == [100, 500]
        assert args.topologies == ["star", "mesh"]
        assert args.output == "results.json"
