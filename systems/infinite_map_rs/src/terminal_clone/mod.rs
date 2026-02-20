// Terminal Clone: VM-to-PixelRTS Extraction & PTY Integration
//
// This module provides the infrastructure for "ripping" terminals from
// VM framebuffers and providing native PTY support for local shells.

pub mod pty_engine;
pub mod terminal_clone_manager;

pub use pty_engine::PtyEngine;
pub use terminal_clone_manager::TerminalCloneManager;
