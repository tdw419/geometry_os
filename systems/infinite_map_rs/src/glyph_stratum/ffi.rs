//! FFI layer for GlyphStratum - C-compatible interface for Python bindings
//!
//! This module provides a C-compatible API that can be called from Python
//! via ctypes or other FFI mechanisms.

use std::ffi::{c_char, c_void, CStr, CString};
use std::collections::HashMap;

use super::{Stratum, Opcode, GlyphMetadata, ProvenanceInfo, EnhancedGlyphInfo};

/// Opaque handle to a GlyphRegistry
pub struct GlyphRegistryHandle {
    glyphs: HashMap<u32, EnhancedGlyphInfo>,
    next_index: u32,
}

/// C-compatible glyph info structure
#[repr(C)]
pub struct CGlyphInfo {
    pub index: u32,
    pub stratum: u8,
    pub opcode: u8,
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

/// Create a new glyph registry
#[no_mangle]
pub extern "C" fn glyph_stratum_create_registry() -> *mut c_void {
    let registry = Box::new(GlyphRegistryHandle {
        glyphs: HashMap::new(),
        next_index: 0,
    });
    Box::into_raw(registry) as *mut c_void
}

/// Destroy a glyph registry
#[no_mangle]
pub extern "C" fn glyph_stratum_destroy_registry(registry: *mut c_void) {
    if !registry.is_null() {
        unsafe {
            let _ = Box::from_raw(registry as *mut GlyphRegistryHandle);
        }
    }
}

/// Add a glyph to the registry
///
/// Returns the index of the new glyph
#[no_mangle]
pub extern "C" fn glyph_stratum_add_glyph(
    registry: *mut c_void,
    stratum: u8,
    opcode: u8,
    rationale: *const c_char,
) -> u32 {
    if registry.is_null() {
        return u32::MAX;
    }

    let registry = unsafe { &mut *(registry as *mut GlyphRegistryHandle) };
    let index = registry.next_index;
    registry.next_index += 1;

    let rationale_str = if rationale.is_null() {
        String::new()
    } else {
        unsafe { CStr::from_ptr(rationale) }
            .to_string_lossy()
            .into_owned()
    };

    let stratum = Stratum::from_value(stratum).unwrap_or(Stratum::Substrate);
    let opcode = Opcode::from_value(opcode).unwrap_or(Opcode::Nop);

    // Create basic glyph info
    let base = super::super::font_atlas::GlyphInfo {
        unicode: index,
        x: 0,
        y: 0,
        width: 32,
        height: 32,
        advance: 0.0,
        bearing_x: 0.0,
        bearing_y: 0.0,
        opcode: opcode as u8,
        stratum: stratum as u8,
        dependencies: Vec::new(),
        invariants: String::new(),
        provenance: String::new(),
        rationale: rationale_str.clone(),
    };

    let glyph = EnhancedGlyphInfo {
        base,
        stratum,
        opcode,
        metadata: GlyphMetadata {
            dependencies: Vec::new(),
            invariants: serde_json::json!({}),
            provenance: ProvenanceInfo {
                session_id: "ffi".to_string(),
                timestamp: chrono::Utc::now().to_rfc3339(),
                creator: "ffi".to_string(),
                version: 1,
            },
            rationale: rationale_str,
        },
    };

    registry.glyphs.insert(index, glyph);
    index
}

/// Get glyph info by index
///
/// Returns 1 on success, 0 if not found
#[no_mangle]
pub extern "C" fn glyph_stratum_get_glyph(
    registry: *const c_void,
    index: u32,
    out_glyph: *mut CGlyphInfo,
) -> u8 {
    if registry.is_null() || out_glyph.is_null() {
        return 0;
    }

    let registry = unsafe { &*(registry as *const GlyphRegistryHandle) };

    if let Some(glyph) = registry.glyphs.get(&index) {
        unsafe {
            (*out_glyph).index = index;
            (*out_glyph).stratum = glyph.stratum as u8;
            (*out_glyph).opcode = glyph.opcode as u8;
            (*out_glyph).x = glyph.base.x;
            (*out_glyph).y = glyph.base.y;
            (*out_glyph).width = glyph.base.width;
            (*out_glyph).height = glyph.base.height;
        }
        return 1;
    }
    0
}

/// Query glyphs that depend on a given glyph
///
/// Returns the number of dependents found
#[no_mangle]
pub extern "C" fn glyph_stratum_query_dependents(
    registry: *const c_void,
    index: u32,
    out_indices: *mut u32,
    max_count: u32,
) -> u32 {
    if registry.is_null() || out_indices.is_null() {
        return 0;
    }

    let registry = unsafe { &*(registry as *const GlyphRegistryHandle) };

    let dependents: Vec<u32> = registry
        .glyphs
        .iter()
        .filter(|(_, glyph)| glyph.metadata.dependencies.contains(&index))
        .map(|(idx, _)| *idx)
        .take(max_count as usize)
        .collect();

    let count = dependents.len() as u32;
    unsafe {
        for (i, dep) in dependents.iter().enumerate() {
            *out_indices.add(i) = *dep;
        }
    }

    count
}

/// Add a dependency to a glyph
///
/// Returns 1 on success, 0 on failure
#[no_mangle]
pub extern "C" fn glyph_stratum_add_dependency(
    registry: *mut c_void,
    glyph_index: u32,
    depends_on: u32,
) -> u8 {
    if registry.is_null() {
        return 0;
    }

    let registry = unsafe { &mut *(registry as *mut GlyphRegistryHandle) };

    if let Some(glyph) = registry.glyphs.get_mut(&glyph_index) {
        if !glyph.metadata.dependencies.contains(&depends_on) {
            glyph.metadata.dependencies.push(depends_on);
        }
        return 1;
    }
    0
}

/// Get the number of glyphs in the registry
#[no_mangle]
pub extern "C" fn glyph_stratum_count(registry: *const c_void) -> u32 {
    if registry.is_null() {
        return 0;
    }

    let registry = unsafe { &*(registry as *const GlyphRegistryHandle) };
    registry.glyphs.len() as u32
}

/// Export registry to JSON
///
/// Returns a newly allocated string (caller must free with glyph_stratum_free_string)
#[no_mangle]
pub extern "C" fn glyph_stratum_to_json(registry: *const c_void) -> *mut c_char {
    if registry.is_null() {
        return std::ptr::null_mut();
    }

    let registry = unsafe { &*(registry as *const GlyphRegistryHandle) };

    let data: HashMap<String, serde_json::Value> = registry
        .glyphs
        .iter()
        .map(|(idx, glyph)| {
            (
                idx.to_string(),
                serde_json::json!({
                    "index": idx,
                    "stratum": glyph.stratum as u8,
                    "stratum_name": format!("{:?}", glyph.stratum),
                    "opcode": glyph.opcode as u8,
                    "opcode_name": format!("{:?}", glyph.opcode),
                    "rationale": glyph.metadata.rationale,
                    "dependencies": glyph.metadata.dependencies,
                }),
            )
        })
        .collect();

    let json = serde_json::to_string(&data).unwrap_or_default();
    CString::new(json).unwrap().into_raw()
}

/// Free a string allocated by the library
#[no_mangle]
pub extern "C" fn glyph_stratum_free_string(s: *mut c_char) {
    if !s.is_null() {
        unsafe {
            let _ = CString::from_raw(s);
        }
    }
}
