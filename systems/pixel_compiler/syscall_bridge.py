"""
Syscall Bridge - Linux to WASI translation module.

This module provides a bridge for translating Linux syscalls to their
WASI (WebAssembly System Interface) equivalents. It maintains registries
of supported and unsupported syscalls, along with metadata about
translation requirements.

Classes:
    WASIFunction: Enum of WASI functions
    SyscallMapping: Dataclass for syscall metadata
    SyscallBridge: Main bridge class for syscall translation
"""

from dataclasses import dataclass
from enum import Enum
from typing import Dict, Optional


class WASIFunction(Enum):
    """WASI (WebAssembly System Interface) function identifiers.

    These represent the standard WASI API functions that Linux syscalls
    can be translated to.
    """
    FD_WRITE = "fd_write"
    FD_READ = "fd_read"
    FD_CLOSE = "fd_close"
    FD_OPEN = "fd_open"
    PROC_EXIT = "proc_exit"
    CLOCK_TIME_GET = "clock_time_get"
    RANDOM_GET = "random_get"
    ARGS_GET = "args_get"
    ENVIRON_GET = "environ_get"
    ENVIRON_SIZES_GET = "environ_sizes_get"
    FD_SEEK = "fd_seek"
    FD_TELL = "fd_tell"
    FD_FDSTAT_GET = "fd_fdstat_get"
    FD_FDSTAT_SET_FLAGS = "fd_fdstat_set_flags"
    FD_PRESTAT_GET = "fd_prestat_get"
    FD_PRESTAT_DIR_NAME = "fd_prestat_dir_name"
    PATH_FILESTAT_GET = "path_filestat_get"
    PATH_FILESTAT_SET_TIMES = "path_filestat_set_times"
    PATH_OPEN = "path_open"
    PATH_READLINK = "path_readlink"
    PATH_RENAME = "path_rename"
    PATH_UNLINK_FILE = "path_unlink_file"


@dataclass
class SyscallMapping:
    """Mapping information for a Linux syscall to WASI.

    Attributes:
        linux_name: The Linux syscall name
        wasi_function: The corresponding WASI function enum
        signature_compatible: Whether the signatures are directly compatible
        translation_needed: Whether argument/result translation is required
        notes: Additional notes about the translation
    """
    linux_name: str
    wasi_function: WASIFunction
    signature_compatible: bool
    translation_needed: bool
    notes: str


class SyscallBridge:
    """Bridge for translating Linux syscalls to WASI equivalents.

    This class maintains mappings between Linux syscalls and their WASI
    counterparts, and provides methods for checking support and generating
    stub implementations for unsupported syscalls.

    The bridge distinguishes between:
    1. Direct mappings - syscalls with 1:1 WASI equivalents
    2. Translatable mappings - syscalls that need argument/result conversion
    3. Unsupported mappings - syscalls without WASI equivalents
    """

    # Linux to WASI syscall mappings for supported syscalls
    LINUX_TO_WASI: Dict[str, SyscallMapping] = {
        'write': SyscallMapping(
            linux_name='write',
            wasi_function=WASIFunction.FD_WRITE,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs IOV translation and return value conversion'
        ),
        'read': SyscallMapping(
            linux_name='read',
            wasi_function=WASIFunction.FD_READ,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs IOV translation and return value conversion'
        ),
        'open': SyscallMapping(
            linux_name='open',
            wasi_function=WASIFunction.FD_OPEN,
            signature_compatible=False,
            translation_needed=True,
            notes='Deprecated: prefer openat. Needs flag translation.'
        ),
        'openat': SyscallMapping(
            linux_name='openat',
            wasi_function=WASIFunction.PATH_OPEN,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs path translation and flag conversion'
        ),
        'close': SyscallMapping(
            linux_name='close',
            wasi_function=WASIFunction.FD_CLOSE,
            signature_compatible=True,
            translation_needed=False,
            notes='Direct mapping'
        ),
        'exit': SyscallMapping(
            linux_name='exit',
            wasi_function=WASIFunction.PROC_EXIT,
            signature_compatible=True,
            translation_needed=False,
            notes='Direct mapping (exit_group preferred)'
        ),
        'exit_group': SyscallMapping(
            linux_name='exit_group',
            wasi_function=WASIFunction.PROC_EXIT,
            signature_compatible=True,
            translation_needed=False,
            notes='Direct mapping to proc_exit'
        ),
        'clock_gettime': SyscallMapping(
            linux_name='clock_gettime',
            wasi_function=WASIFunction.CLOCK_TIME_GET,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs clock ID translation'
        ),
        'getrandom': SyscallMapping(
            linux_name='getrandom',
            wasi_function=WASIFunction.RANDOM_GET,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs flag handling (GRND_NONBLOCK, GRND_RANDOM)'
        ),
        'lseek': SyscallMapping(
            linux_name='lseek',
            wasi_function=WASIFunction.FD_SEEK,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs whence flag translation'
        ),
        'fstat': SyscallMapping(
            linux_name='fstat',
            wasi_function=WASIFunction.FD_FDSTAT_GET,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs stat structure translation'
        ),
        'stat': SyscallMapping(
            linux_name='stat',
            wasi_function=WASIFunction.PATH_FILESTAT_GET,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs path and stat structure translation'
        ),
        'fstatat': SyscallMapping(
            linux_name='fstatat',
            wasi_function=WASIFunction.PATH_FILESTAT_GET,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs path and stat structure translation'
        ),
        'getcwd': SyscallMapping(
            linux_name='getcwd',
            wasi_function=WASIFunction.FD_PRESTAT_DIR_NAME,
            signature_compatible=False,
            translation_needed=True,
            notes='Derived from fd_prestat_get and fd_prestat_dir_name'
        ),
    }

    # Unsupported syscalls - no WASI equivalent
    UNSUPPORTED_SYSCALLS: Dict[str, str] = {
        'fork': 'No process creation in WASI',
        'clone': 'No process creation in WASI',
        'execve': 'No process execution in WASI',
        'execveat': 'No process execution in WASI',
        'wait4': 'No child processes in WASI',
        'waitpid': 'No child processes in WASI',
        'ptrace': 'No process tracing in WASI',
        'kill': 'No signal support in WASI',
        'signal': 'No signal support in WASI',
        'sigaction': 'No signal support in WASI',
        'sigprocmask': 'No signal support in WASI',
        'mmap': 'No direct memory mapping in WASI (uses linear memory)',
        'mprotect': 'No memory protection in WASI',
        'munmap': 'No memory unmapping in WASI',
        'mremap': 'No memory remapping in WASI',
        'brk': 'No break concept in WASI',
        'sbrk': 'No break concept in WASI',
        'pipe': 'No pipes in WASI',
        'pipe2': 'No pipes in WASI',
        'socket': 'No sockets in WASI',
        'connect': 'No sockets in WASI',
        'bind': 'No sockets in WASI',
        'listen': 'No sockets in WASI',
        'accept': 'No sockets in WASI',
        'send': 'No sockets in WASI',
        'recv': 'No sockets in WASI',
        'sendto': 'No sockets in WASI',
        'recvfrom': 'No sockets in WASI',
        'shutdown': 'No sockets in WASI',
        'setsockopt': 'No sockets in WASI',
        'getsockopt': 'No sockets in WASI',
        'getpid': 'No PIDs in WASI',
        'getppid': 'No PIDs in WASI',
        'gettid': 'No threads in WASI',
        'setuid': 'No users in WASI',
        'setgid': 'No users in WASI',
        'getuid': 'No users in WASI',
        'getgid': 'No users in WASI',
        'seteuid': 'No users in WASI',
        'setegid': 'No users in WASI',
        'chown': 'No users in WASI',
        'fchown': 'No users in WASI',
        'lchown': 'No users in WASI',
        'chmod': 'Limited permission support in WASI',
        'fchmod': 'Limited permission support in WASI',
        'umask': 'Limited permission support in WASI',
        'link': 'No hard links in WASI',
        'unlink': 'Use path_unlink_file',
        'rmdir': 'Use path_unlink_file',
        'rename': 'Use path_rename',
        'symlink': 'Use path_symlink (not in core WASI)',
        'readlink': 'Use path_readlink',
        'realpath': 'Use path_readlink with resolution',
        'access': 'Use path_filestat_get',
        'faccessat': 'Use path_filestat_get',
        'dup': 'No dup in WASI',
        'dup2': 'No dup in WASI',
        'dup3': 'No dup in WASI',
        'select': 'No select in WASI',
        'poll': 'No poll in WASI',
        'epoll_create': 'No epoll in WASI',
        'epoll_wait': 'No epoll in WASI',
        'epoll_ctl': 'No epoll in WASI',
        'inotify_init': 'No inotify in WASI',
        'inotify_add_watch': 'No inotify in WASI',
        'inotify_rm_watch': 'No inotify in WASI',
    }

    def get_wasi_function(self, syscall_name: str) -> Optional[SyscallMapping]:
        """Get the WASI mapping for a Linux syscall.

        Args:
            syscall_name: The Linux syscall name to look up

        Returns:
            SyscallMapping if found, None otherwise
        """
        return self.LINUX_TO_WASI.get(syscall_name)

    def check_syscall_supported(self, syscall_name: str) -> bool:
        """Check if a Linux syscall is supported in WASI.

        A syscall is considered supported if it has a mapping in
        LINUX_TO_WASI. Syscalls in UNSUPPORTED_SYSCALLS are not supported.

        Args:
            syscall_name: The Linux syscall name to check

        Returns:
            True if the syscall has a WASI equivalent, False otherwise
        """
        return syscall_name in self.LINUX_TO_WASI

    def generate_stub_wasm(self, syscall_name: str) -> bytes:
        """Generate a stub WASM function for an unsupported syscall.

        The stub function will return an error code (typically -ENOSYS
        or 38 for "function not implemented").

        Args:
            syscall_name: The name of the unsupported syscall

        Returns:
            WASM bytecode for the stub function
        """
        # Generate minimal WASM stub that returns -ENOSYS (38)
        # This is a simplified WASM binary structure

        # WASM magic number and version
        wasm = b'\x00asm\x01\x00\x00\x00'

        # Type section - function type with no params and i32 result
        wasm += b'\x01'  # section id (type)
        wasm += b'\x04'  # section length
        wasm += b'\x01'  # num types
        wasm += b'\x60'  # func type
        wasm += b'\x00'  # num params
        wasm += b'\x01'  # num results
        wasm += b'\x7f'  # i32

        # Function section - declare our stub function
        wasm += b'\x03'  # section id (function)
        wasm += b'\x02'  # section length
        wasm += b'\x01'  # num functions
        wasm += b'\x00'  # type index

        # Export section - export the stub with syscall name
        name_bytes = syscall_name.encode('utf-8')
        wasm += b'\x07'  # section id (export)
        wasm += bytes([2 + len(name_bytes)])  # section length
        wasm += b'\x01'  # num exports
        wasm += bytes([len(name_bytes)])  # name length
        wasm += name_bytes  # name
        wasm += b'\x00'  # kind (function)
        wasm += b'\x00'  # func index

        # Code section - function body returning -ENOSYS (38)
        wasm += b'\x0a'  # section id (code)
        wasm += b'\x06'  # section length
        wasm += b'\x01'  # num functions
        wasm += b'\x04'  # body size
        wasm += b'\x00'  # num locals
        wasm += b'\x41'  # OP_I32_CONST
        wasm += b'\x26'  # 38 (ENOSYS)
        wasm += b'\x0b'  # OP_END

        return wasm

    def list_supported_syscalls(self) -> Dict[str, SyscallMapping]:
        """Get a dictionary of all supported syscalls.

        Returns:
            Dictionary mapping syscall names to their mappings
        """
        return self.LINUX_TO_WASI.copy()

    def list_unsupported_syscalls(self) -> Dict[str, str]:
        """Get a dictionary of all unsupported syscalls.

        Returns:
            Dictionary mapping syscall names to reasons they're unsupported
        """
        return self.UNSUPPORTED_SYSCALLS.copy()

    def get_translation_info(self, syscall_name: str) -> Optional[str]:
        """Get detailed translation information for a syscall.

        Args:
            syscall_name: The Linux syscall name

        Returns:
            Translation notes string, or None if syscall unknown
        """
        if syscall_name in self.LINUX_TO_WASI:
            return self.LINUX_TO_WASI[syscall_name].notes
        elif syscall_name in self.UNSUPPORTED_SYSCALLS:
            return f"Unsupported: {self.UNSUPPORTED_SYSCALLS[syscall_name]}"
        return None
