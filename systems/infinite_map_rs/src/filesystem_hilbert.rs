//! Phase 45 / Horizon 1.2: Filesystem as Hilbert Texture
//!
//! This module maps a Linux directory tree to a 2D Hilbert texture,
//! allowing spatial navigation of the filesystem.
//! 
//! Locality-preserving property of Hilbert curve ensures that files
//! in the same directory stay close to each other in 2D space.

use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::time::SystemTime;

/// Represents a node in the filesystem tree
#[derive(Debug, Clone)]
pub struct FileNode {
    pub path: PathBuf,
    pub is_dir: bool,
    pub size: u64,
    pub modified: SystemTime,
    pub extension: String,
    /// Hilbert index (1D)
    pub hilbert_index: u64,
}

impl FileNode {
    /// Get semantic color based on file type
    pub fn semantic_color(&self) -> [f32; 4] {
        if self.is_dir {
            // Directories are Green
            return [0.2, 0.8, 0.3, 1.0];
        }

        let ext = self.extension.to_lowercase();
        match ext.as_str() {
            "rs" | "c" | "cpp" | "h" | "wgsl" | "py" | "js" | "ts" => {
                // Code is Cyan
                [0.0, 0.7, 1.0, 1.0]
            }
            "rts" | "png" | "jpg" | "bmp" | "bin" => {
                // Substrate/Data is Purple
                [0.7, 0.3, 1.0, 1.0]
            }
            "txt" | "md" | "json" | "yaml" | "toml" => {
                // Documents are White/Gray
                [0.9, 0.9, 0.9, 1.0]
            }
            "sh" | "exe" | "so" | "a" | "o" => {
                // Executables are Red/Orange
                [1.0, 0.4, 0.0, 1.0]
            }
            _ => {
                // Unknown is Blue-Ish Gray
                [0.4, 0.5, 0.6, 1.0]
            }
        }
    }
}

/// Manages the mapping between filesystem and Hilbert space
pub struct FilesystemHilbertManager {
    root_path: PathBuf,
    nodes: Vec<FileNode>,
    path_to_index: HashMap<PathBuf, usize>,
    /// Order of the Hilbert curve (N where size = 2^N x 2^N)
    order: u32,
    grid_size: u32,
}

impl FilesystemHilbertManager {
    /// Create a new manager for a root directory
    pub fn new(root: PathBuf) -> Self {
        Self {
            root_path: root,
            nodes: Vec::new(),
            path_to_index: HashMap::new(),
            order: 8, // 256x256 grid by default
            grid_size: 256,
        }
    }

    /// Recursively scan the filesystem and build the Hilbert mapping
    pub fn scan(&mut self) -> std::io::Result<()> {
        let mut new_nodes = Vec::new();
        self.scan_recursive(&self.root_path, &mut new_nodes)?;

        // Sort nodes by path to ensure stable and local Hilbert mapping
        new_nodes.sort_by(|a, b| a.path.cmp(&b.path));

        // Assign Hilbert indices
        for (i, node) in new_nodes.iter_mut().enumerate() {
            node.hilbert_index = i as u64;
        }

        self.nodes = new_nodes;
        self.path_to_index = self.nodes.iter().enumerate()
            .map(|(i, n)| (n.path.clone(), i))
            .collect();

        // Update grid size based on node count
        let count = self.nodes.len() as f64;
        let side = count.sqrt().ceil() as u32;
        self.order = (side as f32).log2().ceil() as u32;
        self.grid_size = 2u32.pow(self.order);

        log::info!("🗄️  Filesystem Hilbert: Scanned {} nodes. Grid size: {}x{}", 
            self.nodes.len(), self.grid_size, self.grid_size);

        Ok(())
    }

    /// Generate an RGBA8 texture representing the filesystem
    pub fn generate_texture(&self) -> (u32, u32, Vec<u8>) {
        let size = self.grid_size;
        let mut buffer = vec![0u8; (size * size * 4) as usize];

        for node in &self.nodes {
            let (x, y) = self.d2xy(node.hilbert_index);
            let idx = ((y * size + x) * 4) as usize;
            
            let color = node.semantic_color();
            buffer[idx] = (color[0] * 255.0) as u8;
            buffer[idx + 1] = (color[1] * 255.0) as u8;
            buffer[idx + 2] = (color[2] * 255.0) as u8;
            buffer[idx + 3] = 255; // Alpha
        }

        (size, size, buffer)
    }

    fn scan_recursive(&self, path: &Path, nodes: &mut Vec<FileNode>) -> std::io::Result<()> {
        if path.is_dir() {
            // Add directory itself
            nodes.push(self.create_node(path)?);

            // Read entries
            for entry in fs::read_dir(path)? {
                let entry = entry?;
                let entry_path = entry.path();
                
                // Skip hidden files or heavy directories like .git
                if let Some(name) = entry_path.file_name() {
                    let name_str = name.to_string_lossy();
                    if name_str.starts_with('.') || name_str == "target" || name_str == "node_modules" {
                        continue;
                    }
                }

                if entry_path.is_dir() {
                    self.scan_recursive(&entry_path, nodes)?;
                } else {
                    nodes.push(self.create_node(&entry_path)?);
                }
            }
        }
        Ok(())
    }

    fn create_node(&self, path: &Path) -> std::io::Result<FileNode> {
        let metadata = fs::metadata(path)?;
        let extension = path.extension()
            .and_then(|e| e.to_str())
            .unwrap_or("")
            .to_string();

        Ok(FileNode {
            path: path.to_path_buf(),
            is_dir: metadata.is_dir(),
            size: metadata.len(),
            modified: metadata.modified().unwrap_or(SystemTime::now()),
            extension,
            hilbert_index: 0,
        })
    }

    /// Convert Hilbert index to (x, y) coordinates
    pub fn d2xy(&self, d: u64) -> (u32, u32) {
        let n = self.grid_size;
        let mut x = 0;
        let mut y = 0;
        let mut t = d;
        let mut s = 1;
        while s < n {
            let rx = 1 & (t / 2);
            let ry = 1 & (t ^ rx);
            self.rot(s, &mut x, &mut y, rx, ry);
            x += s * rx as u32;
            y += s * ry as u32;
            t /= 4;
            s *= 2;
        }
        (x, y)
    }

    fn rot(&self, n: u32, x: &mut u32, y: &mut u32, rx: u64, ry: u64) {
        if ry == 0 {
            if rx == 1 {
                *x = n - 1 - *x;
                *y = n - 1 - *y;
            }
            std::mem::swap(x, y);
        }
    }

    /// Get world position for a file path
    pub fn get_position(&self, path: &Path) -> Option<(f32, f32)> {
        let index = self.path_to_index.get(path)?;
        let (hx, hy) = self.d2xy(*index as u64);
        
        // Scale and offset from center
        Some((
            (hx as f32 - self.grid_size as f32 / 2.0) * 128.0,
            (hy as f32 - self.grid_size as f32 / 2.0) * 128.0
        ))
    }

    /// Find node at world position
    pub fn find_node_at(&self, world_x: f32, world_y: f32) -> Option<&FileNode> {
        let hx = (world_x / 128.0 + self.grid_size as f32 / 2.0).round() as u32;
        let hy = (world_y / 128.0 + self.grid_size as f32 / 2.0).round() as u32;
        
        if hx >= self.grid_size || hy >= self.grid_size {
            return None;
        }

        // Search for node that maps to these coords (TODO: inverse Hilbert mapping for O(1))
        for node in &self.nodes {
            let (nx, ny) = self.d2xy(node.hilbert_index);
            if nx == hx && ny == hy {
                return Some(node);
            }
        }
        None
    }

    pub fn nodes(&self) -> &[FileNode] {
        &self.nodes
    }
}
