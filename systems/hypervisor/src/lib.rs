//! Geometry OS Hypervisor
//!
//! Network Boot Loader with SHA256 integrity validation.
//!
//! This crate provides:
//! - `boot_frame` - Binary frame protocol for network boot
//! - `net_loader` - WebSocket client for receiving boot frames
//!
//! Task 3: Create Rust Net Loader
//! Phase 8: Network Boot

pub mod boot_frame;
pub mod net_loader;

pub use boot_frame::{BootFrame, BootFrameError, END_OF_STREAM_MARKER};
pub use net_loader::{NetLoader, NetLoaderError};

// Re-export for convenience
pub mod prelude {
    pub use crate::boot_frame::{BootFrame, BootFrameError, END_OF_STREAM_MARKER};
    pub use crate::net_loader::{NetLoader, NetLoaderError};
}
