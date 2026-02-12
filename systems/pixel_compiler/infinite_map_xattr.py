#!/usr/bin/env python3
"""
Infinite Map Extended Attributes System.

Provides extended attribute (xattr) support for the Infinite Map filesystem,
similar to Linux xattr functionality.

Key Components:
- XAttrEntry: Single extended attribute
- XAttrStore: Manages xattr storage and retrieval
- XAttrManager: Unified xattr management interface

Usage:
    from infinite_map_xattr import XAttrManager

    manager = XAttrManager(xattr_store_path="xattr.json")

    # Set extended attribute
    manager.set("/path/to/file", "user.comment", b"Important file")

    # Get extended attribute
    value = manager.get("/path/to/file", "user.comment")

    # List attributes
    attrs = manager.list("/path/to/file")

    # Remove attribute
    manager.remove("/path/to/file", "user.comment")
"""

import os
import json
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple, Set, Union
from datetime import datetime
from enum import Enum
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class XAttrNamespace(Enum):
    """Extended attribute namespaces."""
    USER = "user"           # User attributes
    SYSTEM = "system"       # System attributes
    SECURITY = "security"   # Security attributes (SELinux, etc.)
    TRUSTED = "trusted"     # Trusted attributes (root only)
    ALL = "all"             # Match all namespaces


@dataclass
class XAttrEntry:
    """Single extended attribute."""
    name: str
    value: bytes
    namespace: XAttrNamespace
    created_at: datetime
    modified_at: datetime
    flags: int = 0  # For future use (e.g., immutable flag)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "name": self.name,
            "value": self.value.hex(),  # Store as hex string
            "namespace": self.namespace.value,
            "created_at": self.created_at.isoformat(),
            "modified_at": self.modified_at.isoformat(),
            "flags": self.flags
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "XAttrEntry":
        """Create from dictionary."""
        return cls(
            name=data["name"],
            value=bytes.fromhex(data["value"]),
            namespace=XAttrNamespace(data["namespace"]),
            created_at=datetime.fromisoformat(data["created_at"]),
            modified_at=datetime.fromisoformat(data["modified_at"]),
            flags=data.get("flags", 0)
        )

    def get_full_name(self) -> str:
        """Get full attribute name with namespace prefix."""
        return f"{self.namespace.value}.{self.name}"


@dataclass
class XAttrInfo:
    """Information about a file's extended attributes."""
    path: str
    total_size: int
    attribute_count: int
    namespaces: Set[XAttrNamespace]
    attributes: List[str]

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "path": self.path,
            "total_size": self.total_size,
            "attribute_count": self.attribute_count,
            "namespaces": [ns.value for ns in self.namespaces],
            "attributes": self.attributes
        }


class XAttrStore:
    """
    Manages extended attribute storage and retrieval.

    Stores xattrs in a JSON file with atomic updates.
    """

    # Standard attribute name prefixes
    NAMESPACE_PREFIXES = {
        "user.": XAttrNamespace.USER,
        "system.": XAttrNamespace.SYSTEM,
        "security.": XAttrNamespace.SECURITY,
        "trusted.": XAttrNamespace.TRUSTED,
    }

    def __init__(self, store_path: str):
        self.store_path = Path(store_path)
        # path -> {attr_name -> XAttrEntry}
        self.attributes: Dict[str, Dict[str, XAttrEntry]] = {}
        self.lock = threading.RLock()
        self._load()

    def _load(self):
        """Load xattr store from disk."""
        if self.store_path.exists():
            try:
                with open(self.store_path, "r") as f:
                    data = json.load(f)
                    self.attributes = {}
                    for path, attrs in data.get("attributes", {}).items():
                        self.attributes[path] = {
                            name: XAttrEntry.from_dict(entry)
                            for name, entry in attrs.items()
                        }
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Failed to load xattr store: {e}")
                self.attributes = {}

    def _save(self):
        """Save xattr store to disk."""
        with self.lock:
            data = {
                "version": 1,
                "attributes": {
                    path: {
                        name: entry.to_dict()
                        for name, entry in attrs.items()
                    }
                    for path, attrs in self.attributes.items()
                }
            }
            # Atomic write
            temp_path = self.store_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.store_path)

    def parse_attr_name(self, name: str) -> Tuple[XAttrNamespace, str]:
        """
        Parse attribute name into namespace and name.

        Args:
            name: Full attribute name (e.g., "user.comment")

        Returns:
            Tuple of (namespace, attr_name)
        """
        for prefix, namespace in self.NAMESPACE_PREFIXES.items():
            if name.startswith(prefix):
                return namespace, name[len(prefix):]

        # Default to user namespace if no prefix
        return XAttrNamespace.USER, name

    def set(self, path: str, name: str, value: bytes) -> bool:
        """
        Set an extended attribute.

        Args:
            path: File path
            name: Attribute name (with namespace prefix)
            value: Attribute value

        Returns:
            True if successful
        """
        with self.lock:
            if path not in self.attributes:
                self.attributes[path] = {}

            namespace, attr_name = self.parse_attr_name(name)
            now = datetime.now()

            # Check if attribute already exists
            if name in self.attributes[path]:
                # Update existing
                entry = self.attributes[path][name]
                entry.value = value
                entry.modified_at = now
            else:
                # Create new
                entry = XAttrEntry(
                    name=attr_name,
                    value=value,
                    namespace=namespace,
                    created_at=now,
                    modified_at=now
                )
                self.attributes[path][name] = entry

            self._save()
            return True

    def get(self, path: str, name: str) -> Optional[bytes]:
        """
        Get an extended attribute value.

        Args:
            path: File path
            name: Attribute name

        Returns:
            Attribute value or None if not found
        """
        with self.lock:
            if path not in self.attributes:
                return None
            entry = self.attributes[path].get(name)
            return entry.value if entry else None

    def get_entry(self, path: str, name: str) -> Optional[XAttrEntry]:
        """Get full attribute entry."""
        with self.lock:
            if path not in self.attributes:
                return None
            return self.attributes[path].get(name)

    def list(self, path: str, namespace: XAttrNamespace = None) -> List[str]:
        """
        List extended attribute names for a path.

        Args:
            path: File path
            namespace: Optional namespace filter

        Returns:
            List of attribute names
        """
        with self.lock:
            if path not in self.attributes:
                return []

            attrs = list(self.attributes[path].keys())

            if namespace and namespace != XAttrNamespace.ALL:
                prefix = f"{namespace.value}."
                attrs = [a for a in attrs if a.startswith(prefix)]

            return attrs

    def remove(self, path: str, name: str) -> bool:
        """
        Remove an extended attribute.

        Returns:
            True if removed, False if not found
        """
        with self.lock:
            if path not in self.attributes:
                return False

            if name not in self.attributes[path]:
                return False

            del self.attributes[path][name]

            # Clean up empty path entries
            if not self.attributes[path]:
                del self.attributes[path]

            self._save()
            return True

    def remove_all(self, path: str) -> int:
        """
        Remove all extended attributes for a path.

        Returns:
            Number of attributes removed
        """
        with self.lock:
            if path not in self.attributes:
                return 0

            count = len(self.attributes[path])
            del self.attributes[path]
            self._save()
            return count

    def has_attributes(self, path: str) -> bool:
        """Check if path has any extended attributes."""
        with self.lock:
            return path in self.attributes and len(self.attributes[path]) > 0

    def get_info(self, path: str) -> XAttrInfo:
        """Get information about a file's extended attributes."""
        with self.lock:
            if path not in self.attributes:
                return XAttrInfo(
                    path=path,
                    total_size=0,
                    attribute_count=0,
                    namespaces=set(),
                    attributes=[]
                )

            attrs = self.attributes[path]
            total_size = sum(len(e.value) for e in attrs.values())
            namespaces = {e.namespace for e in attrs.values()}

            return XAttrInfo(
                path=path,
                total_size=total_size,
                attribute_count=len(attrs),
                namespaces=namespaces,
                attributes=list(attrs.keys())
            )

    def copy_attributes(self, src_path: str, dst_path: str) -> int:
        """
        Copy all attributes from source to destination.

        Returns:
            Number of attributes copied
        """
        with self.lock:
            if src_path not in self.attributes:
                return 0

            if dst_path not in self.attributes:
                self.attributes[dst_path] = {}

            count = 0
            now = datetime.now()

            for name, entry in self.attributes[src_path].items():
                new_entry = XAttrEntry(
                    name=entry.name,
                    value=entry.value,
                    namespace=entry.namespace,
                    created_at=now,
                    modified_at=now,
                    flags=entry.flags
                )
                self.attributes[dst_path][name] = new_entry
                count += 1

            self._save()
            return count

    def get_stats(self) -> Dict[str, Any]:
        """Get store statistics."""
        with self.lock:
            total_attrs = sum(len(attrs) for attrs in self.attributes.values())
            total_size = sum(
                len(e.value)
                for attrs in self.attributes.values()
                for e in attrs.values()
            )
            namespaces = set()
            for attrs in self.attributes.values():
                for e in attrs.values():
                    namespaces.add(e.namespace)

            return {
                "total_files": len(self.attributes),
                "total_attributes": total_attrs,
                "total_size_bytes": total_size,
                "namespaces_used": [ns.value for ns in namespaces]
            }


class XAttrManager:
    """
    Unified extended attribute management interface.

    Provides a high-level API for xattr operations with
    permission checking and validation.
    """

    # Maximum attribute value size (similar to Linux XATTR_SIZE_MAX)
    MAX_VALUE_SIZE = 65536

    # Maximum attribute name size
    MAX_NAME_SIZE = 255

    # Maximum attributes per file
    MAX_ATTRS_PER_FILE = 1024

    def __init__(
        self,
        vat,
        xattr_store_path: str,
        allow_system: bool = False,
        allow_trusted: bool = False
    ):
        self.vat = vat
        self.store = XAttrStore(xattr_store_path)
        self.allow_system = allow_system
        self.allow_trusted = allow_trusted
        self.lock = threading.RLock()

    def set(
        self,
        path: str,
        name: str,
        value: bytes,
        create_only: bool = False,
        replace_only: bool = False
    ) -> Tuple[bool, str]:
        """
        Set an extended attribute.

        Args:
            path: File path
            name: Attribute name (with namespace prefix)
            value: Attribute value
            create_only: Fail if attribute already exists
            replace_only: Fail if attribute doesn't exist

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            # Validate name
            if len(name) > self.MAX_NAME_SIZE:
                return False, f"Attribute name too long (max {self.MAX_NAME_SIZE})"

            # Validate value
            if len(value) > self.MAX_VALUE_SIZE:
                return False, f"Attribute value too large (max {self.MAX_VALUE_SIZE})"

            # Check namespace permissions
            namespace, _ = self.store.parse_attr_name(name)
            if namespace == XAttrNamespace.SYSTEM and not self.allow_system:
                return False, "System namespace not allowed"
            if namespace == XAttrNamespace.TRUSTED and not self.allow_trusted:
                return False, "Trusted namespace not allowed"

            # Check attribute count limit
            info = self.store.get_info(path)
            if info.attribute_count >= self.MAX_ATTRS_PER_FILE:
                if name not in [a for a in info.attributes]:
                    return False, f"Maximum attributes per file reached ({self.MAX_ATTRS_PER_FILE})"

            # Check create/replace flags
            existing = self.store.get(path, name)
            if create_only and existing is not None:
                return False, f"Attribute already exists: {name}"
            if replace_only and existing is None:
                return False, f"Attribute doesn't exist: {name}"

            # Set the attribute
            success = self.store.set(path, name, value)

            if success:
                logger.info(f"Set xattr: {path}:{name} ({len(value)} bytes)")
                return True, f"Attribute set: {name}"
            else:
                return False, "Failed to set attribute"

    def get(self, path: str, name: str) -> Tuple[bool, Union[bytes, str]]:
        """
        Get an extended attribute value.

        Returns:
            Tuple of (success, value_or_error_message)
        """
        with self.lock:
            value = self.store.get(path, name)

            if value is None:
                return False, f"Attribute not found: {name}"

            return True, value

    def list(
        self,
        path: str,
        namespace: XAttrNamespace = None
    ) -> List[str]:
        """
        List extended attribute names.

        Args:
            path: File path
            namespace: Optional namespace filter

        Returns:
            List of attribute names
        """
        return self.store.list(path, namespace)

    def remove(self, path: str, name: str) -> Tuple[bool, str]:
        """
        Remove an extended attribute.

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            success = self.store.remove(path, name)

            if success:
                logger.info(f"Removed xattr: {path}:{name}")
                return True, f"Attribute removed: {name}"
            else:
                return False, f"Attribute not found: {name}"

    def get_info(self, path: str) -> XAttrInfo:
        """Get information about a file's extended attributes."""
        return self.store.get_info(path)

    def copy(self, src_path: str, dst_path: str) -> Tuple[bool, str]:
        """
        Copy all attributes from source to destination.

        Returns:
            Tuple of (success, message)
        """
        count = self.store.copy_attributes(src_path, dst_path)

        if count > 0:
            return True, f"Copied {count} attributes"
        else:
            return True, "No attributes to copy"

    def remove_all(self, path: str) -> int:
        """Remove all extended attributes for a path."""
        return self.store.remove_all(path)

    def has_attributes(self, path: str) -> bool:
        """Check if path has any extended attributes."""
        return self.store.has_attributes(path)

    def get_stats(self) -> Dict[str, Any]:
        """Get manager statistics."""
        return self.store.get_stats()

    # Convenience methods for common attribute operations

    def set_user_comment(self, path: str, comment: str) -> bool:
        """Set user.comment attribute."""
        success, _ = self.set(path, "user.comment", comment.encode("utf-8"))
        return success

    def get_user_comment(self, path: str) -> Optional[str]:
        """Get user.comment attribute."""
        success, value = self.get(path, "user.comment")
        if success:
            return value.decode("utf-8")
        return None

    def set_mime_type(self, path: str, mime_type: str) -> bool:
        """Set user.mime_type attribute."""
        success, _ = self.set(path, "user.mime_type", mime_type.encode("utf-8"))
        return success

    def get_mime_type(self, path: str) -> Optional[str]:
        """Get user.mime_type attribute."""
        success, value = self.get(path, "user.mime_type")
        if success:
            return value.decode("utf-8")
        return None

    def set_tags(self, path: str, tags: List[str]) -> bool:
        """Set user.tags attribute (comma-separated)."""
        tag_str = ",".join(tags)
        success, _ = self.set(path, "user.tags", tag_str.encode("utf-8"))
        return success

    def get_tags(self, path: str) -> List[str]:
        """Get user.tags attribute."""
        success, value = self.get(path, "user.tags")
        if success:
            return value.decode("utf-8").split(",")
        return []


# Convenience functions

def set_xattr(path: str, name: str, value: bytes, store_path: str = "xattr.json") -> bool:
    """Set an extended attribute."""
    manager = XAttrManager(None, store_path)
    success, _ = manager.set(path, name, value)
    return success


def get_xattr(path: str, name: str, store_path: str = "xattr.json") -> Optional[bytes]:
    """Get an extended attribute."""
    manager = XAttrManager(None, store_path)
    success, value = manager.get(path, name)
    return value if success else None


def list_xattr(path: str, store_path: str = "xattr.json") -> List[str]:
    """List extended attribute names."""
    manager = XAttrManager(None, store_path)
    return manager.list(path)


def remove_xattr(path: str, name: str, store_path: str = "xattr.json") -> bool:
    """Remove an extended attribute."""
    manager = XAttrManager(None, store_path)
    success, _ = manager.remove(path, name)
    return success
