//! Input Module
//!
//! This module handles input events for the infinite map, including:
//! - Drag-and-drop of .rts.png files
//! - Mouse and keyboard input
//! - File processing
//!
//! # Drag-and-Drop
//!
//! The drag handler detects WGSL .rts.png files by their first pixel color
//! (blue-purple: R < 100, B > 150) and processes them to create ExecutionZones.

pub mod drag_handler;

// Re-export main drag handler functions for convenience
pub use drag_handler::{get_file_name, handle_file_drop, is_wgsl_rts_png};
