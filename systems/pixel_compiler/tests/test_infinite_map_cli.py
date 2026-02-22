#!/usr/bin/env python3
"""
Tests for Infinite Map Advanced CLI.

Tests CLI commands for Infinite Map management.
"""

import pytest
import tempfile
import json
from pathlib import Path
from systems.pixel_compiler.infinite_map_cli import InfiniteMapCLI


def test_cli_initialization():
    """CLI initializes with all managers."""
    cli = InfiniteMapCLI()

    assert cli.vat_parser is not None
    assert cli.vat_inspector is not None


def test_cmd_info_on_test_image():
    """Info command shows map information."""
    # This test requires a test image - we'll create minimal test
    cli = InfiniteMapCLI()

    # Create mock args object
    class Args:
        image = "nonexistent.rts.png"

    args = Args()

    # Will fail gracefully for nonexistent file
    result = cli.cmd_info(args)
    # Returns non-zero on error
    assert result != 0  # Expected to fail for nonexistent file


def test_cmd_find_nonexistent_file():
    """Find command returns error for nonexistent file."""
    cli = InfiniteMapCLI()

    class Args:
        image = "nonexistent.rts.png"
        filename = "test.txt"

    args = Args()

    result = cli.cmd_find(args)
    assert result != 0  # Expected to fail


def test_cmd_analyze_with_empty_history():
    """Analyze command works with empty history."""
    cli = InfiniteMapCLI()

    class Args:
        history = None
        hot = 10

    args = Args()

    result = cli.cmd_analyze(args)
    assert result == 0  # Should succeed


def test_cmd_predict_with_demo_data():
    """Predict command uses demo data."""
    cli = InfiniteMapCLI()

    class Args:
        history = None
        demo = True
        files = ["boot/vmlinuz", "etc/config.json"]

    args = Args()

    result = cli.cmd_predict(args)
    assert result == 0  # Should succeed


def test_cmd_predict_without_data():
    """Predict command handles missing data gracefully."""
    cli = InfiniteMapCLI()

    class Args:
        history = None
        demo = False
        files = ["some/file"]

    args = Args()

    result = cli.cmd_predict(args)
    # Should still succeed (just shows "no data")
    assert result == 0


def test_cmd_snapshot_list_empty():
    """Snapshot list command works with empty storage."""
    with tempfile.TemporaryDirectory() as tmpdir:
        cli = InfiniteMapCLI()

        class Args:
            action = 'list'
            image = None
            snapshot_id = None
            description = None
            storage_dir = tmpdir

        args = Args()

        result = cli.cmd_snapshot(args)
        assert result == 0  # Should succeed


def test_cmd_snapshot_delete_nonexistent():
    """Snapshot delete handles nonexistent snapshot."""
    with tempfile.TemporaryDirectory() as tmpdir:
        cli = InfiniteMapCLI()

        class Args:
            action = 'delete'
            image = None
            snapshot_id = "nonexistent"
            description = None
            storage_dir = tmpdir

        args = Args()

        result = cli.cmd_snapshot(args)
        assert result != 0  # Should fail for nonexistent


def test_cmd_snapshot_restore_nonexistent():
    """Snapshot restore handles nonexistent snapshot."""
    with tempfile.TemporaryDirectory() as tmpdir:
        cli = InfiniteMapCLI()

        class Args:
            action = 'restore'
            image = None
            snapshot_id = "nonexistent"
            description = None
            storage_dir = tmpdir

        args = Args()

        result = cli.cmd_snapshot(args)
        assert result != 0  # Should fail for nonexistent


def test_main_function_exists():
    """Main function is callable."""
    from systems.pixel_compiler.infinite_map_cli import main

    # Should be callable
    assert callable(main)


def test_cli_has_all_commands():
    """CLI has all expected commands."""
    cli = InfiniteMapCLI()

    # Check all command methods exist
    commands = [
        'cmd_info',
        'cmd_find',
        'cmd_analyze',
        'cmd_predict',
        'cmd_zone',
        'cmd_compress',
        'cmd_prefetch',
        'cmd_snapshot'
    ]

    for cmd in commands:
        assert hasattr(cli, cmd), f"Missing command: {cmd}"
        assert callable(getattr(cli, cmd)), f"Command not callable: {cmd}"
