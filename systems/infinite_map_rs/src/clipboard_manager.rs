// systems/infinite_map_rs/src/clipboard_manager.rs
// Phase 31: Host Clipboard Manager
// Handles interactions with the host OS clipboard using copypasta

use crate::clipboard_rts::ClipboardRTS;
use copypasta::{ClipboardContext, ClipboardProvider};
use std::sync::{Arc, Mutex};

/// Shared Clipboard Manager
/// Can be safely shared between threads (e.g. InputManager and App)
#[derive(Clone)]
pub struct SharedClipboardManager {
    context: Arc<Mutex<Option<ClipboardContext>>>,
    /// Phase 31.2: RTS Clipboard for visual persistence
    rts_clipboard: Arc<Mutex<Option<Arc<ClipboardRTS>>>>,
}

#[derive(Clone)]
pub struct ClipboardData {
    pub mime_type: String,
    pub data: Vec<u8>,
}

impl SharedClipboardManager {
    /// Create a new clipboard manager
    pub fn new() -> Self {
        let ctx = match ClipboardContext::new() {
            Ok(ctx) => Some(ctx),
            Err(e) => {
                log::error!("Failed to initialize clipboard context: {}", e);
                None
            },
        };

        Self {
            context: Arc::new(Mutex::new(ctx)),
            rts_clipboard: Arc::new(Mutex::new(None)),
        }
    }

    /// Get current text content from clipboard
    pub fn get_text(&self) -> Option<String> {
        let mut guard = self.context.lock().unwrap();
        if let Some(ctx) = guard.as_mut() {
            match ctx.get_contents() {
                Ok(text) => Some(text),
                Err(e) => {
                    log::debug!("Failed to get clipboard contents: {}", e);
                    None
                },
            }
        } else {
            None
        }
    }

    /// Set text content to clipboard
    pub fn set_text(&self, text: String) -> Result<(), String> {
        let mut guard = self.context.lock().unwrap();
        if let Some(ctx) = guard.as_mut() {
            match ctx.set_contents(text) {
                Ok(_) => Ok(()),
                Err(e) => Err(format!("Failed to set clipboard contents: {}", e)),
            }
        } else {
            Err("Clipboard context not available".to_string())
        }
    }

    /// Get generic clipboard data (simulated for now as we only support text via copypasta)
    /// In future, we might use wayland-clipboard or X11 atoms for images
    pub fn get_clipboard(&self) -> Option<ClipboardData> {
        self.get_text().map(|text| ClipboardData {
                mime_type: "text/plain".to_string(),
                data: text.into_bytes(),
            })
    }

    /// Phase 31.2: Set RTS Clipboard for visual persistence
    pub fn set_rts_clipboard(&self, rts_clipboard: ClipboardRTS) {
        let mut guard = self.rts_clipboard.lock().unwrap();
        *guard = Some(Arc::new(rts_clipboard));
        log::info!("✅ RTS Clipboard linked to SharedClipboardManager");
    }

    /// Phase 31.2: Get RTS Clipboard
    pub fn get_rts_clipboard(&self) -> Option<Arc<ClipboardRTS>> {
        let guard = self.rts_clipboard.lock().unwrap();
        guard.clone()
    }
}
