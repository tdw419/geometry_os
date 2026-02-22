#!/usr/bin/env python3
"""
Infinite Map Permissions and ACL System.

Provides file permissions and Access Control List (ACL) support
for the Infinite Map filesystem, similar to Linux permissions.

Key Components:
- Permission: Unix-style permission bits (rwx)
- PermissionEntry: Full permission set (user, group, other)
- ACL: POSIX.1e-style Access Control List
- ACE: Individual ACL entry
- PermissionManager: Unified permission management interface

Usage:
    from infinite_map_permissions import PermissionManager

    manager = PermissionManager(perm_store_path="permissions.json")

    # Set Unix permissions
    manager.set_permissions("/path/to/file", 0o644)

    # Check access
    allowed = manager.check_access("/path/to/file", "user1", "group1", "read")

    # Add ACL entry
    manager.add_acl_entry("/path/to/file", "user", "alice", "rwx")
"""

import os
import json
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple, Set, Union
from datetime import datetime
from enum import Enum, IntFlag
import logging
import stat

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class PermissionFlag(IntFlag):
    """Unix permission bits."""
    NONE = 0
    EXECUTE = 1    # x
    WRITE = 2      # w
    READ = 4       # r

    # Common combinations
    READ_WRITE = 6   # rw-
    READ_EXECUTE = 5  # r-x
    ALL = 7          # rwx


class ACLTag(Enum):
    """ACL entry tag types."""
    USER_OBJ = "user_obj"       # File owner
    USER = "user"               # Named user
    GROUP_OBJ = "group_obj"     # File group
    GROUP = "group"             # Named group
    MASK = "mask"               # Permission mask
    OTHER = "other"             # Others


class AccessType(IntFlag):
    """Access types for permission checking."""
    NONE = 0
    READ = 4
    WRITE = 2
    EXECUTE = 1


@dataclass
class PermissionEntry:
    """
    Full Unix-style permission set.

    Contains owner, group, and other permissions,
    plus setuid, setgid, and sticky bits.
    """
    owner: int = 0
    group: int = 0
    other: int = 0
    setuid: bool = False
    setgid: bool = False
    sticky: bool = False

    @classmethod
    def from_mode(cls, mode: int) -> "PermissionEntry":
        """Create from Unix mode (e.g., 0o755)."""
        return cls(
            owner=(mode >> 6) & 0o7,
            group=(mode >> 3) & 0o7,
            other=mode & 0o7,
            setuid=bool(mode & stat.S_ISUID),
            setgid=bool(mode & stat.S_ISGID),
            sticky=bool(mode & stat.S_ISVTX)
        )

    def to_mode(self) -> int:
        """Convert to Unix mode."""
        mode = (self.owner << 6) | (self.group << 3) | self.other
        if self.setuid:
            mode |= stat.S_ISUID
        if self.setgid:
            mode |= stat.S_ISGID
        if self.sticky:
            mode |= stat.S_ISVTX
        return mode

    def to_symbolic(self) -> str:
        """Convert to symbolic notation (e.g., 'rwxr-xr-x')."""
        def perm_str(p: int) -> str:
            r = 'r' if p & 4 else '-'
            w = 'w' if p & 2 else '-'
            x = 'x' if p & 1 else '-'
            return r + w + x

        owner_str = perm_str(self.owner)
        group_str = perm_str(self.group)
        other_str = perm_str(self.other)

        # Handle special bits
        if self.setuid:
            owner_str = owner_str[:-1] + ('s' if self.owner & 1 else 'S')
        if self.setgid:
            group_str = group_str[:-1] + ('s' if self.group & 1 else 'S')
        if self.sticky:
            other_str = other_str[:-1] + ('t' if self.other & 1 else 'T')

        return owner_str + group_str + other_str

    @classmethod
    def from_symbolic(cls, symbolic: str) -> "PermissionEntry":
        """Create from symbolic notation."""
        if len(symbolic) != 9:
            raise ValueError("Symbolic notation must be 9 characters")

        def parse_perm(s: str, has_special: bool = False) -> Tuple[int, bool, bool]:
            r = 4 if s[0] == 'r' else 0
            w = 2 if s[1] == 'w' else 0
            x_char = s[2].lower()
            x = 1 if x_char in ('x', 's', 't') else 0
            special = s[2] in ('s', 'S', 't', 'T')
            return r | w | x, x_char == 's', x_char == 't'

        owner, setuid, _ = parse_perm(symbolic[0:3], True)
        group, setgid, _ = parse_perm(symbolic[3:6], True)
        other, _, sticky = parse_perm(symbolic[6:9], True)

        return cls(
            owner=owner,
            group=group,
            other=other,
            setuid=setuid,
            setgid=setgid,
            sticky=sticky
        )

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "owner": self.owner,
            "group": self.group,
            "other": self.other,
            "setuid": self.setuid,
            "setgid": self.setgid,
            "sticky": self.sticky,
            "mode": self.to_mode(),
            "symbolic": self.to_symbolic()
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "PermissionEntry":
        """Create from dictionary."""
        return cls(
            owner=data.get("owner", 0),
            group=data.get("group", 0),
            other=data.get("other", 0),
            setuid=data.get("setuid", False),
            setgid=data.get("setgid", False),
            sticky=data.get("sticky", False)
        )


@dataclass
class ACLEntry:
    """
    Single ACL entry.

    Represents a permission entry for a specific user or group.
    """
    tag: ACLTag
    qualifier: Optional[str]  # User/group name (None for user_obj, group_obj, other, mask)
    permissions: int
    flags: int = 0  # For future use (e.g., inherited, default)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "tag": self.tag.value,
            "qualifier": self.qualifier,
            "permissions": self.permissions,
            "flags": self.flags
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ACLEntry":
        """Create from dictionary."""
        return cls(
            tag=ACLTag(data["tag"]),
            qualifier=data.get("qualifier"),
            permissions=data["permissions"],
            flags=data.get("flags", 0)
        )

    def matches(self, tag: ACLTag, qualifier: Optional[str] = None) -> bool:
        """Check if this entry matches the given tag and qualifier."""
        if self.tag != tag:
            return False
        if qualifier is not None and self.qualifier != qualifier:
            return False
        return True


@dataclass
class ACL:
    """
    Access Control List.

    Contains a list of ACEs for fine-grained access control.
    """
    entries: List[ACLEntry] = field(default_factory=list)

    def add_entry(self, entry: ACLEntry) -> bool:
        """Add an entry to the ACL."""
        # Check for duplicate
        for existing in self.entries:
            if existing.matches(entry.tag, entry.qualifier):
                return False

        self.entries.append(entry)
        return True

    def remove_entry(self, tag: ACLTag, qualifier: Optional[str] = None) -> bool:
        """Remove an entry from the ACL."""
        for i, entry in enumerate(self.entries):
            if entry.matches(tag, qualifier):
                del self.entries[i]
                return True
        return False

    def get_entry(self, tag: ACLTag, qualifier: Optional[str] = None) -> Optional[ACLEntry]:
        """Get a specific entry."""
        for entry in self.entries:
            if entry.matches(tag, qualifier):
                return entry
        return None

    def get_entries_by_tag(self, tag: ACLTag) -> List[ACLEntry]:
        """Get all entries with a specific tag."""
        return [e for e in self.entries if e.tag == tag]

    def get_mask(self) -> int:
        """Get the effective permission mask."""
        mask_entry = self.get_entry(ACLTag.MASK)
        if mask_entry:
            return mask_entry.permissions
        # If no mask, use group_obj permissions
        group_obj = self.get_entry(ACLTag.GROUP_OBJ)
        return group_obj.permissions if group_obj else 7

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "entries": [e.to_dict() for e in self.entries]
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ACL":
        """Create from dictionary."""
        return cls(
            entries=[ACLEntry.from_dict(e) for e in data.get("entries", [])]
        )

    @classmethod
    def from_permission_entry(cls, perm: PermissionEntry) -> "ACL":
        """Create minimal ACL from permission entry."""
        acl = cls()
        acl.add_entry(ACLEntry(ACLTag.USER_OBJ, None, perm.owner))
        acl.add_entry(ACLEntry(ACLTag.GROUP_OBJ, None, perm.group))
        acl.add_entry(ACLEntry(ACLTag.OTHER, None, perm.other))
        return acl


@dataclass
class FileOwnership:
    """File ownership information."""
    owner: str
    group: str
    owner_id: Optional[int] = None
    group_id: Optional[int] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "owner": self.owner,
            "group": self.group,
            "owner_id": self.owner_id,
            "group_id": self.group_id
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "FileOwnership":
        """Create from dictionary."""
        return cls(
            owner=data["owner"],
            group=data["group"],
            owner_id=data.get("owner_id"),
            group_id=data.get("group_id")
        )


@dataclass
class FileSecurityInfo:
    """Complete security information for a file."""
    path: str
    ownership: FileOwnership
    permissions: PermissionEntry
    acl: Optional[ACL] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "path": self.path,
            "ownership": self.ownership.to_dict(),
            "permissions": self.permissions.to_dict(),
            "acl": self.acl.to_dict() if self.acl else None
        }


class PermissionStore:
    """
    Manages permission and ACL storage.

    Stores permissions in a JSON file with atomic updates.
    """

    def __init__(self, store_path: str):
        self.store_path = Path(store_path)
        # path -> FileSecurityInfo
        self.security_info: Dict[str, Dict[str, Any]] = {}
        self.lock = threading.RLock()
        self._load()

    def _load(self):
        """Load permission store from disk."""
        if self.store_path.exists():
            try:
                with open(self.store_path, "r") as f:
                    data = json.load(f)
                    self.security_info = data.get("security_info", {})
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Failed to load permission store: {e}")
                self.security_info = {}

    def _save(self):
        """Save permission store to disk."""
        with self.lock:
            data = {
                "version": 1,
                "security_info": self.security_info
            }
            temp_path = self.store_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.store_path)

    def get_security_info(self, path: str) -> Optional[Dict[str, Any]]:
        """Get security info for a path."""
        with self.lock:
            return self.security_info.get(path)

    def set_security_info(self, path: str, info: Dict[str, Any]):
        """Set security info for a path."""
        with self.lock:
            self.security_info[path] = info
            self._save()

    def remove_security_info(self, path: str) -> bool:
        """Remove security info for a path."""
        with self.lock:
            if path in self.security_info:
                del self.security_info[path]
                self._save()
                return True
            return False

    def get_stats(self) -> Dict[str, Any]:
        """Get store statistics."""
        with self.lock:
            acl_count = sum(
                1 for info in self.security_info.values()
                if info.get("acl") and info["acl"].get("entries")
            )
            return {
                "total_files": len(self.security_info),
                "files_with_acl": acl_count
            }


class PermissionManager:
    """
    Unified permission and ACL management interface.

    Provides high-level API for permission operations with
    access checking and validation.
    """

    def __init__(
        self,
        vat,
        perm_store_path: str,
        default_owner: str = "root",
        default_group: str = "root",
        default_mode: int = 0o755
    ):
        self.vat = vat
        self.store = PermissionStore(perm_store_path)
        self.default_owner = default_owner
        self.default_group = default_group
        self.default_mode = default_mode
        self.lock = threading.RLock()

    def initialize_file(
        self,
        path: str,
        owner: Optional[str] = None,
        group: Optional[str] = None,
        mode: Optional[int] = None
    ) -> FileSecurityInfo:
        """Initialize security info for a new file."""
        with self.lock:
            owner = owner or self.default_owner
            group = group or self.default_group
            mode = mode if mode is not None else self.default_mode

            ownership = FileOwnership(owner=owner, group=group)
            permissions = PermissionEntry.from_mode(mode)

            info = {
                "ownership": ownership.to_dict(),
                "permissions": permissions.to_dict(),
                "acl": None
            }

            self.store.set_security_info(path, info)

            return FileSecurityInfo(
                path=path,
                ownership=ownership,
                permissions=permissions
            )

    def get_security_info(self, path: str) -> Optional[FileSecurityInfo]:
        """Get complete security info for a file."""
        info = self.store.get_security_info(path)
        if not info:
            return None

        return FileSecurityInfo(
            path=path,
            ownership=FileOwnership.from_dict(info["ownership"]),
            permissions=PermissionEntry.from_dict(info["permissions"]),
            acl=ACL.from_dict(info["acl"]) if info.get("acl") else None
        )

    def set_permissions(self, path: str, mode: int) -> bool:
        """Set Unix permissions for a file."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info:
                return False

            info["permissions"] = PermissionEntry.from_mode(mode).to_dict()
            self.store.set_security_info(path, info)
            return True

    def get_permissions(self, path: str) -> Optional[int]:
        """Get Unix permissions for a file."""
        info = self.get_security_info(path)
        if not info:
            return None
        return info.permissions.to_mode()

    def chmod(self, path: str, mode: int) -> Tuple[bool, str]:
        """Change file mode (chmod)."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info:
                # Initialize with new permissions
                self.initialize_file(path, mode=mode)
                return True, f"Permissions set to {oct(mode)}"

            info["permissions"] = PermissionEntry.from_mode(mode).to_dict()
            self.store.set_security_info(path, info)
            return True, f"Permissions changed to {oct(mode)}"

    def chown(self, path: str, owner: Optional[str], group: Optional[str]) -> Tuple[bool, str]:
        """Change file ownership (chown)."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info:
                return False, f"No security info for {path}"

            ownership = FileOwnership.from_dict(info["ownership"])
            if owner:
                ownership.owner = owner
            if group:
                ownership.group = group

            info["ownership"] = ownership.to_dict()
            self.store.set_security_info(path, info)
            return True, f"Ownership changed to {ownership.owner}:{ownership.group}"

    def check_access(
        self,
        path: str,
        user: str,
        groups: List[str],
        access: Union[int, str]
    ) -> bool:
        """
        Check if a user has access to a file.

        Args:
            path: File path
            user: Username
            groups: User's groups
            access: Access type (AccessType flags or 'read', 'write', 'execute')

        Returns:
            True if access is allowed
        """
        with self.lock:
            info = self.get_security_info(path)
            if not info:
                # No security info - allow access
                return True

            # Convert string access to flags
            if isinstance(access, str):
                access_map = {
                    "read": AccessType.READ,
                    "write": AccessType.WRITE,
                    "execute": AccessType.EXECUTE,
                    "r": AccessType.READ,
                    "w": AccessType.WRITE,
                    "x": AccessType.EXECUTE
                }
                access = access_map.get(access.lower(), AccessType.NONE)

            ownership = info.ownership
            permissions = info.permissions
            acl = info.acl

            # Check if user is owner
            if user == ownership.owner:
                return bool(permissions.owner & access)

            # Check ACL if present
            if acl:
                # Check named user ACL entry
                user_entry = acl.get_entry(ACLTag.USER, user)
                if user_entry:
                    return bool(user_entry.permissions & acl.get_mask() & access)

                # Check if user's group matches file group
                if ownership.group in groups:
                    # Check named group ACL entry
                    group_entry = acl.get_entry(ACLTag.GROUP, ownership.group)
                    if group_entry:
                        return bool(group_entry.permissions & acl.get_mask() & access)

                # Check group_obj permissions
                if ownership.group in groups:
                    return bool(permissions.group & acl.get_mask() & access)

            else:
                # No ACL - use basic permissions
                # Check if user's group matches file group
                if ownership.group in groups:
                    return bool(permissions.group & access)

            # Check other permissions
            return bool(permissions.other & access)

    def add_acl_entry(
        self,
        path: str,
        tag: ACLTag,
        qualifier: Optional[str],
        permissions: int
    ) -> Tuple[bool, str]:
        """Add an ACL entry."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info:
                return False, f"No security info for {path}"

            if not info.get("acl"):
                perm = PermissionEntry.from_dict(info["permissions"])
                info["acl"] = ACL.from_permission_entry(perm).to_dict()

            acl = ACL.from_dict(info["acl"])
            entry = ACLEntry(tag, qualifier, permissions)

            if not acl.add_entry(entry):
                return False, f"ACL entry already exists"

            info["acl"] = acl.to_dict()
            self.store.set_security_info(path, info)
            return True, f"ACL entry added"

    def remove_acl_entry(
        self,
        path: str,
        tag: ACLTag,
        qualifier: Optional[str] = None
    ) -> Tuple[bool, str]:
        """Remove an ACL entry."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info or not info.get("acl"):
                return False, f"No ACL for {path}"

            acl = ACL.from_dict(info["acl"])
            if not acl.remove_entry(tag, qualifier):
                return False, f"ACL entry not found"

            info["acl"] = acl.to_dict() if acl.entries else None
            self.store.set_security_info(path, info)
            return True, f"ACL entry removed"

    def get_acl(self, path: str) -> Optional[ACL]:
        """Get ACL for a file."""
        info = self.get_security_info(path)
        if not info:
            return None
        return info.acl

    def clear_acl(self, path: str) -> bool:
        """Remove all ACL entries from a file."""
        with self.lock:
            info = self.store.get_security_info(path)
            if not info:
                return False

            info["acl"] = None
            self.store.set_security_info(path, info)
            return True

    def copy_permissions(self, src_path: str, dst_path: str) -> bool:
        """Copy permissions from source to destination."""
        with self.lock:
            src_info = self.store.get_security_info(src_path)
            if not src_info:
                return False

            self.store.set_security_info(dst_path, src_info)
            return True

    def get_stats(self) -> Dict[str, Any]:
        """Get manager statistics."""
        return self.store.get_stats()

    def list_files_by_owner(self, owner: str) -> List[str]:
        """List all files owned by a user."""
        with self.lock:
            result = []
            for path, info in self.store.security_info.items():
                if info.get("ownership", {}).get("owner") == owner:
                    result.append(path)
            return result

    def list_files_by_group(self, group: str) -> List[str]:
        """List all files owned by a group."""
        with self.lock:
            result = []
            for path, info in self.store.security_info.items():
                if info.get("ownership", {}).get("group") == group:
                    result.append(path)
            return result


# Convenience functions

def chmod(path: str, mode: int, store_path: str = "permissions.json") -> bool:
    """Change file mode."""
    manager = PermissionManager(None, store_path)
    success, _ = manager.chmod(path, mode)
    return success


def chown(path: str, owner: str, group: str, store_path: str = "permissions.json") -> bool:
    """Change file ownership."""
    manager = PermissionManager(None, store_path)
    success, _ = manager.chown(path, owner, group)
    return success


def check_access(
    path: str,
    user: str,
    groups: List[str],
    access: str,
    store_path: str = "permissions.json"
) -> bool:
    """Check file access."""
    manager = PermissionManager(None, store_path)
    return manager.check_access(path, user, groups, access)
