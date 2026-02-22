//! Phase 40: Source Crystallization - Mode B Self-Hosting Transition
//! "The Map Becomes the Territory. The Code Becomes the World."
//!
//! This module transforms external Rust source files into Crystallized Text tiles
//! living on the Infinite Map. It's the entry point for the self-hosting transition.
//!
//! # Architecture
//! - Import `.rs` files as visual text tiles with spatial positioning
//! - Parse `Cargo.toml` into visual manifest tiles
//! - Maintain bidirectional sync between filesystem and map
//! - Track modifications for hot-reload capabilities

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::time::{SystemTime, UNIX_EPOCH};
use std::io;

/// Metadata for a source tile, enabling bidirectional sync
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SourceTileMetadata {
    /// Original source file path on filesystem
    pub source_file: PathBuf,
    /// Module path (e.g., "crate::renderer::shader")
    pub module_path: String,
    /// Last time this tile was synced with filesystem
    pub last_sync: SystemTime,
    /// Whether tile has unsaved modifications
    pub dirty: bool,
    /// Content hash for change detection (blake3)
    pub content_hash: String,
    /// Number of lines in source
    pub line_count: usize,
    /// File size in bytes
    pub file_size: u64,
    /// Language (rust, wgsl, etc.)
    pub language: String,
    /// District/module this tile belongs to
    pub district: String,
}

impl SourceTileMetadata {
    /// Create new metadata from a source file
    pub fn from_file(path: &Path, content: &str, district: &str) -> Result<Self, io::Error> {
        let metadata = fs::metadata(path)?;
        let file_size = metadata.len();
        let line_count = content.lines().count();
        
        // Compute content hash
        let content_hash = blake3::hash(content.as_bytes()).to_hex().to_string();
        
        // Determine module path from file path
        let module_path = derive_module_path(path);
        
        // Determine language from extension
        let language = path.extension()
            .and_then(|e| e.to_str())
            .map(|e| match e {
                "rs" => "rust",
                "wgsl" => "wgsl",
                "toml" => "toml",
                "md" => "markdown",
                _ => "text",
            })
            .unwrap_or("text")
            .to_string();
        
        Ok(Self {
            source_file: path.to_path_buf(),
            module_path,
            last_sync: SystemTime::now(),
            dirty: false,
            content_hash,
            line_count,
            file_size,
            language,
            district: district.to_string(),
        })
    }
    
    /// Check if content has changed by comparing hash
    pub fn has_changed(&self, content: &str) -> bool {
        let new_hash = blake3::hash(content.as_bytes()).to_hex().to_string();
        new_hash != self.content_hash
    }
    
    /// Update hash and sync time after save
    pub fn mark_synced(&mut self, content: &str) {
        self.content_hash = blake3::hash(content.as_bytes()).to_hex().to_string();
        self.last_sync = SystemTime::now();
        self.dirty = false;
    }
}

/// Derive a Rust module path from a file path
fn derive_module_path(path: &Path) -> String {
    // Remove src/ prefix and .rs extension
    let components: Vec<_> = path.components()
        .skip_while(|c| {
            matches!(c, std::path::Component::Normal(s) if s.as_encoded_bytes() == b"src")
        })
        .collect();
    
    let mut module_parts: Vec<String> = components
        .iter()
        .filter_map(|c| {
            if let std::path::Component::Normal(s) = c {
                s.to_str().map(|s| s.to_string())
            } else {
                None
            }
        })
        .collect();
    
    // Remove .rs extension from last component
    if let Some(last) = module_parts.last_mut() {
        if last.ends_with(".rs") {
            *last = last.trim_end_matches(".rs").to_string();
        }
        // Handle mod.rs specially
        if last == "mod" {
            module_parts.pop();
        }
    }
    
    if module_parts.is_empty() {
        "crate".to_string()
    } else {
        format!("crate::{}", module_parts.join("::"))
    }
}

/// A crystallized source tile containing actual code content
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CrystallizedSourceTile {
    /// Unique tile identifier
    pub id: String,
    /// Spatial position on the map
    pub x: f32,
    pub y: f32,
    /// Visual dimensions
    pub width: f32,
    pub height: f32,
    /// Source code content
    pub content: String,
    /// Tile metadata for sync
    pub metadata: SourceTileMetadata,
    /// Visual style (based on content type)
    pub style: TileStyle,
}

/// Visual styling for different tile types
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TileStyle {
    pub background_color: (f32, f32, f32, f32), // RGBA
    pub border_color: (f32, f32, f32, f32),
    pub text_color: (f32, f32, f32),
    pub border_width: f32,
    pub glow_intensity: f32,
}

impl TileStyle {
    /// Style for Rust source files
    pub fn rust_style() -> Self {
        Self {
            background_color: (0.12, 0.15, 0.20, 0.95), // Dark blue-gray
            border_color: (0.86, 0.50, 0.28, 1.0),      // Rust orange
            text_color: (0.90, 0.90, 0.90),             // Light gray
            border_width: 2.0,
            glow_intensity: 0.3,
        }
    }
    
    /// Style for WGSL shader files
    pub fn wgsl_style() -> Self {
        Self {
            background_color: (0.15, 0.20, 0.12, 0.95), // Dark green-gray
            border_color: (0.40, 0.80, 0.40, 1.0),      // Shader green
            text_color: (0.90, 0.95, 0.90),
            border_width: 2.0,
            glow_intensity: 0.3,
        }
    }
    
    /// Style for Cargo.toml manifest
    pub fn manifest_style() -> Self {
        Self {
            background_color: (0.20, 0.12, 0.15, 0.95), // Dark red-gray
            border_color: (1.0, 0.41, 0.38, 1.0),       // Cargo red
            text_color: (0.95, 0.90, 0.90),
            border_width: 3.0,
            glow_intensity: 0.5,
        }
    }
    
    /// Style for markdown documentation
    pub fn docs_style() -> Self {
        Self {
            background_color: (0.18, 0.18, 0.18, 0.95),
            border_color: (0.60, 0.60, 0.90, 1.0), // Documentation blue
            text_color: (0.90, 0.90, 0.95),
            border_width: 1.5,
            glow_intensity: 0.2,
        }
    }
    
    /// Style for modified/dirty tiles
    pub fn dirty_style(base: &Self) -> Self {
        Self {
            background_color: (base.background_color.0 + 0.05, 
                              base.background_color.1 + 0.05, 
                              base.background_color.2, 
                              base.background_color.3),
            border_color: (1.0, 0.8, 0.2, 1.0), // Gold border for modified
            text_color: base.text_color,
            border_width: base.border_width + 1.0,
            glow_intensity: 0.6,
        }
    }
}

/// Parsed Cargo.toml manifest
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CrateManifest {
    pub name: String,
    pub version: String,
    pub description: Option<String>,
    pub authors: Vec<String>,
    pub dependencies: Vec<Dependency>,
    pub features: HashMap<String, Vec<String>>,
    pub targets: Vec<TargetInfo>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Dependency {
    pub name: String,
    pub version: String,
    pub optional: bool,
    pub features: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TargetInfo {
    pub name: String,
    pub path: String,
    pub crate_type: String,
}

/// Grid layout for spatial positioning of tiles
#[derive(Debug, Clone)]
pub struct GridLayout {
    origin: (i32, i32),
    width: i32,
    current: i32,
    spacing: i32,
    tile_size: (f32, f32),
}

impl GridLayout {
    /// Create a new grid layout
    /// 
    /// # Arguments
    /// * `origin` - Starting position (x, y) in grid units
    /// * `width` - Number of tiles per row
    /// * `spacing` - Distance between tile centers
    /// * `tile_size` - Visual size of each tile (width, height)
    pub fn new(origin: (i32, i32), width: i32, spacing: i32, tile_size: (f32, f32)) -> Self {
        Self {
            origin,
            width,
            current: 0,
            spacing,
            tile_size,
        }
    }
    
    /// Get the next position in the grid
    pub fn next_position(&mut self) -> (f32, f32) {
        let col = self.current % self.width;
        let row = self.current / self.width;
        
        let x = (self.origin.0 + col * self.spacing) as f32;
        let y = (self.origin.1 + row * self.spacing) as f32;
        
        self.current += 1;
        (x, y)
    }
    
    /// Reset to start from beginning
    pub fn reset(&mut self) {
        self.current = 0;
    }
    
    /// Get current tile index
    pub fn current_index(&self) -> i32 {
        self.current
    }
}

/// District layout for organizing source tiles by module
#[derive(Debug, Clone)]
pub struct DistrictLayout {
    /// District name (e.g., "src/renderer", "src/cognitive")
    pub name: String,
    /// Grid layout for this district
    pub grid: GridLayout,
    /// Tile IDs in this district
    pub tiles: Vec<String>,
    /// Color theme for this district
    pub theme_color: (f32, f32, f32),
}

impl DistrictLayout {
    pub fn new(name: &str, origin: (i32, i32), theme_color: (f32, f32, f32)) -> Self {
        Self {
            name: name.to_string(),
            grid: GridLayout::new(origin, 5, 1000, (800.0, 600.0)),
            tiles: Vec::new(),
            theme_color,
        }
    }
}

/// Errors that can occur during source import
#[derive(Debug)]
pub enum ImportError {
    Io(io::Error),
    Parse(String),
    InvalidPath(String),
    DuplicateTile(String),
}

impl std::fmt::Display for ImportError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ImportError::Io(e) => write!(f, "IO error: {}", e),
            ImportError::Parse(s) => write!(f, "Parse error: {}", s),
            ImportError::InvalidPath(s) => write!(f, "Invalid path: {}", s),
            ImportError::DuplicateTile(s) => write!(f, "Duplicate tile: {}", s),
        }
    }
}

impl std::error::Error for ImportError {}

impl From<io::Error> for ImportError {
    fn from(e: io::Error) -> Self {
        ImportError::Io(e)
    }
}

/// Complete crystallized project
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CrystallizedProject {
    pub manifest: CrateManifest,
    pub tiles: Vec<CrystallizedSourceTile>,
    pub districts: HashMap<String, DistrictInfo>,
    pub imported_at: SystemTime,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DistrictInfo {
    pub name: String,
    pub tile_count: usize,
    pub total_lines: usize,
    pub bounds: ((f32, f32), (f32, f32)), // min, max coordinates
}

/// Source Importer - Main entry point for Phase 40
pub struct SourceImporter {
    /// Root path of the project being imported
    project_root: PathBuf,
    /// District layouts by directory
    districts: HashMap<String, DistrictLayout>,
    /// All imported tiles
    tiles: Vec<CrystallizedSourceTile>,
    /// Next available district position
    next_district_origin: (i32, i32),
}

impl SourceImporter {
    /// Create a new source importer for a project
    pub fn new(project_root: PathBuf) -> Self {
        Self {
            project_root,
            districts: HashMap::new(),
            tiles: Vec::new(),
            next_district_origin: (0, 0),
        }
    }
    
    /// Import an entire crate/project
    /// 
    /// # Arguments
    /// * `origin` - Starting position on the map
    /// 
    /// # Returns
    /// Complete crystallized project with all tiles
    pub fn import_crate(&mut self, origin: (i32, i32)) -> Result<CrystallizedProject, ImportError> {
        self.next_district_origin = origin;
        
        // 1. Parse Cargo.toml
        let manifest = self.parse_cargo_toml()?;
        log::info!("📦 Importing crate: {} v{}", manifest.name, manifest.version);
        
        // 2. Collect all source files
        let source_files = self.collect_source_files()?;
        log::info!("   Found {} source files", source_files.len());
        
        // 3. Create manifest tile
        let manifest_tile = self.create_manifest_tile(&manifest, origin)?;
        self.tiles.push(manifest_tile);
        
        // 4. Create source tiles organized by district
        for file_path in source_files {
            match self.crystallize_file(&file_path) {
                Ok(tile) => {
                    log::debug!("   ✓ Crystallized: {}", tile.metadata.source_file.display());
                    self.tiles.push(tile);
                }
                Err(e) => {
                    log::warn!("   ✗ Failed to crystallize {}: {}", file_path.display(), e);
                }
            }
        }
        
        // 5. Compute district info
        let districts = self.compute_district_info();
        
        let project = CrystallizedProject {
            manifest,
            tiles: self.tiles.clone(),
            districts,
            imported_at: SystemTime::now(),
        };
        
        log::info!("✅ Source crystallization complete: {} tiles", self.tiles.len());
        
        Ok(project)
    }
    
    /// Parse Cargo.toml into manifest structure
    fn parse_cargo_toml(&self) -> Result<CrateManifest, ImportError> {
        let cargo_path = self.project_root.join("Cargo.toml");
        let content = fs::read_to_string(&cargo_path)
            .map_err(|e| ImportError::Io(e))?;
        
        let parsed: toml::Value = content.parse()
            .map_err(|e| ImportError::Parse(format!("Failed to parse Cargo.toml: {}", e)))?;
        
        let package = parsed.get("package")
            .ok_or_else(|| ImportError::Parse("Missing [package] section".to_string()))?;
        
        let name = package.get("name")
            .and_then(|v| v.as_str())
            .ok_or_else(|| ImportError::Parse("Missing package.name".to_string()))?
            .to_string();
        
        let version = package.get("version")
            .and_then(|v| v.as_str())
            .unwrap_or("0.0.0")
            .to_string();
        
        let description = package.get("description")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());
        
        let authors: Vec<String> = package.get("authors")
            .and_then(|v| v.as_array())
            .map(|arr| arr.iter()
                .filter_map(|v| v.as_str().map(|s| s.to_string()))
                .collect())
            .unwrap_or_default();
        
        // Parse dependencies
        let mut dependencies = Vec::new();
        if let Some(deps) = parsed.get("dependencies").and_then(|v| v.as_table()) {
            for (name, value) in deps {
                let (version, optional, features): (String, bool, Vec<String>) = match value {
                    toml::Value::String(v) => (v.clone(), false, Vec::new()),
                    toml::Value::Table(t) => {
                        let ver = t.get("version")
                            .and_then(|v| v.as_str())
                            .map(|s| s.to_string())
                            .or_else(|| t.get("git").map(|_| "git".to_string()))
                            .unwrap_or_else(|| "*".to_string());
                        let opt = t.get("optional")
                            .and_then(|v| v.as_bool())
                            .unwrap_or(false);
                        let feats: Vec<String> = t.get("features")
                            .and_then(|v| v.as_array())
                            .map(|arr| arr.iter()
                                .filter_map(|v| v.as_str().map(|s| s.to_string()))
                                .collect())
                            .unwrap_or_default();
                        (ver, opt, feats)
                    }
                    _ => ("*".to_string(), false, Vec::new()),
                };
                
                dependencies.push(Dependency {
                    name: name.clone(),
                    version,
                    optional,
                    features,
                });
            }
        }
        
        // Parse features
        let features: HashMap<String, Vec<String>> = parsed.get("features")
            .and_then(|v| v.as_table())
            .map(|t| {
                t.iter()
                    .filter_map(|(k, v)| {
                        v.as_array().map(|arr| {
                            let feats: Vec<String> = arr.iter()
                                .filter_map(|v| v.as_str().map(|s| s.to_string()))
                                .collect();
                            (k.clone(), feats)
                        })
                    })
                    .collect()
            })
            .unwrap_or_default();
        
        // Parse targets (lib, bins)
        let mut targets = Vec::new();
        
        if let Some(lib) = parsed.get("lib").and_then(|v| v.as_table()) {
            if let Some(path) = lib.get("path").and_then(|v| v.as_str()) {
                targets.push(TargetInfo {
                    name: name.clone(),
                    path: path.to_string(),
                    crate_type: "lib".to_string(),
                });
            }
        }
        
        if let Some(bins) = parsed.get("bin").and_then(|v| v.as_array()) {
            for bin in bins {
                if let Some(t) = bin.as_table() {
                    if let (Some(name), Some(path)) = (
                        t.get("name").and_then(|v| v.as_str()),
                        t.get("path").and_then(|v| v.as_str())
                    ) {
                        targets.push(TargetInfo {
                            name: name.to_string(),
                            path: path.to_string(),
                            crate_type: "bin".to_string(),
                        });
                    }
                }
            }
        }
        
        Ok(CrateManifest {
            name,
            version,
            description,
            authors,
            dependencies,
            features,
            targets,
        })
    }
    
    /// Collect all source files in the project
    fn collect_source_files(&self) -> Result<Vec<PathBuf>, ImportError> {
        let mut files = Vec::new();
        let src_path = self.project_root.join("src");
        
        if !src_path.exists() {
            return Err(ImportError::InvalidPath(
                format!("src/ directory not found: {:?}", src_path)
            ));
        }
        
        self.walk_source_dir(&src_path, &mut files)?;
        
        // Sort for consistent ordering
        files.sort();
        
        Ok(files)
    }
    
    /// Recursively walk source directory
    fn walk_source_dir(&self, dir: &Path, files: &mut Vec<PathBuf>) -> Result<(), ImportError> {
        for entry in fs::read_dir(dir)? {
            let entry = entry?;
            let path = entry.path();
            
            if path.is_dir() {
                self.walk_source_dir(&path, files)?;
            } else if path.extension()
                .and_then(|e| e.to_str())
                .map(|e| e == "rs" || e == "wgsl")
                .unwrap_or(false) 
            {
                files.push(path);
            }
        }
        
        Ok(())
    }
    
    /// Create a visual tile for Cargo.toml manifest
    fn create_manifest_tile(&self, manifest: &CrateManifest, origin: (i32, i32)) 
        -> Result<CrystallizedSourceTile, ImportError> 
    {
        let id = format!("manifest_{}", manifest.name);
        let x = origin.0 as f32;
        let y = origin.1 as f32;
        
        // Format manifest as visual text
        let content = self.format_manifest_text(manifest);
        
        let metadata = SourceTileMetadata {
            source_file: self.project_root.join("Cargo.toml"),
            module_path: "crate::manifest".to_string(),
            last_sync: SystemTime::now(),
            dirty: false,
            content_hash: blake3::hash(content.as_bytes()).to_hex().to_string(),
            line_count: content.lines().count(),
            file_size: content.len() as u64,
            language: "toml".to_string(),
            district: "manifest".to_string(),
        };
        
        Ok(CrystallizedSourceTile {
            id,
            x,
            y,
            width: 900.0,
            height: 700.0,
            content,
            metadata,
            style: TileStyle::manifest_style(),
        })
    }
    
    /// Format manifest as readable text
    fn format_manifest_text(&self, manifest: &CrateManifest) -> String {
        let mut text = format!(
            "📦 {} v{}\n",
            manifest.name, manifest.version
        );
        
        if let Some(ref desc) = manifest.description {
            text.push_str(&format!("   {}\n", desc));
        }
        
        text.push_str("\n🦀 Dependencies:\n");
        for dep in &manifest.dependencies {
            let opt_marker = if dep.optional { " [optional]" } else { "" };
            text.push_str(&format!(
                "   ├── {} {} {}\n",
                dep.name, dep.version, opt_marker
            ));
        }
        
        if !manifest.features.is_empty() {
            text.push_str("\n⚙️  Features:\n");
            for (name, feats) in &manifest.features {
                let feat_str = if feats.is_empty() {
                    "[]".to_string()
                } else {
                    format!("[{}]", feats.join(", "))
                };
                text.push_str(&format!("   ├── {} {}\n", name, feat_str));
            }
        }
        
        if !manifest.targets.is_empty() {
            text.push_str("\n🎯 Targets:\n");
            for target in &manifest.targets {
                text.push_str(&format!(
                    "   ├── [{}] {} → {}\n",
                    target.crate_type, target.name, target.path
                ));
            }
        }
        
        text
    }
    
    /// Convert a single source file to a crystallized tile
    fn crystallize_file(&mut self, path: &Path) -> Result<CrystallizedSourceTile, ImportError> {
        let content = fs::read_to_string(path)?;
        let district = self.district_for_path(path);
        
        // Get or create district layout - separate mutable borrows
        if !self.districts.contains_key(&district) {
            let origin = self.next_district_origin;
            let color = self.district_color(&district);
            self.next_district_origin.1 += 5000; // 5000 units between districts
            self.districts.insert(
                district.clone(),
                DistrictLayout::new(&district, origin, color)
            );
        }
        
        let district_layout = self.districts.get_mut(&district)
            .expect("District was just inserted");
        
        let (x, y) = district_layout.grid.next_position();
        district_layout.tiles.push(path.to_string_lossy().to_string());
        
        let id = format!("source_{}", path.file_stem()
            .and_then(|s| s.to_str())
            .unwrap_or("unknown"));
        
        let metadata = SourceTileMetadata::from_file(path, &content, &district)?;
        
        let style = match metadata.language.as_str() {
            "rust" => TileStyle::rust_style(),
            "wgsl" => TileStyle::wgsl_style(),
            _ => TileStyle::docs_style(),
        };
        
        // Compute tile size based on content
        let lines = content.lines().count();
        let height = (lines as f32 * 20.0).max(400.0).min(1200.0); // 20px per line, clamped
        let width = 800.0;
        
        Ok(CrystallizedSourceTile {
            id,
            x,
            y,
            width,
            height,
            content,
            metadata,
            style,
        })
    }
    
    /// Determine district name from file path
    fn district_for_path(&self, path: &Path) -> String {
        let relative = path.strip_prefix(&self.project_root)
            .unwrap_or(path);
        
        let parent = relative.parent()
            .and_then(|p| p.to_str())
            .unwrap_or("src");
        
        parent.replace("/", "::").replace("\\", "::")
    }
    
    /// Get color theme for a district
    fn district_color(&self, district: &str) -> (f32, f32, f32) {
        // Hash district name to consistent color
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};
        
        let mut hasher = DefaultHasher::new();
        district.hash(&mut hasher);
        let hash = hasher.finish();
        
        let hue = (hash % 360) as f32;
        let saturation = 0.6 + ((hash >> 8) % 40) as f32 / 100.0;
        let lightness = 0.4 + ((hash >> 16) % 30) as f32 / 100.0;
        
        // HSL to RGB conversion
        hsl_to_rgb(hue / 360.0, saturation, lightness)
    }
    
    /// Compute district information from imported tiles
    fn compute_district_info(&self) -> HashMap<String, DistrictInfo> {
        let mut districts: HashMap<String, DistrictInfo> = HashMap::new();
        
        for tile in &self.tiles {
            let district_name = &tile.metadata.district;
            let entry = districts.entry(district_name.clone())
                .or_insert_with(|| DistrictInfo {
                    name: district_name.clone(),
                    tile_count: 0,
                    total_lines: 0,
                    bounds: ((f32::MAX, f32::MAX), (f32::MIN, f32::MIN)),
                });
            
            entry.tile_count += 1;
            entry.total_lines += tile.metadata.line_count;
            
            // Update bounds
            entry.bounds.0.0 = entry.bounds.0.0.min(tile.x);
            entry.bounds.0.1 = entry.bounds.0.1.min(tile.y);
            entry.bounds.1.0 = entry.bounds.1.0.max(tile.x + tile.width);
            entry.bounds.1.1 = entry.bounds.1.1.max(tile.y + tile.height);
        }
        
        districts
    }
    
    /// Get all imported tiles
    pub fn tiles(&self) -> &[CrystallizedSourceTile] {
        &self.tiles
    }
    
    /// Get districts
    pub fn districts(&self) -> &HashMap<String, DistrictLayout> {
        &self.districts
    }
}

/// Bidirectional sync between filesystem and tiles
pub struct SourceSync {
    project_root: PathBuf,
}

impl SourceSync {
    pub fn new(project_root: PathBuf) -> Self {
        Self { project_root }
    }
    
    /// Import changes from filesystem to tiles
    /// 
    /// Returns a report of what changed
    pub fn import_changes(&self, tiles: &mut [CrystallizedSourceTile]) -> Result<SyncReport, ImportError> {
        let mut report = SyncReport::default();
        
        for tile in tiles.iter_mut() {
            let path = &tile.metadata.source_file;
            if !path.exists() {
                report.deleted.push(tile.id.clone());
                continue;
            }
            
            let content = fs::read_to_string(path)?;
            if tile.metadata.has_changed(&content) {
                tile.content = content;
                tile.metadata.mark_synced(&tile.content);
                report.modified.push(tile.id.clone());
            }
        }
        
        Ok(report)
    }
    
    /// Export changes from tiles to filesystem
    /// 
    /// This is the "escape hatch" for getting code out of Geometry OS
    pub fn export_changes(&self, tiles: &[CrystallizedSourceTile]) -> Result<SyncReport, ImportError> {
        let mut report = SyncReport::default();
        
        for tile in tiles.iter().filter(|t| t.metadata.dirty) {
            let path = &tile.metadata.source_file;
            
            // Ensure parent directory exists
            if let Some(parent) = path.parent() {
                fs::create_dir_all(parent)?;
            }
            
            fs::write(path, &tile.content)?;
            report.modified.push(tile.id.clone());
        }
        
        Ok(report)
    }
    
    /// Check if a tile has modifications not yet synced to filesystem
    pub fn has_unsynced_changes(&self, tile: &CrystallizedSourceTile) -> bool {
        tile.metadata.dirty
    }
}

/// Report of sync operations
#[derive(Debug, Default, Clone)]
pub struct SyncReport {
    pub modified: Vec<String>,
    pub deleted: Vec<String>,
    pub errors: Vec<(String, String)>,
}

impl SyncReport {
    pub fn is_empty(&self) -> bool {
        self.modified.is_empty() && self.deleted.is_empty() && self.errors.is_empty()
    }
}

/// Utility: Convert HSL to RGB
fn hsl_to_rgb(h: f32, s: f32, l: f32) -> (f32, f32, f32) {
    let c = (1.0 - (2.0 * l - 1.0).abs()) * s;
    let x = c * (1.0 - ((h * 6.0) % 2.0 - 1.0).abs());
    let m = l - c / 2.0;
    
    let (r, g, b) = match (h * 6.0) as i32 {
        0 => (c, x, 0.0),
        1 => (x, c, 0.0),
        2 => (0.0, c, x),
        3 => (0.0, x, c),
        4 => (x, 0.0, c),
        _ => (c, 0.0, x),
    };
    
    (r + m, g + m, b + m)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use tempfile::TempDir;
    
    #[test]
    fn test_grid_layout() {
        let mut grid = GridLayout::new((0, 0), 3, 1000, (800.0, 600.0));
        
        let p1 = grid.next_position();
        assert_eq!(p1, (0.0, 0.0));
        
        let p2 = grid.next_position();
        assert_eq!(p2, (1000.0, 0.0));
        
        let p3 = grid.next_position();
        assert_eq!(p3, (2000.0, 0.0));
        
        // Wrap to next row
        let p4 = grid.next_position();
        assert_eq!(p4, (0.0, 1000.0));
    }
    
    #[test]
    fn test_source_tile_metadata() {
        let temp_dir = TempDir::new().unwrap();
        let file_path = temp_dir.path().join("test.rs");
        
        let content = "fn main() {\n    println!(\"Hello\");\n}\n";
        fs::write(&file_path, content).unwrap();
        
        let metadata = SourceTileMetadata::from_file(&file_path, content, "test").unwrap();
        
        assert_eq!(metadata.language, "rust");
        assert_eq!(metadata.line_count, 3);
        assert!(!metadata.dirty);
    }
    
    #[test]
    fn test_derive_module_path() {
        let path = Path::new("src/renderer/shader.rs");
        assert_eq!(derive_module_path(path), "crate::renderer::shader");
        
        let path = Path::new("src/main.rs");
        assert_eq!(derive_module_path(path), "crate::main");
        
        let path = Path::new("src/cognitive/agents/mod.rs");
        assert_eq!(derive_module_path(path), "crate::cognitive::agents");
    }
}