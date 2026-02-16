"""
Heartbeat Test: Virtual File System

Verifies that VFS operations work correctly.
This tests the file operations that the evolution daemon uses for self-modification.
"""

import os
import tempfile
import pytest
from pathlib import Path


def test_vfs_import():
    """Test that VirtualFileSystem can be imported"""
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem
    assert VirtualFileSystem is not None


def test_vfs_read_file():
    """Test that VFS can read files"""
    import asyncio
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem

    async def test_read():
        vfs = VirtualFileSystem(".")
        content = await vfs.read_file("README.md")
        assert content is not None
        assert len(content) > 0
        return content

    result = asyncio.run(test_read())
    assert len(result) > 0


def test_vfs_list_files():
    """Test that VFS can list Python files"""
    import asyncio
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem

    async def test_list():
        vfs = VirtualFileSystem(".")
        files = await vfs.list_files("*.py")
        assert isinstance(files, list)
        assert len(files) > 0
        return files

    result = asyncio.run(test_list())
    assert any("evolution_daemon" in f for f in result)


def test_vfs_write_and_read():
    """Test that VFS can write and read back a file"""
    import asyncio
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem

    async def test_write_read():
        with tempfile.TemporaryDirectory() as tmpdir:
            vfs = VirtualFileSystem(tmpdir)

            test_content = "# Test file\nprint('hello')"
            test_path = "test_file.py"

            # Write
            success = await vfs.write_file(test_path, test_content)
            assert success is True

            # Read back
            content = await vfs.read_file(test_path)
            assert content == test_content

            return True

    result = asyncio.run(test_write_read())
    assert result is True


def test_vfs_backup_creation():
    """Test that VFS creates backups when overwriting files"""
    import asyncio
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem

    async def test_backup():
        with tempfile.TemporaryDirectory() as tmpdir:
            vfs = VirtualFileSystem(tmpdir)

            test_path = "test_backup.py"
            original = "original content"
            modified = "modified content"

            # Write original
            await vfs.write_file(test_path, original)

            # Overwrite (should create backup)
            await vfs.write_file(test_path, modified)

            # Check backup exists
            backup_path = Path(tmpdir) / (test_path + ".bak")
            assert backup_path.exists()
            assert backup_path.read_text() == original

            # Check current content
            current = await vfs.read_file(test_path)
            assert current == modified

            return True

    result = asyncio.run(test_backup())
    assert result is True


def test_vfs_file_not_found():
    """Test that VFS raises FileNotFoundError for missing files"""
    import asyncio
    from systems.evolution_daemon.evolution_daemon import VirtualFileSystem

    async def test_not_found():
        vfs = VirtualFileSystem(".")
        try:
            await vfs.read_file("nonexistent_file_xyz123.py")
            return False
        except FileNotFoundError:
            return True

    result = asyncio.run(test_not_found())
    assert result is True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
