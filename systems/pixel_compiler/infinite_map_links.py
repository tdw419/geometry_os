#!/usr/bin/env python3
"""
Infinite Map Links System.

Provides symbolic link (symlink) and hard link support for the
Infinite Map filesystem.

Key Components:
- LinkEntry: Represents a symbolic or hard link
- LinkTable: Manages link storage and resolution
- LinkResolver: Resolves links to their targets
- LinkManager: Unified link management interface

Usage:
    from infinite_map_links import LinkManager

    manager = LinkManager(vat, link_table_path="links.json")

    # Create symbolic link
    manager.create_symlink("/home/user/link", "/home/user/target")

    # Create hard link
    manager.create_hardlink("/home/user/hardlink", "/home/user/target")

    # Resolve link
    target = manager.resolve("/home/user/link")

    # Get link info
    info = manager.get_link_info("/home/user/link")
"""

import os
import json
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple, Set
from datetime import datetime
from enum import Enum
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class LinkType(Enum):
    """Type of link."""
    SYMLINK = "symlink"
    HARDLINK = "hardlink"


class LinkState(Enum):
    """State of a link."""
    VALID = "valid"
    BROKEN = "broken"      # Target doesn't exist
    CIRCULAR = "circular"  # Circular reference detected
    DEEP = "deep"          # Too many levels of symlinks


@dataclass
class LinkEntry:
    """Represents a symbolic or hard link."""
    link_path: str
    target_path: str
    link_type: LinkType
    created_at: datetime
    inode: Optional[int] = None  # For hard links, shared inode with target
    ref_count: int = 1           # Reference count for hard links

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "link_path": self.link_path,
            "target_path": self.target_path,
            "link_type": self.link_type.value,
            "created_at": self.created_at.isoformat(),
            "inode": self.inode,
            "ref_count": self.ref_count
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "LinkEntry":
        """Create from dictionary."""
        return cls(
            link_path=data["link_path"],
            target_path=data["target_path"],
            link_type=LinkType(data["link_type"]),
            created_at=datetime.fromisoformat(data["created_at"]),
            inode=data.get("inode"),
            ref_count=data.get("ref_count", 1)
        )


@dataclass
class LinkInfo:
    """Information about a link."""
    link_path: str
    target_path: str
    link_type: LinkType
    state: LinkState
    resolved_path: Optional[str] = None
    chain: List[str] = field(default_factory=list)
    error: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "link_path": self.link_path,
            "target_path": self.target_path,
            "link_type": self.link_type.value,
            "state": self.state.value,
            "resolved_path": self.resolved_path,
            "chain": self.chain,
            "error": self.error
        }


@dataclass
class InodeEntry:
    """Tracks inode information for hard links."""
    inode: int
    original_path: str
    ref_count: int = 1
    hardlinks: Set[str] = field(default_factory=set)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "inode": self.inode,
            "original_path": self.original_path,
            "ref_count": self.ref_count,
            "hardlinks": list(self.hardlinks)
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "InodeEntry":
        """Create from dictionary."""
        return cls(
            inode=data["inode"],
            original_path=data["original_path"],
            ref_count=data.get("ref_count", 1),
            hardlinks=set(data.get("hardlinks", []))
        )


class LinkTable:
    """
    Manages link storage and retrieval.

    Stores links in a JSON file with atomic updates.
    """

    def __init__(self, table_path: str):
        self.table_path = Path(table_path)
        self.links: Dict[str, LinkEntry] = {}  # link_path -> LinkEntry
        self.inodes: Dict[int, InodeEntry] = {}  # inode -> InodeEntry
        self.path_to_inode: Dict[str, int] = {}  # original_path -> inode
        self.next_inode: int = 1
        self.lock = threading.RLock()
        self._load()

    def _load(self):
        """Load link table from disk."""
        if self.table_path.exists():
            try:
                with open(self.table_path, "r") as f:
                    data = json.load(f)
                    self.links = {
                        k: LinkEntry.from_dict(v)
                        for k, v in data.get("links", {}).items()
                    }
                    self.inodes = {
                        int(k): InodeEntry.from_dict(v)
                        for k, v in data.get("inodes", {}).items()
                    }
                    self.next_inode = data.get("next_inode", 1)
                    # Rebuild path_to_inode from inodes
                    self.path_to_inode = {}
                    for inode, entry in self.inodes.items():
                        self.path_to_inode[entry.original_path] = inode
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Failed to load link table: {e}")
                self.links = {}
                self.inodes = {}
                self.path_to_inode = {}

    def _save(self):
        """Save link table to disk."""
        with self.lock:
            data = {
                "version": 1,
                "links": {k: v.to_dict() for k, v in self.links.items()},
                "inodes": {str(k): v.to_dict() for k, v in self.inodes.items()},
                "next_inode": self.next_inode
            }
            # Atomic write
            temp_path = self.table_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.table_path)

    def add_link(self, entry: LinkEntry) -> str:
        """Add a link to the table."""
        with self.lock:
            self.links[entry.link_path] = entry
            self._save()
            return entry.link_path

    def get_link(self, link_path: str) -> Optional[LinkEntry]:
        """Get link by path."""
        with self.lock:
            return self.links.get(link_path)

    def remove_link(self, link_path: str) -> bool:
        """Remove a link from the table."""
        with self.lock:
            if link_path in self.links:
                entry = self.links[link_path]

                # Handle hard link reference counting
                if entry.link_type == LinkType.HARDLINK and entry.inode:
                    if entry.inode in self.inodes:
                        inode_entry = self.inodes[entry.inode]
                        inode_entry.ref_count -= 1
                        inode_entry.hardlinks.discard(link_path)

                        if inode_entry.ref_count <= 0:
                            del self.inodes[entry.inode]

                del self.links[link_path]
                self._save()
                return True
            return False

    def allocate_inode(self, original_path: str) -> int:
        """Allocate a new inode for hard links."""
        with self.lock:
            inode = self.next_inode
            self.next_inode += 1
            self.inodes[inode] = InodeEntry(
                inode=inode,
                original_path=original_path
            )
            self.path_to_inode[original_path] = inode
            self._save()
            return inode

    def get_inode_for_path(self, path: str) -> Optional[int]:
        """Get inode for a path if it has one."""
        with self.lock:
            return self.path_to_inode.get(path)

    def get_inode(self, inode: int) -> Optional[InodeEntry]:
        """Get inode entry by inode number."""
        with self.lock:
            return self.inodes.get(inode)

    def add_hardlink_to_inode(self, inode: int, link_path: str) -> bool:
        """Add a hard link to an existing inode."""
        with self.lock:
            if inode in self.inodes:
                entry = self.inodes[inode]
                entry.ref_count += 1
                entry.hardlinks.add(link_path)
                self._save()
                return True
            return False

    def get_links_by_inode(self, inode: int) -> List[str]:
        """Get all paths sharing an inode."""
        with self.lock:
            if inode in self.inodes:
                entry = self.inodes[inode]
                return [entry.original_path] + list(entry.hardlinks)
            return []

    def list_symlinks(self) -> List[LinkEntry]:
        """List all symbolic links."""
        with self.lock:
            return [e for e in self.links.values() if e.link_type == LinkType.SYMLINK]

    def list_hardlinks(self) -> List[LinkEntry]:
        """List all hard links."""
        with self.lock:
            return [e for e in self.links.values() if e.link_type == LinkType.HARDLINK]

    def get_stats(self) -> Dict[str, int]:
        """Get link table statistics."""
        with self.lock:
            symlinks = sum(1 for e in self.links.values() if e.link_type == LinkType.SYMLINK)
            hardlinks = sum(1 for e in self.links.values() if e.link_type == LinkType.HARDLINK)
            return {
                "total_links": len(self.links),
                "symlinks": symlinks,
                "hardlinks": hardlinks,
                "inodes": len(self.inodes)
            }


class LinkResolver:
    """
    Resolves links to their targets.

    Handles circular detection and maximum depth limits.
    """

    MAX_SYMLINK_DEPTH = 40  # Linux default

    def __init__(self, link_table: LinkTable, vat):
        self.link_table = link_table
        self.vat = vat

    def resolve(
        self,
        path: str,
        follow_symlinks: bool = True,
        max_depth: int = None
    ) -> Tuple[LinkState, Optional[str], List[str]]:
        """
        Resolve a path, following symlinks if requested.

        Args:
            path: Path to resolve
            follow_symlinks: Whether to follow symlinks
            max_depth: Maximum symlink depth (default: MAX_SYMLINK_DEPTH)

        Returns:
            Tuple of (state, resolved_path, resolution_chain)
        """
        if max_depth is None:
            max_depth = self.MAX_SYMLINK_DEPTH

        chain = [path]
        current = path
        visited = set()

        for depth in range(max_depth + 1):
            # Check for circular reference
            if current in visited:
                return LinkState.CIRCULAR, current, chain
            visited.add(current)

            # Check if current path is a link
            link = self.link_table.get_link(current)

            if link is None:
                # Not a link - check if target exists
                if self._path_exists(current):
                    return LinkState.VALID, current, chain
                else:
                    return LinkState.BROKEN, current, chain

            if link.link_type == LinkType.HARDLINK:
                # Hard links point directly to inode data
                if link.inode and self.link_table.get_inode(link.inode):
                    inode_entry = self.link_table.get_inode(link.inode)
                    return LinkState.VALID, inode_entry.original_path, chain
                return LinkState.BROKEN, current, chain

            # It's a symlink
            if not follow_symlinks:
                # Don't follow - return the symlink itself
                if self._path_exists(link.target_path):
                    return LinkState.VALID, current, chain
                else:
                    return LinkState.BROKEN, current, chain

            # Check depth
            if depth >= max_depth:
                return LinkState.DEEP, current, chain

            # Follow the symlink
            current = link.target_path
            chain.append(current)

        return LinkState.DEEP, current, chain

    def resolve_parent(self, path: str) -> Tuple[str, str]:
        """
        Resolve parent directory and basename.

        Handles symlinks in parent path components.

        Returns:
            Tuple of (resolved_parent, basename)
        """
        parent = str(Path(path).parent)
        basename = Path(path).name

        # Resolve parent directory
        state, resolved_parent, _ = self.resolve(parent, follow_symlinks=True)

        if state != LinkState.VALID:
            return parent, basename

        return resolved_parent, basename

    def get_link_info(self, path: str) -> Optional[LinkInfo]:
        """Get detailed information about a link."""
        link = self.link_table.get_link(path)

        if link is None:
            return None

        state, resolved, chain = self.resolve(path, follow_symlinks=True)

        return LinkInfo(
            link_path=path,
            target_path=link.target_path,
            link_type=link.link_type,
            state=state,
            resolved_path=resolved,
            chain=chain
        )

    def _path_exists(self, path: str) -> bool:
        """Check if a path exists in the VAT."""
        if self.vat is None:
            return True  # Assume exists if no VAT

        try:
            if hasattr(self.vat, "lookup"):
                result = self.vat.lookup(path)
                return result is not None
            elif hasattr(self.vat, "entries"):
                return path in self.vat.entries
        except Exception:
            pass

        return False


class LinkManager:
    """
    Unified link management interface.

    Coordinates symlink and hardlink creation, resolution,
    and deletion.
    """

    def __init__(self, vat, link_table_path: str):
        self.vat = vat
        self.link_table = LinkTable(link_table_path)
        self.resolver = LinkResolver(self.link_table, vat)
        self.lock = threading.RLock()

    def create_symlink(
        self,
        link_path: str,
        target_path: str
    ) -> Tuple[bool, str]:
        """
        Create a symbolic link.

        Args:
            link_path: Path for the new symlink
            target_path: Path the symlink points to

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            # Check if link already exists
            if self.link_table.get_link(link_path):
                return False, f"Link already exists: {link_path}"

            # Normalize paths
            link_path = self._normalize_path(link_path)
            target_path = self._normalize_path(target_path)

            # Create link entry
            entry = LinkEntry(
                link_path=link_path,
                target_path=target_path,
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )

            self.link_table.add_link(entry)
            logger.info(f"Created symlink: {link_path} -> {target_path}")

            return True, f"Symlink created: {link_path} -> {target_path}"

    def create_hardlink(
        self,
        link_path: str,
        target_path: str
    ) -> Tuple[bool, str]:
        """
        Create a hard link.

        Args:
            link_path: Path for the new hardlink
            target_path: Path to the original file

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            # Check if link already exists
            if self.link_table.get_link(link_path):
                return False, f"Link already exists: {link_path}"

            # Normalize paths
            link_path = self._normalize_path(link_path)
            target_path = self._normalize_path(target_path)

            # Check if target exists
            if not self.resolver._path_exists(target_path):
                return False, f"Target does not exist: {target_path}"

            # Check if target already has an inode (from previous hardlink or allocation)
            existing_inode = self.link_table.get_inode_for_path(target_path)

            if existing_inode is not None:
                # Add to existing inode
                inode = existing_inode
                self.link_table.add_hardlink_to_inode(inode, link_path)
                inode_entry = self.link_table.get_inode(inode)

                entry = LinkEntry(
                    link_path=link_path,
                    target_path=target_path,
                    link_type=LinkType.HARDLINK,
                    created_at=datetime.now(),
                    inode=inode,
                    ref_count=inode_entry.ref_count
                )
            else:
                # Allocate new inode for the original file
                inode = self.link_table.allocate_inode(target_path)

                entry = LinkEntry(
                    link_path=link_path,
                    target_path=target_path,
                    link_type=LinkType.HARDLINK,
                    created_at=datetime.now(),
                    inode=inode,
                    ref_count=2  # Original + this hardlink
                )

                # Update inode with hardlink
                self.link_table.add_hardlink_to_inode(inode, link_path)

            self.link_table.add_link(entry)
            logger.info(f"Created hardlink: {link_path} -> {target_path} (inode: {inode})")

            return True, f"Hardlink created: {link_path} -> {target_path}"

    def resolve(
        self,
        path: str,
        follow_symlinks: bool = True
    ) -> Tuple[LinkState, Optional[str]]:
        """
        Resolve a path.

        Args:
            path: Path to resolve
            follow_symlinks: Whether to follow symlinks

        Returns:
            Tuple of (state, resolved_path)
        """
        state, resolved, _ = self.resolver.resolve(path, follow_symlinks)
        return state, resolved

    def readlink(self, path: str) -> Tuple[bool, Optional[str]]:
        """
        Read the target of a symbolic link.

        Returns:
            Tuple of (success, target_path or error_message)
        """
        link = self.link_table.get_link(path)

        if link is None:
            return False, f"Not a symbolic link: {path}"

        if link.link_type != LinkType.SYMLINK:
            return False, f"Not a symbolic link: {path}"

        return True, link.target_path

    def unlink(self, path: str) -> Tuple[bool, str]:
        """
        Remove a link.

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            link = self.link_table.get_link(path)

            if link is None:
                return False, f"Not a link: {path}"

            success = self.link_table.remove_link(path)

            if success:
                logger.info(f"Removed link: {path}")
                return True, f"Link removed: {path}"
            else:
                return False, f"Failed to remove link: {path}"

    def get_link_info(self, path: str) -> Optional[LinkInfo]:
        """Get detailed information about a link."""
        return self.resolver.get_link_info(path)

    def is_link(self, path: str) -> bool:
        """Check if path is a link."""
        return self.link_table.get_link(path) is not None

    def is_symlink(self, path: str) -> bool:
        """Check if path is a symbolic link."""
        link = self.link_table.get_link(path)
        return link is not None and link.link_type == LinkType.SYMLINK

    def is_hardlink(self, path: str) -> bool:
        """Check if path is a hard link."""
        link = self.link_table.get_link(path)
        return link is not None and link.link_type == LinkType.HARDLINK

    def get_hardlinks(self, inode: int) -> List[str]:
        """Get all paths sharing an inode."""
        return self.link_table.get_links_by_inode(inode)

    def get_ref_count(self, inode: int) -> int:
        """Get reference count for an inode."""
        inode_entry = self.link_table.get_inode(inode)
        return inode_entry.ref_count if inode_entry else 0

    def list_broken_links(self) -> List[LinkInfo]:
        """List all broken links."""
        broken = []
        for link in self.link_table.links.values():
            info = self.get_link_info(link.link_path)
            if info and info.state == LinkState.BROKEN:
                broken.append(info)
        return broken

    def list_symlinks(self) -> List[LinkEntry]:
        """List all symbolic links."""
        return self.link_table.list_symlinks()

    def list_hardlinks(self) -> List[LinkEntry]:
        """List all hard links."""
        return self.link_table.list_hardlinks()

    def get_stats(self) -> Dict[str, Any]:
        """Get link manager statistics."""
        table_stats = self.link_table.get_stats()

        # Add broken link count
        broken = len(self.list_broken_links())

        return {
            **table_stats,
            "broken_links": broken
        }

    def _normalize_path(self, path: str) -> str:
        """Normalize a path."""
        # Remove trailing slash, resolve . and ..
        return str(Path(path).resolve())


# Convenience functions

def create_symlink(link_path: str, target_path: str, table_path: str = "links.json") -> bool:
    """Create a symbolic link."""
    manager = LinkManager(None, table_path)
    success, _ = manager.create_symlink(link_path, target_path)
    return success


def create_hardlink(link_path: str, target_path: str, table_path: str = "links.json") -> bool:
    """Create a hard link."""
    manager = LinkManager(None, table_path)
    success, _ = manager.create_hardlink(link_path, target_path)
    return success


def resolve_link(path: str, table_path: str = "links.json") -> Optional[str]:
    """Resolve a link to its target."""
    manager = LinkManager(None, table_path)
    state, resolved = manager.resolve(path)
    return resolved if state == LinkState.VALID else None
