# systems/pixel_compiler/tests/test_benchmark_dashboard.py
"""
Test suite for BenchmarkDashboard.
"""

import pytest
from pathlib import Path
import tempfile


def test_dashboard_framework_exists():
    """Test that dashboard framework is available."""
    from systems.pixel_compiler.benchmark_dashboard import BenchmarkDashboard
    with tempfile.TemporaryDirectory() as tmpdir:
        bench = BenchmarkDashboard(results_dir=tmpdir)
        assert bench is not None


def test_dashboard_load_empty_history():
    """Test that dashboard loads empty history correctly."""
    from systems.pixel_compiler.benchmark_dashboard import BenchmarkDashboard
    with tempfile.TemporaryDirectory() as tmpdir:
        bench = BenchmarkDashboard(results_dir=tmpdir)
        history = bench.load_history()
        assert history == []


def test_dashboard_generate_html():
    """Test that dashboard generates HTML file."""
    from systems.pixel_compiler.benchmark_dashboard import BenchmarkDashboard
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        bench = BenchmarkDashboard(results_dir=str(tmpdir))

        # Create sample benchmark history
        history_file = tmpdir / "benchmark_history.jsonl"
        history_file.write_text('{"test_name":"test1","data_size":1048576,"encode_time":0.5,"decode_time":0.3,"total_time":0.8,"throughput_mb_sec":1.25}\n')

        output = bench.generate_html(output_path=str(tmpdir / "dashboard.html"))

        assert Path(output).exists()
        html_content = Path(output).read_text()
        assert "PixelRTS Performance Dashboard" in html_content
        assert "test1" in html_content
