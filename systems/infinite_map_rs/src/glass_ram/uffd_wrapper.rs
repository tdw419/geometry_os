use libc;
use nix::errno::Errno;
use std::mem;
use std::os::fd::{AsRawFd, FromRawFd, RawFd};
use std::io::Read;

// -----------------------------------------------------------------------------
// Constants & Types from linux/userfaultfd.h
// -----------------------------------------------------------------------------

// Basic flags
pub const UFFD_USER_MODE_ONLY: i32 = 1;

// Features (UffdFeatureFlags)
// Manual bitflags implementation to avoid extra dependency
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct UffdFeatureFlags(pub u64);

impl UffdFeatureFlags {
    pub const PAGEFAULT_FLAG_WP: Self = Self(1 << 1);
    pub const EVENT_FORK: Self = Self(1 << 2);
    pub const EVENT_REMAP: Self = Self(1 << 3);
    pub const EVENT_REMOVE: Self = Self(1 << 4);
    pub const MISSING_HUGETLB: Self = Self(1 << 5);
    pub const MISSING_SHMEM: Self = Self(1 << 6);
    pub const EVENT_UNMAP: Self = Self(1 << 7);
    pub const SIGBUS: Self = Self(1 << 8);
    pub const THREAD_ID: Self = Self(1 << 9);

    pub fn bits(&self) -> u64 {
        self.0
    }

    pub fn from_bits_truncate(bits: u64) -> Self {
        Self(bits)
    }

    pub fn contains(&self, other: Self) -> bool {
        (self.0 & other.0) == other.0
    }
}

impl std::ops::BitOr for UffdFeatureFlags {
    type Output = Self;
    fn bitor(self, rhs: Self) -> Self {
        Self(self.0 | rhs.0)
    }
}

// IOCTL Modes (UffdIoctlMode)
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct UffdIoctlMode(pub u64);

impl UffdIoctlMode {
    pub const REGISTER_MODE_MISSING: Self = Self(1 << 0);
    pub const REGISTER_MODE_WP: Self = Self(1 << 1);
    pub const WRITEPROTECT_MODE_WP: Self = Self(1 << 0);
    pub const WRITEPROTECT_MODE_DONTWAKE: Self = Self(1 << 1);

    pub fn bits(&self) -> u64 {
        self.0
    }
    
    pub fn empty() -> Self {
        Self(0)
    }
}

impl std::ops::BitOr for UffdIoctlMode {
    type Output = Self;
    fn bitor(self, rhs: Self) -> Self {
        Self(self.0 | rhs.0)
    }
}

// UffdFlags for creation
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct UffdFlags(pub i32);

impl UffdFlags {
    pub const CLOEXEC: Self = Self(libc::O_CLOEXEC);
    pub const NONBLOCK: Self = Self(libc::O_NONBLOCK);
    pub const USER_MODE_ONLY: Self = Self(UFFD_USER_MODE_ONLY);

    pub fn bits(&self) -> i32 {
        self.0
    }
}

impl std::ops::BitOr for UffdFlags {
    type Output = Self;
    fn bitor(self, rhs: Self) -> Self {
        Self(self.0 | rhs.0)
    }
}

// -----------------------------------------------------------------------------
// IOCTL Data Structures
// -----------------------------------------------------------------------------

#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct UffdioRange {
    pub start: u64,
    pub len: u64,
}

#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct UffdioApi {
    pub api: u64,
    pub features: u64,
    pub ioctls: u64,
}

#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct UffdioRegister {
    pub range: UffdioRange,
    pub mode: u64,
    pub ioctls: u64,
}

#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct UffdioWriteProtect {
    pub range: UffdioRange,
    pub mode: u64,
}

// -----------------------------------------------------------------------------
// UFFD Message Structure (read from fd)
// -----------------------------------------------------------------------------

#[repr(C)]
#[derive(Clone, Copy)]
pub struct UffdMsg {
    pub event: u8,
    pub reserved1: u8,
    pub reserved2: u16,
    pub reserved3: u32,
    pub arg: UffdMsgArg,
}

#[repr(C)]
#[derive(Clone, Copy)]
pub union UffdMsgArg {
    pub pagefault: UffdMsgPagefault,
    pub fork: UffdMsgFork,
    pub remap: UffdMsgRemap,
    pub remove: UffdMsgRemove,
    pub reserved: [u8; 24],
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct UffdMsgPagefault {
    pub address: u64,
    pub flags: u32,
    pub feat: UffdMsgPagefaultUnion, 
}

#[repr(C)]
#[derive(Clone, Copy)]
pub union UffdMsgPagefaultUnion {
    pub ptid: u32,
}

impl std::fmt::Debug for UffdMsgPagefaultUnion {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        unsafe { write!(f, "{{ ptid: {} }}", self.ptid) }
    }
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct UffdMsgFork {
    pub ufd: u32,
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct UffdMsgRemap {
    pub old: u64,
    pub new: u64,
    pub len: u64,
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct UffdMsgRemove {
    pub start: u64,
    pub end: u64,
}

// Event Types for high level usage
#[derive(Debug, Clone)]
pub enum UffdEventType {
    PageFault(PageFaultEvent),
    Fork { ufd: u32 },
    Remap { old: u64, new: u64, len: u64 },
    Remove { start: u64, end: u64 },
    Unmap { start: u64, end: u64 },
    Unknown(u8),
}

#[derive(Debug, Clone)]
pub struct PageFaultEvent {
    pub address: u64,
    pub flags: u32,
    pub thread_id: Option<u32>,
}

// -----------------------------------------------------------------------------
// IOCTL Definitions
// -----------------------------------------------------------------------------

const UFFDIO: u8 = 0xAA;
const API: u8 = 0x3F;
const REGISTER: u8 = 0x00;
const WRITEPROTECT: u8 = 0x06;

// Direct libc ioctl calls for userfaultfd operations
unsafe fn uffdio_api(fd: RawFd, api_struct: *mut UffdioApi) -> nix::Result<i32> {
    let ret = libc::ioctl(fd, 0xC0183F3F, api_struct); // _IOWR(0xAA, 0x3F, UffdioApi)
    if ret < 0 {
        Err(Errno::last())
    } else {
        Ok(ret)
    }
}

unsafe fn uffdio_register(fd: RawFd, reg_struct: *mut UffdioRegister) -> nix::Result<i32> {
    let ret = libc::ioctl(fd, 0xC018AA00, reg_struct); // _IOWR(0xAA, 0x00, UffdioRegister)
    if ret < 0 {
        Err(Errno::last())
    } else {
        Ok(ret)
    }
}

unsafe fn uffdio_writeprotect(fd: RawFd, wp_struct: *mut UffdioWriteProtect) -> nix::Result<i32> {
    let ret = libc::ioctl(fd, 0xC010AA06, wp_struct); // _IOW(0xAA, 0x06, UffdioWriteProtect)
    if ret < 0 {
        Err(Errno::last())
    } else {
        Ok(ret)
    }
}

// -----------------------------------------------------------------------------
// UserfaultFd Wrapper
// -----------------------------------------------------------------------------

pub struct UserfaultFd {
    file: std::fs::File,
}

impl UserfaultFd {
    /// Create a new userfaultfd object
    pub fn new(flags: UffdFlags) -> Result<Self, nix::Error> {
        let fd_flags = flags.bits();
        // syscall usage
        let fd = unsafe { libc::syscall(libc::SYS_userfaultfd, fd_flags) };
        
        if fd < 0 {
            return Err(Errno::last());
        }

        let file = unsafe { std::fs::File::from_raw_fd(fd as RawFd) };
        Ok(Self { file })
    }

    pub fn api(&self, features: UffdFeatureFlags) -> Result<UffdFeatureFlags, nix::Error> {
        let mut api_struct = UffdioApi {
            api: 0xAA, // UFFD_API
            features: features.bits(),
            ioctls: 0,
        };

        unsafe {
            uffdio_api(self.file.as_raw_fd(), &mut api_struct)?;
        }

        Ok(UffdFeatureFlags::from_bits_truncate(api_struct.features))
    }

    pub fn register(&self, start: u64, len: u64, mode: UffdIoctlMode) -> Result<(), nix::Error> {
        let mut reg_struct = UffdioRegister {
            range: UffdioRange { start, len },
            mode: mode.bits(),
            ioctls: 0,
        };

        unsafe {
            uffdio_register(self.file.as_raw_fd(), &mut reg_struct)?;
        }
        
        Ok(())
    }

    pub fn write_protect(&self, start: u64, len: u64, enable: bool) -> Result<(), nix::Error> {
        let mode = if enable { 
            UffdIoctlMode::WRITEPROTECT_MODE_WP 
        } else { 
            UffdIoctlMode::empty() 
        };
        
        // Note: write protect uses UffdioWriteProtect struct not Register
        let mut wp_struct = UffdioWriteProtect {
            range: UffdioRange { start, len },
            mode: mode.bits(),
        };

        unsafe {
            uffdio_writeprotect(self.file.as_raw_fd(), &mut wp_struct)?;
        }

        Ok(())
    }

    pub fn read_event(&mut self) -> Result<Option<UffdEventType>, nix::Error> {
        let mut buf = [0u8; mem::size_of::<UffdMsg>()];
        match self.file.read(&mut buf) {
             // ... existing match arms ...
            Ok(n) => {
                if n != mem::size_of::<UffdMsg>() {
                     return Err(Errno::EIO);
                }
                let msg: UffdMsg = unsafe { mem::transmute(buf) };
                
                let event = unsafe {
                    match msg.event {
                        0x12 => { // UFFD_EVENT_PAGEFAULT
                            UffdEventType::PageFault(PageFaultEvent {
                                address: msg.arg.pagefault.address,
                                flags: msg.arg.pagefault.flags,
                                thread_id: Some(msg.arg.pagefault.feat.ptid),
                            })
                        },
                        0x13 => UffdEventType::Fork { ufd: msg.arg.fork.ufd },
                        0x14 => UffdEventType::Remap { 
                            old: msg.arg.remap.old, 
                            new: msg.arg.remap.new, 
                            len: msg.arg.remap.len 
                        },
                        0x15 => UffdEventType::Remove { 
                            start: msg.arg.remove.start, 
                            end: msg.arg.remove.end 
                        },
                        0x16 => UffdEventType::Unmap {
                             start: msg.arg.remove.start, // Reuse remove struct
                             end: msg.arg.remove.end 
                        },
                        e => UffdEventType::Unknown(e),
                    }
                };
                Ok(Some(event))
            }
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => Ok(None),
            Err(e) => {
                if let Some(errno) = e.raw_os_error() {
                    Err(Errno::from_i32(errno))
                } else {
                    Err(Errno::EIO)
                }
            }
        }
    }

    pub fn try_clone(&self) -> Result<Self, std::io::Error> {
        let file = self.file.try_clone()?;
        Ok(Self { file })
    }
}

impl AsRawFd for UserfaultFd {
    fn as_raw_fd(&self) -> RawFd {
        self.file.as_raw_fd()
    }
}
