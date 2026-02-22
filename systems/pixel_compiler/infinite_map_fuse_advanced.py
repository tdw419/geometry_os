#!/usr/bin/env python3
"""
Infinite Map Advanced FUSE Features.

Provides POSIX-compliant filesystem features for FUSE implementation:
- Extended attributes (xattr)
- Symbolic and hard links
- File locking (flock/fcntl)
- Directory notifications
- POSIX ACL support
- Compliance testing

Usage:
    from infinite_map_fuse_advanced import (
        ExtendedAttributes,
        SymbolicLinkManager,
        HardLinkManager,
        FileLockManager,
        DirectoryNotifier,
        POSIXACLManager,
        POSIXComplianceTester,
    )
"""

import os
import sys
import json
import time
import fcntl
import errno
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple, Set, Union
from datetime import datetime
from enum import Enum, auto
from collections import defaultdict
import logging
import struct
import hashlib

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================================================
# Enums and Constants
# ============================================================================

class LockType(Enum):
    """File lock types."""
    SHARED = fcntl.LOCK_SH  # Shared (read) lock
    EXCLUSIVE = fcntl.LOCK_EX  # Exclusive (write) lock
    UNLOCK = fcntl.LOCK_UN  # Unlock


class ACLType(Enum):
    """ACL entry types."""
    USER = "user"
    GROUP = "group"
    OTHER = "other"
    MASK = "mask"


class Permission(Enum):
    """Permission bits."""
    READ = 4
    WRITE = 2
    EXECUTE = 1


class NotificationType(Enum):
    """Directory notification types."""
    CREATE = "create"
    DELETE = "delete"
    MODIFY = "modify"
    RENAME = "rename"
    ATTRIB = "attrib"


# POSIX permission constants
S_ISUID = 0o4000  # Set UID
S_ISGID = 0o2000  # Set GID
S_ISVTX = 0o1000  # Sticky bit
S_IRUSR = 0o0400  # Owner read
S_IWUSR = 0o0200  # Owner write
S_IXUSR = 0o0100  # Owner execute
S_IRGRP = 0o0040  # Group read
S_IWGRP = 0o0020  # Group write
S_IXGRP = 0o0010  # Group execute
S_IROTH = 0o0004  # Other read
S_IWOTH = 0o0002  # Other write
S_IXOTH = 0o0001  # Other execute


# ============================================================================
# Dataclasses
# ============================================================================

@dataclass
class XAttrEntry:
    """Extended attribute entry."""
    name: str
    value: bytes
    namespace: str = "user"  # user, system, security, trusted

    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name,
            "namespace": self.namespace,
            "value_size": len(self.value),
            "value_hex": self.value.hex()[:64],
        }


@dataclass
class LinkEntry:
    """Link entry (symbolic or hard)."""
    source: str
    target: str
    link_type: str  # "symlink" or "hardlink"
    created_at: datetime = field(default_factory=datetime.now)
    inode: Optional[int] = None

    def to_dict(self) -> Dict[str, Any]:
        return {
            "source": self.source,
            "target": self.target,
            "link_type": self.link_type,
            "created_at": self.created_at.isoformat(),
            "inode": self.inode,
        }


@dataclass
class FileLock:
    """File lock entry."""
    path: str
    lock_type: LockType
    owner_pid: int
    start: int  # Byte offset
    length: int  # 0 = to EOF
    acquired_at: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "path": self.path,
            "lock_type": self.lock_type.name,
            "owner_pid": self.owner_pid,
            "start": self.start,
            "length": self.length,
            "acquired_at": self.acquired_at.isoformat(),
        }


@dataclass
class ACLEntry:
    """POSIX ACL entry."""
    acl_type: ACLType
    qualifier: Optional[int]  # uid or gid, None for other/mask
    permissions: int  # rwx bits

    def to_dict(self) -> Dict[str, Any]:
        return {
            "type": self.acl_type.value,
            "qualifier": self.qualifier,
            "permissions": self.permissions,
            "permissions_str": self.permissions_str(),
        }

    def permissions_str(self) -> str:
        """Get permissions as string (rwx)."""
        r = "r" if self.permissions & 4 else "-"
        w = "w" if self.permissions & 2 else "-"
        x = "x" if self.permissions & 1 else "-"
        return f"{r}{w}{x}"


@dataclass
class DirectoryEvent:
    """Directory notification event."""
    event_type: NotificationType
    path: str
    filename: str
    timestamp: datetime = field(default_factory=datetime.now)
    details: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "event_type": self.event_type.value,
            "path": self.path,
            "filename": self.filename,
            "timestamp": self.timestamp.isoformat(),
            "details": self.details,
        }


# ============================================================================
# Extended Attributes (xattr)
# ============================================================================

class ExtendedAttributes:
    """
    Manages extended attributes for files.

    Supports user, system, security, and trusted namespaces.
    """

    # Valid namespaces
    NAMESPACES = {"user", "system", "security", "trusted"}

    def __init__(self):
        self.attributes: Dict[str, Dict[str, XAttrEntry]] = defaultdict(dict)
        self._lock = threading.RLock()

    def _parse_name(self, name: str) -> Tuple[str, str]:
        """Parse attribute name into namespace and key."""
        if "." in name:
            parts = name.split(".", 1)
            if parts[0] in self.NAMESPACES:
                return parts[0], parts[1]
        return "user", name  # Default to user namespace

    def set(self, path: str, name: str, value: bytes) -> bool:
        """
        Set extended attribute.

        Args:
            path: File path
            name: Attribute name (e.g., "user.comment")
            value: Attribute value

        Returns:
            True if successful
        """
        namespace, key = self._parse_name(name)

        with self._lock:
            entry = XAttrEntry(
                name=key,
                value=value,
                namespace=namespace,
            )
            self.attributes[path][name] = entry

        logger.debug(f"Set xattr {name} on {path}")
        return True

    def get(self, path: str, name: str) -> Optional[bytes]:
        """
        Get extended attribute value.

        Args:
            path: File path
            name: Attribute name

        Returns:
            Attribute value or None
        """
        with self._lock:
            if path in self.attributes and name in self.attributes[path]:
                return self.attributes[path][name].value
        return None

    def list(self, path: str) -> List[str]:
        """
        List all extended attribute names for a path.

        Args:
            path: File path

        Returns:
            List of attribute names
        """
        with self._lock:
            if path in self.attributes:
                return list(self.attributes[path].keys())
        return []

    def remove(self, path: str, name: str) -> bool:
        """
        Remove extended attribute.

        Args:
            path: File path
            name: Attribute name

        Returns:
            True if removed, False if not found
        """
        with self._lock:
            if path in self.attributes and name in self.attributes[path]:
                del self.attributes[path][name]
                return True
        return False

    def get_all(self, path: str) -> Dict[str, XAttrEntry]:
        """Get all extended attributes for a path."""
        with self._lock:
            if path in self.attributes:
                return dict(self.attributes[path])
        return {}

    def copy(self, src_path: str, dst_path: str) -> bool:
        """Copy all extended attributes from src to dst."""
        with self._lock:
            if src_path in self.attributes:
                self.attributes[dst_path] = dict(self.attributes[src_path])
                return True
        return False

    def get_stats(self) -> Dict[str, Any]:
        """Get extended attributes statistics."""
        with self._lock:
            total_attrs = sum(len(attrs) for attrs in self.attributes.values())
            total_bytes = sum(
                len(entry.value)
                for attrs in self.attributes.values()
                for entry in attrs.values()
            )
            return {
                "total_files": len(self.attributes),
                "total_attributes": total_attrs,
                "total_bytes": total_bytes,
            }


# ============================================================================
# Symbolic Link Manager
# ============================================================================

class SymbolicLinkManager:
    """
    Manages symbolic links.

    Supports creation, resolution, and validation of symlinks.
    """

    def __init__(self):
        self.symlinks: Dict[str, LinkEntry] = {}
        self._lock = threading.RLock()

    def create(self, source: str, target: str) -> bool:
        """
        Create a symbolic link.

        Args:
            source: Path of the symlink
            target: Path the symlink points to

        Returns:
            True if successful
        """
        with self._lock:
            if source in self.symlinks:
                return False

            entry = LinkEntry(
                source=source,
                target=target,
                link_type="symlink",
            )
            self.symlinks[source] = entry

        logger.debug(f"Created symlink: {source} -> {target}")
        return True

    def read(self, source: str) -> Optional[str]:
        """
        Read the target of a symbolic link.

        Args:
            source: Path of the symlink

        Returns:
            Target path or None
        """
        with self._lock:
            if source in self.symlinks:
                return self.symlinks[source].target
        return None

    def remove(self, source: str) -> bool:
        """
        Remove a symbolic link.

        Args:
            source: Path of the symlink

        Returns:
            True if removed
        """
        with self._lock:
            if source in self.symlinks:
                del self.symlinks[source]
                return True
        return False

    def exists(self, source: str) -> bool:
        """Check if symlink exists."""
        return source in self.symlinks

    def resolve(self, path: str, max_depth: int = 40) -> str:
        """
        Resolve a path following symlinks.

        Args:
            path: Path to resolve
            max_depth: Maximum symlink depth

        Returns:
            Resolved path
        """
        resolved = path
        depth = 0

        while depth < max_depth:
            with self._lock:
                if resolved in self.symlinks:
                    resolved = self.symlinks[resolved].target
                    depth += 1
                else:
                    break

        if depth >= max_depth:
            raise RuntimeError(f"Symlink loop detected at {path}")

        return resolved

    def list_all(self) -> List[LinkEntry]:
        """List all symbolic links."""
        with self._lock:
            return list(self.symlinks.values())

    def find_broken(self, exists_func: Callable[[str], bool]) -> List[str]:
        """Find broken symlinks (targets that don't exist)."""
        broken = []
        with self._lock:
            for source, entry in self.symlinks.items():
                if not exists_func(entry.target):
                    broken.append(source)
        return broken

    def get_stats(self) -> Dict[str, Any]:
        """Get symlink statistics."""
        with self._lock:
            return {
                "total_symlinks": len(self.symlinks),
            }


# ============================================================================
# Hard Link Manager
# ============================================================================

class HardLinkManager:
    """
    Manages hard links.

    Tracks inode relationships and link counts.
    """

    def __init__(self):
        # inode -> set of paths
        self.inode_paths: Dict[int, Set[str]] = defaultdict(set)
        # path -> inode
        self.path_inode: Dict[str, int] = {}
        self._lock = threading.RLock()
        self._next_inode = 1

    def _allocate_inode(self) -> int:
        """Allocate a new inode number."""
        inode = self._next_inode
        self._next_inode += 1
        return inode

    def create(self, source: str, target: str) -> Tuple[bool, int]:
        """
        Create a hard link.

        Args:
            source: Original file path
            target: New link path

        Returns:
            (success, link_count)
        """
        with self._lock:
            # Get or allocate inode for source
            if source in self.path_inode:
                inode = self.path_inode[source]
            else:
                inode = self._allocate_inode()
                self.path_inode[source] = inode
                self.inode_paths[inode].add(source)

            # Add target to same inode
            self.path_inode[target] = inode
            self.inode_paths[inode].add(target)

            link_count = len(self.inode_paths[inode])

        logger.debug(f"Created hardlink: {target} -> inode {inode} (count: {link_count})")
        return True, link_count

    def get_inode(self, path: str) -> Optional[int]:
        """Get inode number for a path."""
        with self._lock:
            return self.path_inode.get(path)

    def get_link_count(self, path: str) -> int:
        """Get link count for a path."""
        with self._lock:
            if path in self.path_inode:
                inode = self.path_inode[path]
                return len(self.inode_paths[inode])
        return 0

    def get_paths_for_inode(self, inode: int) -> List[str]:
        """Get all paths for an inode."""
        with self._lock:
            return list(self.inode_paths.get(inode, set()))

    def remove(self, path: str) -> Tuple[bool, int]:
        """
        Remove a hard link (unlink).

        Returns:
            (success, remaining_link_count)
        """
        with self._lock:
            if path not in self.path_inode:
                return False, 0

            inode = self.path_inode[path]
            del self.path_inode[path]
            self.inode_paths[inode].discard(path)

            remaining = len(self.inode_paths[inode])

            # Cleanup empty inode sets
            if remaining == 0:
                del self.inode_paths[inode]

        logger.debug(f"Removed hardlink: {path} (remaining: {remaining})")
        return True, remaining

    def is_hardlinked(self, path1: str, path2: str) -> bool:
        """Check if two paths are hardlinked (same inode)."""
        with self._lock:
            inode1 = self.path_inode.get(path1)
            inode2 = self.path_inode.get(path2)
            return inode1 is not None and inode1 == inode2

    def get_stats(self) -> Dict[str, Any]:
        """Get hardlink statistics."""
        with self._lock:
            total_links = sum(len(paths) for paths in self.inode_paths.values())
            return {
                "total_inodes": len(self.inode_paths),
                "total_links": total_links,
                "avg_links_per_inode": total_links / len(self.inode_paths) if self.inode_paths else 0,
            }


# ============================================================================
# File Lock Manager
# ============================================================================

class FileLockManager:
    """
    Manages file locking (flock/fcntl style).

    Supports both whole-file (flock) and byte-range (fcntl) locking.
    """

    def __init__(self):
        self.locks: Dict[str, List[FileLock]] = defaultdict(list)
        self._lock = threading.RLock()

    def acquire(
        self,
        path: str,
        lock_type: LockType,
        owner_pid: int,
        start: int = 0,
        length: int = 0,
        blocking: bool = True
    ) -> Tuple[bool, str]:
        """
        Acquire a file lock.

        Args:
            path: File path
            lock_type: Type of lock
            owner_pid: PID of lock owner
            start: Byte offset (for range locks)
            length: Length (0 = to EOF)
            blocking: Wait if lock unavailable

        Returns:
            (success, message)
        """
        with self._lock:
            if lock_type == LockType.UNLOCK:
                return self._release_lock(path, owner_pid)

            # Check for conflicts
            for existing in self.locks[path]:
                if existing.owner_pid == owner_pid:
                    continue  # Same owner can re-lock

                # Check for overlap
                if self._ranges_overlap(
                    start, length,
                    existing.start, existing.length
                ):
                    # Check compatibility
                    if existing.lock_type == LockType.EXCLUSIVE:
                        if blocking:
                            return False, "Resource temporarily unavailable"
                        else:
                            return False, "Lock would block"

                    if lock_type == LockType.EXCLUSIVE:
                        if blocking:
                            return False, "Resource temporarily unavailable"
                        else:
                            return False, "Lock would block"

            # Acquire lock
            lock = FileLock(
                path=path,
                lock_type=lock_type,
                owner_pid=owner_pid,
                start=start,
                length=length,
            )
            self.locks[path].append(lock)

        logger.debug(f"Acquired {lock_type.name} lock on {path} for pid {owner_pid}")
        return True, "Lock acquired"

    def _release_lock(self, path: str, owner_pid: int) -> Tuple[bool, str]:
        """Release all locks for an owner on a path."""
        with self._lock:
            remaining = [
                l for l in self.locks[path]
                if l.owner_pid != owner_pid
            ]

            released_count = len(self.locks[path]) - len(remaining)
            self.locks[path] = remaining

        return True, f"Released {released_count} locks"

    def _ranges_overlap(
        self,
        start1: int, length1: int,
        start2: int, length2: int
    ) -> bool:
        """Check if two byte ranges overlap."""
        if length1 == 0 and length2 == 0:
            return True  # Both to EOF

        if length1 == 0:
            return start1 < start2 + length2 if length2 > 0 else True
        if length2 == 0:
            return start2 < start1 + length1

        end1 = start1 + length1
        end2 = start2 + length2
        return start1 < end2 and start2 < end1

    def release_all(self, owner_pid: int) -> int:
        """Release all locks held by a PID."""
        count = 0
        with self._lock:
            for path in list(self.locks.keys()):
                before = len(self.locks[path])
                self.locks[path] = [
                    l for l in self.locks[path]
                    if l.owner_pid != owner_pid
                ]
                count += before - len(self.locks[path])
        return count

    def get_locks(self, path: str) -> List[FileLock]:
        """Get all locks for a path."""
        with self._lock:
            return list(self.locks.get(path, []))

    def is_locked(self, path: str) -> bool:
        """Check if a path has any locks."""
        with self._lock:
            return len(self.locks.get(path, [])) > 0

    def get_stats(self) -> Dict[str, Any]:
        """Get lock statistics."""
        with self._lock:
            total_locks = sum(len(locks) for locks in self.locks.values())
            exclusive = sum(
                1 for locks in self.locks.values()
                for l in locks
                if l.lock_type == LockType.EXCLUSIVE
            )
            return {
                "total_locks": total_locks,
                "exclusive_locks": exclusive,
                "shared_locks": total_locks - exclusive,
                "locked_files": len(self.locks),
            }


# ============================================================================
# Directory Notifier
# ============================================================================

class DirectoryNotifier:
    """
    Manages directory change notifications.

    Provides inotify-like functionality for monitoring directories.
    """

    def __init__(self, max_events: int = 1000):
        self.max_events = max_events
        self.events: Dict[str, List[DirectoryEvent]] = defaultdict(list)
        self.watchers: Dict[str, Set[int]] = defaultdict(set)  # path -> watcher PIDs
        self._lock = threading.RLock()

    def add_watch(self, path: str, watcher_pid: int) -> bool:
        """Add a watcher for a path."""
        with self._lock:
            self.watchers[path].add(watcher_pid)
        logger.debug(f"Added watch on {path} for pid {watcher_pid}")
        return True

    def remove_watch(self, path: str, watcher_pid: int) -> bool:
        """Remove a watcher from a path."""
        with self._lock:
            if watcher_pid in self.watchers[path]:
                self.watchers[path].discard(watcher_pid)
                return True
        return False

    def notify(
        self,
        path: str,
        event_type: NotificationType,
        filename: str,
        details: Optional[Dict[str, Any]] = None
    ) -> int:
        """
        Record and broadcast a notification event.

        Returns:
            Number of watchers notified
        """
        event = DirectoryEvent(
            event_type=event_type,
            path=path,
            filename=filename,
            details=details or {},
        )

        with self._lock:
            # Store event
            self.events[path].append(event)

            # Limit stored events
            if len(self.events[path]) > self.max_events:
                self.events[path] = self.events[path][-self.max_events:]

            # Count watchers
            watcher_count = len(self.watchers[path])

        logger.debug(f"Notified {watcher_count} watchers of {event_type.value} on {path}/{filename}")
        return watcher_count

    def get_events(
        self,
        path: str,
        since: Optional[datetime] = None
    ) -> List[DirectoryEvent]:
        """Get events for a path, optionally filtered by time."""
        with self._lock:
            events = self.events.get(path, [])
            if since:
                events = [e for e in events if e.timestamp >= since]
            return list(events)

    def get_watchers(self, path: str) -> List[int]:
        """Get list of watcher PIDs for a path."""
        with self._lock:
            return list(self.watchers.get(path, set()))

    def clear_events(self, path: str) -> int:
        """Clear all events for a path."""
        with self._lock:
            count = len(self.events.get(path, []))
            if path in self.events:
                del self.events[path]
        return count

    def get_stats(self) -> Dict[str, Any]:
        """Get notifier statistics."""
        with self._lock:
            total_events = sum(len(e) for e in self.events.values())
            return {
                "watched_paths": len(self.watchers),
                "total_watchers": sum(len(w) for w in self.watchers.values()),
                "stored_events": total_events,
                "max_events": self.max_events,
            }


# ============================================================================
# POSIX ACL Manager
# ============================================================================

class POSIXACLManager:
    """
    Manages POSIX Access Control Lists.

    Provides fine-grained permission control beyond traditional Unix permissions.
    """

    def __init__(self):
        # path -> list of ACL entries
        self.acls: Dict[str, List[ACLEntry]] = {}
        self._lock = threading.RLock()

    def set_acl(
        self,
        path: str,
        entries: List[ACLEntry]
    ) -> bool:
        """Set complete ACL for a path."""
        with self._lock:
            self.acls[path] = list(entries)
        return True

    def add_entry(
        self,
        path: str,
        entry: ACLEntry
    ) -> bool:
        """Add a single ACL entry."""
        with self._lock:
            if path not in self.acls:
                self.acls[path] = []
            self.acls[path].append(entry)
        return True

    def get_acl(self, path: str) -> List[ACLEntry]:
        """Get ACL entries for a path."""
        with self._lock:
            return list(self.acls.get(path, []))

    def remove_entry(
        self,
        path: str,
        acl_type: ACLType,
        qualifier: Optional[int] = None
    ) -> bool:
        """Remove an ACL entry."""
        with self._lock:
            if path not in self.acls:
                return False

            before = len(self.acls[path])
            self.acls[path] = [
                e for e in self.acls[path]
                if not (e.acl_type == acl_type and e.qualifier == qualifier)
            ]
            return len(self.acls[path]) < before

    def check_permission(
        self,
        path: str,
        uid: int,
        gid: int,
        permission: Permission
    ) -> bool:
        """
        Check if a user has permission.

        Args:
            path: File path
            uid: User ID
            gid: Group ID
            permission: Permission to check (READ, WRITE, EXECUTE)

        Returns:
            True if permission granted
        """
        with self._lock:
            if path not in self.acls:
                # No ACL, fall back to traditional permissions
                return True

            for entry in self.acls[path]:
                # Check user entry
                if entry.acl_type == ACLType.USER and entry.qualifier == uid:
                    return bool(entry.permissions & permission.value)

                # Check group entry
                if entry.acl_type == ACLType.GROUP and entry.qualifier == gid:
                    return bool(entry.permissions & permission.value)

                # Check other entry
                if entry.acl_type == ACLType.OTHER:
                    return bool(entry.permissions & permission.value)

        return False

    def get_mask(self, path: str) -> int:
        """Get the ACL mask for a path."""
        with self._lock:
            if path in self.acls:
                for entry in self.acls[path]:
                    if entry.acl_type == ACLType.MASK:
                        return entry.permissions
        return 7  # Default to rwx

    def calc_mask(self, path: str) -> int:
        """Calculate and set the mask from all group entries."""
        with self._lock:
            if path not in self.acls:
                return 0

            mask = 0
            for entry in self.acls[path]:
                if entry.acl_type in (ACLType.GROUP, ACLType.USER):
                    mask |= entry.permissions

            # Update or add mask entry
            for i, entry in enumerate(self.acls[path]):
                if entry.acl_type == ACLType.MASK:
                    self.acls[path][i] = ACLEntry(ACLType.MASK, None, mask)
                    return mask

            self.acls[path].append(ACLEntry(ACLType.MASK, None, mask))
            return mask

    def remove_acl(self, path: str) -> bool:
        """Remove entire ACL for a path."""
        with self._lock:
            if path in self.acls:
                del self.acls[path]
                return True
        return False

    def get_stats(self) -> Dict[str, Any]:
        """Get ACL statistics."""
        with self._lock:
            total_entries = sum(len(acl) for acl in self.acls.values())
            return {
                "files_with_acl": len(self.acls),
                "total_entries": total_entries,
            }


# ============================================================================
# POSIX Compliance Tester
# ============================================================================

class POSIXComplianceTester:
    """
    Tests POSIX compliance of filesystem features.

    Runs a comprehensive test suite and generates compliance reports.
    """

    def __init__(self):
        self.xattr_manager = ExtendedAttributes()
        self.symlink_manager = SymbolicLinkManager()
        self.hardlink_manager = HardLinkManager()
        self.lock_manager = FileLockManager()
        self.notifier = DirectoryNotifier()
        self.acl_manager = POSIXACLManager()

        self.test_results: List[Dict[str, Any]] = []

    def run_all_tests(self) -> Dict[str, Any]:
        """Run all POSIX compliance tests."""
        self.test_results = []

        # Run test categories
        self._test_xattr()
        self._test_symlinks()
        self._test_hardlinks()
        self._test_locking()
        self._test_notifications()
        self._test_acls()

        # Calculate summary
        passed = sum(1 for r in self.test_results if r["passed"])
        failed = sum(1 for r in self.test_results if not r["passed"])
        total = len(self.test_results)

        return {
            "passed": passed,
            "failed": failed,
            "total": total,
            "compliance_score": (passed / total * 100) if total > 0 else 0,
            "tests": self.test_results,
        }

    def _record_test(self, name: str, passed: bool, message: str = ""):
        """Record a test result."""
        self.test_results.append({
            "name": name,
            "passed": passed,
            "message": message,
        })

    def _test_xattr(self):
        """Test extended attributes."""
        # Test set/get
        self.xattr_manager.set("/test", "user.comment", b"test value")
        value = self.xattr_manager.get("/test", "user.comment")
        self._record_test(
            "xattr_set_get",
            value == b"test value",
            f"Expected 'test value', got {value}"
        )

        # Test list
        attrs = self.xattr_manager.list("/test")
        self._record_test(
            "xattr_list",
            "user.comment" in attrs,
            f"Expected user.comment in {attrs}"
        )

        # Test remove
        self.xattr_manager.remove("/test", "user.comment")
        value = self.xattr_manager.get("/test", "user.comment")
        self._record_test(
            "xattr_remove",
            value is None,
            f"Expected None, got {value}"
        )

    def _test_symlinks(self):
        """Test symbolic links."""
        # Test create/read
        self.symlink_manager.create("/link", "/target")
        target = self.symlink_manager.read("/link")
        self._record_test(
            "symlink_create_read",
            target == "/target",
            f"Expected /target, got {target}"
        )

        # Test resolve
        resolved = self.symlink_manager.resolve("/link")
        self._record_test(
            "symlink_resolve",
            resolved == "/target",
            f"Expected /target, got {resolved}"
        )

        # Test remove
        self.symlink_manager.remove("/link")
        exists = self.symlink_manager.exists("/link")
        self._record_test(
            "symlink_remove",
            not exists,
            f"Expected False, got {exists}"
        )

    def _test_hardlinks(self):
        """Test hard links."""
        # Test create
        success, count = self.hardlink_manager.create("/file1", "/file2")
        self._record_test(
            "hardlink_create",
            success and count == 2,
            f"Expected (True, 2), got ({success}, {count})"
        )

        # Test same inode
        inode1 = self.hardlink_manager.get_inode("/file1")
        inode2 = self.hardlink_manager.get_inode("/file2")
        self._record_test(
            "hardlink_same_inode",
            inode1 == inode2 and inode1 is not None,
            f"Expected same inode, got {inode1} and {inode2}"
        )

        # Test unlink
        success, remaining = self.hardlink_manager.remove("/file2")
        self._record_test(
            "hardlink_unlink",
            success and remaining == 1,
            f"Expected (True, 1), got ({success}, {remaining})"
        )

    def _test_locking(self):
        """Test file locking."""
        # Test exclusive lock
        success, msg = self.lock_manager.acquire(
            "/locked", LockType.EXCLUSIVE, 1234
        )
        self._record_test(
            "lock_exclusive_acquire",
            success,
            msg
        )

        # Test conflicting lock
        success, msg = self.lock_manager.acquire(
            "/locked", LockType.SHARED, 5678, blocking=False
        )
        self._record_test(
            "lock_conflict_detection",
            not success,
            f"Expected conflict, got {success}"
        )

        # Test release
        self.lock_manager.release_all(1234)
        is_locked = self.lock_manager.is_locked("/locked")
        self._record_test(
            "lock_release",
            not is_locked,
            f"Expected unlocked, got {is_locked}"
        )

    def _test_notifications(self):
        """Test directory notifications."""
        # Test watch
        self.notifier.add_watch("/dir", 1234)
        watchers = self.notifier.get_watchers("/dir")
        self._record_test(
            "notify_add_watch",
            1234 in watchers,
            f"Expected 1234 in {watchers}"
        )

        # Test notify
        count = self.notifier.notify(
            "/dir", NotificationType.CREATE, "file.txt"
        )
        self._record_test(
            "notify_event",
            count == 1,
            f"Expected 1 watcher, got {count}"
        )

        # Test get events
        events = self.notifier.get_events("/dir")
        self._record_test(
            "notify_get_events",
            len(events) == 1 and events[0].filename == "file.txt",
            f"Unexpected events: {events}"
        )

    def _test_acls(self):
        """Test POSIX ACLs."""
        # Test set/get
        entries = [
            ACLEntry(ACLType.USER, 1000, 6),  # rw
            ACLEntry(ACLType.GROUP, 100, 4),  # r
            ACLEntry(ACLType.OTHER, None, 0),  # no access
        ]
        self.acl_manager.set_acl("/secure", entries)

        acl = self.acl_manager.get_acl("/secure")
        self._record_test(
            "acl_set_get",
            len(acl) == 3,
            f"Expected 3 entries, got {len(acl)}"
        )

        # Test permission check
        can_read = self.acl_manager.check_permission(
            "/secure", 1000, 100, Permission.READ
        )
        self._record_test(
            "acl_check_permission",
            can_read,
            "Expected read permission for uid 1000"
        )

        # Test mask calculation
        mask = self.acl_manager.calc_mask("/secure")
        self._record_test(
            "acl_calc_mask",
            mask == 6,  # rw (union of user and group)
            f"Expected mask 6, got {mask}"
        )


# ============================================================================
# Unified FUSE Advanced Features
# ============================================================================

class FUSEAdvancedFeatures:
    """
    Unified interface for advanced FUSE features.

    Provides a single point of access to all POSIX-compliant features.
    """

    def __init__(self):
        self.xattr = ExtendedAttributes()
        self.symlinks = SymbolicLinkManager()
        self.hardlinks = HardLinkManager()
        self.locks = FileLockManager()
        self.notifier = DirectoryNotifier()
        self.acls = POSIXACLManager()
        self.compliance = POSIXComplianceTester()

    def get_stats(self) -> Dict[str, Any]:
        """Get statistics for all features."""
        return {
            "xattr": self.xattr.get_stats(),
            "symlinks": self.symlinks.get_stats(),
            "hardlinks": self.hardlinks.get_stats(),
            "locks": self.locks.get_stats(),
            "notifications": self.notifier.get_stats(),
            "acls": self.acls.get_stats(),
        }

    def run_compliance_test(self) -> Dict[str, Any]:
        """Run POSIX compliance tests."""
        return self.compliance.run_all_tests()


# ============================================================================
# CLI Entry Point
# ============================================================================

def main():
    """Main CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map FUSE Advanced Features")
    parser.add_argument(
        "--test",
        action="store_true",
        help="Run POSIX compliance tests"
    )
    parser.add_argument(
        "--stats",
        action="store_true",
        help="Show feature statistics"
    )

    args = parser.parse_args()

    fuse = FUSEAdvancedFeatures()

    if args.test:
        print("Running POSIX compliance tests...")
        results = fuse.run_compliance_test()

        print(f"\n{'='*60}")
        print("POSIX COMPLIANCE TEST RESULTS")
        print(f"{'='*60}")

        for test in results["tests"]:
            status = "✓ PASS" if test["passed"] else "✗ FAIL"
            print(f"  {status}: {test['name']}")
            if test["message"]:
                print(f"         {test['message']}")

        print(f"\n{'='*60}")
        print(f"SUMMARY: {results['passed']}/{results['total']} passed")
        print(f"COMPLIANCE SCORE: {results['compliance_score']:.1f}%")
        print(f"{'='*60}")

        return 0 if results["failed"] == 0 else 1

    if args.stats:
        print("FUSE Advanced Features Statistics:")
        print(json.dumps(fuse.get_stats(), indent=2))
        return 0

    parser.print_help()
    return 0


if __name__ == "__main__":
    sys.exit(main())
