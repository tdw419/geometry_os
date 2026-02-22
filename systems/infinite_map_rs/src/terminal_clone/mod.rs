// Terminal Clone: VM-to-PixelRTS Extraction & PTY Integration
//
// This module provides the infrastructure for "ripping" terminals from
// VM framebuffers and providing native PTY support for local shells.
//
// PixelRTS v3 Integration:
// Terminal cells are encoded as RGBA pixels for GPU-native rendering:
//   R (Char):   ASCII character code (0-127)
//   G (FG):     Foreground color index (0-15)
//   B (BG):     Background color index (0-15)
//   A (Flags):  Style flags (bold=1, dim=2, italic=4, underline=8, blink=16, inverse=32)

pub mod geometric_bridge;
pub mod pty_engine;
pub mod terminal_renderer;

#[cfg(feature = "hypervisor")]
pub mod terminal_clone_manager;

pub use geometric_bridge::{GeometricCell, GeometricTerminalBuffer, TERMINAL_PALETTE};
pub use pty_engine::PtyEngine;
#[cfg(feature = "hypervisor")]
pub use terminal_clone_manager::TerminalCloneManager;
pub use terminal_renderer::TerminalRenderer;
