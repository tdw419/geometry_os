//! Phase 41: Visual AST - Internal Parser for Code Gardener Ecosystem
//!
//! "The code is a garden. Agents are the gardeners."
//!
//! This module transforms crystallized source tiles into a visual Abstract Syntax Tree
//! that autonomous agents can navigate and manipulate. The Visual AST is the substrate
//! for Scout, Engineer, Builder, and Tester agents.
//!
//! # Architecture
//! - Parse Rust source with syn crate into AST nodes
//! - Annotate each node with spatial coordinates (x, y)
//! - GPU-accelerated syntax highlighting
//! - Health API for agents to detect errors
//! - Token-level precision for refactoring

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use parking_lot::Mutex;

/// Spatial coordinate key for HashMap (integers work as hash keys)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct GridCoord {
    pub x: i32,
    pub y: i32,
}

impl From<(f32, f32)> for GridCoord {
    fn from((x, y): (f32, f32)) -> Self {
        Self {
            x: x as i32,
            y: y as i32,
        }
    }
}

impl From<(i32, i32)> for GridCoord {
    fn from((x, y): (i32, i32)) -> Self {
        Self { x, y }
    }
}

/// Visual AST - Spatially-aware abstract syntax tree
#[derive(Debug, Clone)]
pub struct VisualAST {
    /// AST nodes keyed by their spatial coordinates
    pub nodes: HashMap<GridCoord, VisualNode>,
    /// Root nodes of each tile
    pub roots: HashMap<String, Vec<GridCoord>>,
    /// Syntax health cache
    health_cache: Arc<Mutex<HashMap<GridCoord, SyntaxHealth>>>,
    /// Source tiles that generated this AST
    source_tiles: HashMap<String, Vec<crate::source_importer::CrystallizedSourceTile>>,
}

impl VisualAST {
    /// Create a new empty Visual AST
    pub fn new() -> Self {
        Self {
            nodes: HashMap::new(),
            roots: HashMap::new(),
            health_cache: Arc::new(Mutex::new(HashMap::new())),
            source_tiles: HashMap::new(),
        }
    }

    /// Parse crystallized source tiles into Visual AST
    pub fn from_tiles(
        tiles: Vec<crate::source_importer::CrystallizedSourceTile>
    ) -> Result<Self, ParseError> {
        let mut ast = Self::new();

        // Group tiles by file
        let mut by_file: HashMap<String, Vec<_>> = HashMap::new();
        for tile in tiles {
            by_file
                .entry(tile.metadata.module_path.clone())
                .or_insert_with(Vec::new)
                .push(tile);
        }

        // Parse each file
        for (module_path, tiles) in by_file {
            for tile in tiles {
                match tile.metadata.language.as_str() {
                    "rust" => {
                        if let Err(e) = ast.parse_rust_tile(tile) {
                            log::warn!("Failed to parse {}: {}", module_path, e);
                        }
                    }
                    "wgsl" => {
                        if let Err(e) = ast.parse_wgsl_tile(tile) {
                            log::warn!("Failed to parse WGSL {}: {}", module_path, e);
                        }
                    }
                    _ => {
                        // For non-code files, create a simple text node
                        ast.create_text_node(tile);
                    }
                }
            }
        }

        log::info!("🌳 Visual AST: {} nodes across {} files",
            ast.nodes.len(), ast.roots.len());

        Ok(ast)
    }

    /// Phase 21: Recursively scan directory and create Visual AST
    /// This is the main entry point for crystallizing an entire codebase
    pub fn from_directory(
        project_root: &std::path::Path,
        origin: (f32, f32),
    ) -> Result<Self, ParseError> {
        log::info!("🌳 Phase 21: Crystallizing codebase at {:?}", project_root);

        // Step 1: Use SourceImporter to import all source files
        let mut importer = crate::source_importer::SourceImporter::new(project_root.to_path_buf());
        let origin_i32 = (origin.0 as i32, origin.1 as i32);
        let project = importer.import_crate(origin_i32)
            .map_err(|e| ParseError::IoError(format!("Failed to import crate: {}", e)))?;

        log::info!("📦 Imported {} source tiles", project.tiles.len());

        // Step 2: Parse tiles into Visual AST
        let mut ast = Self::from_tiles(project.tiles)?;

        // Step 3: Apply spatial layout based on directory structure
        ast.apply_directory_layout(project_root, origin)?;

        log::info!("✅ Visual AST created: {} nodes, {} modules",
            ast.nodes.len(), ast.roots.len());

        Ok(ast)
    }

    /// Apply spatial layout based on directory structure
    fn apply_directory_layout(&mut self, project_root: &std::path::Path, origin: (f32, f32)) -> Result<(), ParseError> {
        use std::collections::HashMap;

        // Collect node IDs and metadata first (avoid borrow issues)
        let node_info: Vec<(String, String, String)> = self.nodes.values()
            .map(|node| {
                let district = node.name
                    .split("::")
                    .last()
                    .unwrap_or("")
                    .to_string();
                (node.id.clone(), node.tile_id.clone(), district)
            })
            .collect();

        // Group files by directory for district layout
        let mut districts: HashMap<String, Vec<(String, String, String)>> = HashMap::new();

        for (node_id, tile_id, district) in node_info {
            districts
                .entry(district.clone())
                .or_insert_with(Vec::new)
                .push((node_id, tile_id, district));
        }

        // Position districts spatially
        let district_spacing = 2000.0; // Space between districts
        let mut district_idx = 0;

        for (_district_name, entries) in districts {
            let district_x = origin.0 + (district_idx as f32 * district_spacing);
            let district_y = origin.1;

            // Position nodes within district
            for (idx, (node_id, _tile_id, _district)) in entries.iter().enumerate() {
                let node_x = district_x + ((idx % 5) as f32 * 600.0); // 5 nodes per row
                let node_y = district_y + ((idx / 5) as f32 * 200.0); // 200px vertical spacing

                // Find and update node
                let mut found_node = None;
                for (&coord, node) in &self.nodes {
                    if node.id == *node_id {
                        found_node = Some((coord, node_x, node_y));
                        break;
                    }
                }

                if let Some((old_coord, new_x, new_y)) = found_node {
                    let mut node = self.nodes.remove(&old_coord).unwrap();
                    node.x = new_x;
                    node.y = new_y;

                    let new_coord: GridCoord = (new_x as i32, new_y as i32).into();
                    self.nodes.insert(new_coord, node);
                }
            }

            district_idx += 1;
        }

        Ok(())
    }

    /// Parse a single Rust source tile
    fn parse_rust_tile(
        &mut self,
        tile: crate::source_importer::CrystallizedSourceTile
    ) -> Result<(), ParseError> {
        use syn::{parse_file, Item};
        
        let syntax = parse_file(&tile.content)
            .map_err(|e| ParseError::SynError(tile.id.clone(), e.to_string()))?;

        let module_path = tile.metadata.module_path.clone();
        let mut node_positions = Vec::new();
        
        // Process top-level items
        for item in syntax.items {
            let pos = self.process_item(&item, &tile, 0)?;
            node_positions.push(pos);
        }

        self.roots.insert(module_path.clone(), node_positions);
        self.source_tiles
            .entry(module_path)
            .or_insert_with(Vec::new)
            .push(tile);

        Ok(())
    }

    /// Process a single syn::Item into a VisualNode
    fn process_item(
        &mut self,
        item: &syn::Item,
        tile: &crate::source_importer::CrystallizedSourceTile,
        depth: usize,
    ) -> Result<GridCoord, ParseError> {
        let base_x = tile.x;
        let base_y = tile.y;
        
        // Calculate position within the tile based on depth
        let spacing = 150.0; // Spacing between nested nodes
        let x = base_x + (depth as f32 * spacing);
        let y = base_y + 100.0; // Start 100px below tile origin

        let (node_name, node_type) = match item {
            syn::Item::Fn(func) => {
                let sig = &func.sig;
                let name = format!("fn {}", sig.ident);
                (
                    name,
                    VisualNodeType::Function {
                        name: sig.ident.to_string(),
                        params: sig.inputs.iter().map(|_| "()".to_string()).collect(),
                        return_type: format!("{:?}", sig.output),
                        asyncness: func.sig.asyncness.is_some(),
                        unsafety: func.sig.unsafety.is_some(),
                    }
                )
            }
            syn::Item::Struct(s) => {
                let name = format!("struct {}", s.ident);
                (
                    name,
                    VisualNodeType::Struct {
                        name: s.ident.to_string(),
                        fields: s.fields.iter().map(|f| match &f.ident {
                            Some(ident) => ident.to_string(),
                            None => "_".to_string(),
                        }).collect(),
                        field_types: s.fields.iter().map(|f| {
                            match &f.ty {
                                syn::Type::Path(p) => p.path.segments.last()
                                    .map(|s| s.ident.to_string())
                                    .unwrap_or_else(|| "?".to_string()),
                                _ => "?".to_string(),
                            }
                        }).collect(),
                    }
                )
            }
            syn::Item::Enum(e) => {
                let name = format!("enum {}", e.ident);
                (
                    name,
                    VisualNodeType::Enum {
                        name: e.ident.to_string(),
                        variants: e.variants.iter()
                            .map(|v| v.ident.to_string())
                            .collect(),
                    }
                )
            }
            syn::Item::Mod(m) => {
                let name = format!("mod {}", m.ident);
                (
                    name,
                    VisualNodeType::Module {
                        name: m.ident.to_string(),
                    }
                )
            }
            syn::Item::Impl(i) => {
                let type_name = match &*i.self_ty {
                    syn::Type::Path(p) => p.path.segments.last()
                        .map(|s| s.ident.to_string())
                        .unwrap_or_else(|| "Self".to_string()),
                    _ => "Self".to_string(),
                };
                let name = format!("impl {}", type_name);
                (
                    name,
                    VisualNodeType::Impl {
                        trait_name: i.trait_.as_ref().map(|(_, t, _)| {
                            t.segments.last()
                                .map(|s| s.ident.to_string())
                                .unwrap_or_else(|| "?".to_string())
                        }),
                        type_name,
                    }
                )
            }
            syn::Item::Trait(t) => {
                let name = format!("trait {}", t.ident);
                (
                    name,
                    VisualNodeType::Trait {
                        name: t.ident.to_string(),
                        methods: t.items.iter().filter_map(|item| {
                            if let syn::TraitItem::Fn(m) = item {
                                Some(m.sig.ident.to_string())
                            } else {
                                None
                            }
                        }).collect(),
                    }
                )
            }
            syn::Item::Use(u) => {
                let name = format!("use {}", match &u.tree {
                    syn::UseTree::Path(p) => p.ident.to_string(),
                    syn::UseTree::Name(n) => n.ident.to_string(),
                    syn::UseTree::Glob(_) => "*".to_string(),
                    syn::UseTree::Rename(_) => "as _".to_string(),
                    syn::UseTree::Group(_) => "{...}".to_string(),
                });
                (
                    name,
                    VisualNodeType::UseStatement
                )
            }
            syn::Item::Type(t) => {
                let name = format!("type {}", t.ident);
                (
                    name,
                    VisualNodeType::TypeAlias {
                        name: t.ident.to_string(),
                        target: format!("{:?}", t.ty),
                    }
                )
            }
            syn::Item::Const(c) => {
                let name = format!("const {}", c.ident);
                (
                    name,
                    VisualNodeType::Constant {
                        name: c.ident.to_string(),
                        type_str: format!("{:?}", c.ty),
                    }
                )
            }
            syn::Item::Static(s) => {
                let name = format!("static {}", s.ident);
                let is_mutable = matches!(s.mutability, syn::StaticMutability::Mut(_));
                (
                    name,
                    VisualNodeType::Static {
                        name: s.ident.to_string(),
                        type_str: format!("{:?}", s.ty),
                        mutability: is_mutable,
                    }
                )
            }
            _ => (
                format!("{:?}", item),
                VisualNodeType::Unknown
            )
        };

        // Simplified span for now
        let span = (0, 1);

        let node = VisualNode {
            id: format!("node_{}_{}", tile.id, self.nodes.len()),
            name: node_name,
            x,
            y,
            width: 300.0,
            height: 50.0,
            tile_id: tile.id.clone(),
            tile_x: tile.x,
            tile_y: tile.y,
            depth,
            children: Vec::new(),
            span,
            health: SyntaxHealth::default(),
            style: NodeStyle::for_node_type(&node_type),
            tokens: Vec::new(),
            node_type,
        };

        let grid_coord: GridCoord = (x, y).into();
        self.nodes.insert(grid_coord, node);

        Ok(grid_coord)
    }

    /// Parse WGSL shader tile (simplified - WGSL doesn't have syn support yet)
    fn parse_wgsl_tile(
        &mut self,
        tile: crate::source_importer::CrystallizedSourceTile
    ) -> Result<(), ParseError> {
        // Simple heuristic parsing for WGSL
        let module_path = tile.metadata.module_path.clone();
        let base_x = tile.x;
        let base_y = tile.y;
        let mut node_positions = Vec::new();

        // Extract functions with regex-like pattern matching
        for (line_idx, line) in tile.content.lines().enumerate() {
            if line.trim_start().starts_with("fn ") {
                let y = base_y + 100.0 + (line_idx as f32 * 30.0);
                let pos = (base_x, y);
                let grid_coord: GridCoord = pos.into();
                
                let node = VisualNode {
                    id: format!("wgsl_fn_{}_{}", tile.id, line_idx),
                    name: line.trim().to_string(),
                    node_type: VisualNodeType::WgslFunction,
                    x: pos.0,
                    y: pos.1,
                    width: 400.0,
                    height: 30.0,
                    tile_id: tile.id.clone(),
                    tile_x: tile.x,
                    tile_y: tile.y,
                    depth: 0,
                    children: Vec::new(),
                    span: (line_idx, line_idx + 1),
                    health: SyntaxHealth::default(),
                    style: NodeStyle::wgsl_function(),
                    tokens: Vec::new(),
                };
                
                self.nodes.insert(grid_coord, node);
                node_positions.push(grid_coord);
            }
        }

        self.roots.insert(module_path.clone(), node_positions);
        self.source_tiles
            .entry(module_path)
            .or_insert_with(Vec::new)
            .push(tile);

        Ok(())
    }

    /// Create a simple text node for non-code files
    fn create_text_node(
        &mut self,
        tile: crate::source_importer::CrystallizedSourceTile
    ) {
        let pos = (tile.x, tile.y + 100.0);
        let grid_coord: GridCoord = pos.into();
        
        let node = VisualNode {
            id: format!("text_{}", tile.id),
            name: tile.metadata.module_path.clone(),
            node_type: VisualNodeType::TextBlock,
            x: pos.0,
            y: pos.1,
            width: 512.0,
            height: 100.0 + (tile.metadata.line_count as f32 * 20.0),
            tile_id: tile.id.clone(),
            tile_x: tile.x,
            tile_y: tile.y,
            depth: 0,
            children: Vec::new(),
            span: (0, tile.metadata.line_count),
            health: SyntaxHealth::default(),
            style: NodeStyle::text_block(),
            tokens: Vec::new(),
        };

        self.nodes.insert(grid_coord, node);
        self.roots
            .entry(tile.metadata.module_path.clone())
            .or_insert_with(Vec::new)
            .push(grid_coord);
        
        self.source_tiles
            .entry(tile.metadata.module_path.clone())
            .or_insert_with(Vec::new)
            .push(tile);
    }

    /// Get syntax health at spatial coordinates (API for Scout agents)
    pub fn get_syntax_health(&self, x: f32, y: f32) -> SyntaxHealth {
        let grid_coord: GridCoord = (x, y).into();
        
        // Check cache first
        {
            let cache = self.health_cache.lock();
            if let Some(health) = cache.get(&grid_coord) {
                return health.clone();
            }
        }

        // Find the closest node
        let search_radius = 100.0; // Search within 100 units
        let mut best_node = None;
        let mut best_dist = search_radius;

        for (&pos, node) in &self.nodes {
            let dist = ((pos.x as f32 - x).abs() + (pos.y as f32 - y).abs()) / 2.0;
            if dist < best_dist {
                best_dist = dist;
                best_node = Some(node);
            }
        }

        let health = if let Some(node) = best_node {
            node.health.clone()
        } else {
            SyntaxHealth::default()
        };

        // Cache result
        self.health_cache.lock().insert(grid_coord, health.clone());
        
        health
    }

    /// Get node at specific coordinates
    pub fn node_at(&self, pos: (f32, f32)) -> Option<&VisualNode> {
        let grid_coord: GridCoord = pos.into();
        self.nodes.get(&grid_coord)
    }

    /// Get all nodes in a tile
    pub fn nodes_in_tile(&self, tile_id: &str) -> Vec<&VisualNode> {
        self.nodes.values()
            .filter(|n| n.tile_id == tile_id)
            .collect()
    }

    /// Get root nodes for a module
    pub fn roots_for_module(&self, module_path: &str) -> Option<Vec<&VisualNode>> {
        self.roots.get(module_path).map(|positions| {
            positions.iter().filter_map(|pos| self.nodes.get(pos)).collect()
        })
    }

    /// Invalidate health cache (call after edits)
    pub fn invalidate_health_cache(&self) {
        self.health_cache.lock().clear();
    }

    /// Update syntax health for a node (for Scout agents)
    pub fn update_node_health(&mut self, pos: (f32, f32), health: SyntaxHealth) {
        let grid_coord: GridCoord = pos.into();
        if let Some(node) = self.nodes.get_mut(&grid_coord) {
            node.health = health.clone();
            self.health_cache.lock().insert(grid_coord, health);
        }
    }

    /// Get all nodes with poor health (for Scout agent patrol)
    /// Returns list of (x, y, health) for nodes with health score < 1.0
    pub fn get_unhealthy_nodes(&self) -> Vec<(f32, f32, SyntaxHealth)> {
        self.nodes
            .iter()
            .filter(|(_, node)| node.health.score < 1.0)
            .map(|(_, node)| (node.x, node.y, node.health.clone()))
            .collect()
    }

    /// Get all tiles
    pub fn tiles(&self) -> Vec<&crate::source_importer::CrystallizedSourceTile> {
        self.source_tiles.values().flatten().collect()
    }
}

/// Visual node in the AST
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VisualNode {
    /// Unique node identifier
    pub id: String,
    /// Display name
    pub name: String,
    /// Type of node
    pub node_type: VisualNodeType,
    /// Spatial coordinates
    pub x: f32,
    pub y: f32,
    pub width: f32,
    pub height: f32,
    /// Which tile this belongs to
    pub tile_id: String,
    /// Tile origin
    pub tile_x: f32,
    pub tile_y: f32,
    /// Nesting depth
    pub depth: usize,
    /// Child node positions
    pub children: Vec<GridCoord>,
    /// Source span (line range)
    pub span: (usize, usize),
    /// Syntax health (for Scout agents)
    pub health: SyntaxHealth,
    /// Visual style
    pub style: NodeStyle,
    /// Tokens for syntax highlighting
    pub tokens: Vec<SyntaxToken>,
}

/// Types of visual nodes
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum VisualNodeType {
    Function {
        name: String,
        params: Vec<String>,
        return_type: String,
        asyncness: bool,
        unsafety: bool,
    },
    Struct {
        name: String,
        fields: Vec<String>,
        field_types: Vec<String>,
    },
    Enum {
        name: String,
        variants: Vec<String>,
    },
    Module {
        name: String,
    },
    Impl {
        trait_name: Option<String>,
        type_name: String,
    },
    Trait {
        name: String,
        methods: Vec<String>,
    },
    TypeAlias {
        name: String,
        target: String,
    },
    Constant {
        name: String,
        type_str: String,
    },
    Static {
        name: String,
        type_str: String,
        mutability: bool,
    },
    UseStatement,
    WgslFunction,
    TextBlock,
    Unknown,
}

/// Syntax health information for Scout agents
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SyntaxHealth {
    /// Overall health score (0.0 = dead, 1.0 = healthy)
    pub score: f32,
    /// Error messages
    pub errors: Vec<String>,
    /// Warnings
    pub warnings: Vec<String>,
    /// Suggestions
    pub suggestions: Vec<String>,
    /// Whether this node is locked by an agent
    pub locked: bool,
    /// Which agent locked it (if any)
    pub locked_by: Option<String>,
}

impl Default for SyntaxHealth {
    fn default() -> Self {
        Self {
            score: 1.0,
            errors: Vec::new(),
            warnings: Vec::new(),
            suggestions: Vec::new(),
            locked: false,
            locked_by: None,
        }
    }
}

impl SyntaxHealth {
    /// Create error state (red glow)
    pub fn error(message: impl Into<String>) -> Self {
        Self {
            score: 0.0,
            errors: vec![message.into()],
            warnings: Vec::new(),
            suggestions: Vec::new(),
            locked: false,
            locked_by: None,
        }
    }

    /// Create warning state (yellow glow)
    pub fn warning(message: impl Into<String>) -> Self {
        Self {
            score: 0.5,
            errors: Vec::new(),
            warnings: vec![message.into()],
            suggestions: Vec::new(),
            locked: false,
            locked_by: None,
        }
    }

    /// Lock this node for an agent
    pub fn lock(&mut self, agent_id: String) {
        self.locked = true;
        self.locked_by = Some(agent_id);
    }

    /// Unlock this node
    pub fn unlock(&mut self) {
        self.locked = false;
        self.locked_by = None;
    }
}

/// Visual styling for nodes
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NodeStyle {
    pub background_color: (f32, f32, f32, f32),
    pub border_color: (f32, f32, f32, f32),
    pub text_color: (f32, f32, f32),
    pub glow_color: Option<(f32, f32, f32)>, // For Scout agents
    pub glow_intensity: f32,
}

impl NodeStyle {
    pub fn for_node_type(node_type: &VisualNodeType) -> Self {
        match node_type {
            VisualNodeType::Function { .. } => Self::function(),
            VisualNodeType::Struct { .. } => Self::r#struct(),
            VisualNodeType::Enum { .. } => Self::r#enum(),
            VisualNodeType::Module { .. } => Self::module(),
            VisualNodeType::Impl { .. } => Self::r#impl(),
            VisualNodeType::Trait { .. } => Self::trait_(),
            VisualNodeType::Constant { .. } => Self::constant(),
            VisualNodeType::Static { .. } => Self::static_var(),
            VisualNodeType::WgslFunction => Self::wgsl_function(),
            _ => Self::default(),
        }
    }

    fn function() -> Self {
        Self {
            background_color: (0.13, 0.17, 0.22, 0.95),
            border_color: (0.86, 0.50, 0.28, 1.0),
            text_color: (0.92, 0.92, 0.92),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn r#struct() -> Self {
        Self {
            background_color: (0.15, 0.20, 0.15, 0.95),
            border_color: (0.40, 0.80, 0.40, 1.0),
            text_color: (0.92, 0.95, 0.92),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn r#enum() -> Self {
        Self {
            background_color: (0.15, 0.15, 0.20, 0.95),
            border_color: (0.60, 0.40, 0.80, 1.0),
            text_color: (0.92, 0.90, 0.95),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn module() -> Self {
        Self {
            background_color: (0.12, 0.12, 0.18, 0.95),
            border_color: (0.50, 0.50, 0.80, 1.0),
            text_color: (0.90, 0.90, 0.95),
            glow_color: None,
            glow_intensity: 0.15,
        }
    }

    fn r#impl() -> Self {
        Self {
            background_color: (0.18, 0.15, 0.12, 0.95),
            border_color: (0.80, 0.60, 0.40, 1.0),
            text_color: (0.95, 0.92, 0.90),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn trait_() -> Self {
        Self {
            background_color: (0.15, 0.12, 0.18, 0.95),
            border_color: (0.80, 0.40, 0.60, 1.0),
            text_color: (0.95, 0.90, 0.92),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn constant() -> Self {
        Self {
            background_color: (0.12, 0.18, 0.18, 0.95),
            border_color: (0.40, 0.80, 0.80, 1.0),
            text_color: (0.90, 0.95, 0.95),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn static_var() -> Self {
        Self {
            background_color: (0.18, 0.18, 0.12, 0.95),
            border_color: (0.80, 0.80, 0.40, 1.0),
            text_color: (0.95, 0.95, 0.90),
            glow_color: None,
            glow_intensity: 0.2,
        }
    }

    fn wgsl_function() -> Self {
        Self {
            background_color: (0.12, 0.20, 0.15, 0.95),
            border_color: (0.40, 0.90, 0.50, 1.0),
            text_color: (0.90, 0.95, 0.92),
            glow_color: None,
            glow_intensity: 0.3,
        }
    }

    fn text_block() -> Self {
        Self {
            background_color: (0.18, 0.18, 0.18, 0.95),
            border_color: (0.60, 0.60, 0.60, 1.0),
            text_color: (0.90, 0.90, 0.90),
            glow_color: None,
            glow_intensity: 0.1,
        }
    }

    fn error() -> Self {
        Self {
            background_color: (0.30, 0.10, 0.10, 0.95),
            border_color: (1.0, 0.3, 0.3, 1.0),
            text_color: (1.0, 0.9, 0.9),
            glow_color: Some((1.0, 0.2, 0.2)),
            glow_intensity: 0.8,
        }
    }

    fn warning() -> Self {
        Self {
            background_color: (0.30, 0.25, 0.10, 0.95),
            border_color: (1.0, 0.8, 0.2, 1.0),
            text_color: (1.0, 0.95, 0.9),
            glow_color: Some((1.0, 0.8, 0.2)),
            glow_intensity: 0.6,
        }
    }

    fn locked() -> Self {
        Self {
            background_color: (0.20, 0.10, 0.25, 0.95),
            border_color: (0.80, 0.40, 1.0, 1.0),
            text_color: (0.95, 0.90, 1.0),
            glow_color: Some((0.6, 0.2, 1.0)),
            glow_intensity: 0.7,
        }
    }
}

impl Default for NodeStyle {
    fn default() -> Self {
        Self {
            background_color: (0.15, 0.15, 0.15, 0.95),
            border_color: (0.50, 0.50, 0.50, 1.0),
            text_color: (0.90, 0.90, 0.90),
            glow_color: None,
            glow_intensity: 0.0,
        }
    }
}

/// Syntax token for highlighting
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SyntaxToken {
    pub kind: TokenKind,
    pub text: String,
    pub offset: usize,
    pub length: usize,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum TokenKind {
    Keyword,
    Identifier,
    Type,
    Function,
    String,
    Number,
    Comment,
    Operator,
    Attribute,
    Lifetime,
    Macro,
}

/// Errors during parsing
#[derive(Debug, Clone)]
pub enum ParseError {
    IoError(String),
    SynError(String, String),
    InvalidSyntax(String),
}

impl std::fmt::Display for ParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ParseError::IoError(s) => write!(f, "IO error: {}", s),
            ParseError::SynError(tile, msg) => write!(f, "Parse error in {}: {}", tile, msg),
            ParseError::InvalidSyntax(s) => write!(f, "Invalid syntax: {}", s),
        }
    }
}

impl std::error::Error for ParseError {}

/// Tokenizer for syntax highlighting
pub struct SyntaxTokenizer;

impl SyntaxTokenizer {
    /// Tokenize Rust source code
    pub fn tokenize_rust(source: &str) -> Vec<SyntaxToken> {
        let mut tokens = Vec::new();
        let chars: Vec<char> = source.chars().collect();
        let mut i = 0;

        while i < chars.len() {
            // Skip whitespace
            if chars[i].is_whitespace() {
                i += 1;
                continue;
            }

            // Comments
            if i + 1 < chars.len() && chars[i] == '/' && chars[i + 1] == '/' {
                let start = i;
                while i < chars.len() && chars[i] != '\n' {
                    i += 1;
                }
                tokens.push(SyntaxToken {
                    kind: TokenKind::Comment,
                    text: chars[start..i].iter().collect(),
                    offset: start,
                    length: i - start,
                });
                continue;
            }

            // Strings
            if chars[i] == '"' {
                let start = i;
                i += 1;
                while i < chars.len() && chars[i] != '"' {
                    if chars[i] == '\\' && i + 1 < chars.len() {
                        i += 2;
                    } else {
                        i += 1;
                    }
                }
                i += 1; // Include closing quote
                tokens.push(SyntaxToken {
                    kind: TokenKind::String,
                    text: chars[start..i].iter().collect(),
                    offset: start,
                    length: i - start,
                });
                continue;
            }

            // Keywords
            if chars[i].is_alphabetic() || chars[i] == '_' {
                let start = i;
                while i < chars.len() && (chars[i].is_alphanumeric() || chars[i] == '_') {
                    i += 1;
                }
                let word: String = chars[start..i].iter().collect();
                let kind = match word.as_str() {
                    "fn" | "let" | "mut" | "const" | "static" | "pub" | "struct" | "enum" |
                    "impl" | "trait" | "type" | "use" | "mod" | "where" | "for" | "while" |
                    "loop" | "match" | "if" | "else" | "return" | "break" | "continue" |
                    "move" | "ref" | "unsafe" | "async" | "await" | "crate" | "super" |
                    "Self" | "self" | "true" | "false"
                        => TokenKind::Keyword,
                    _ => TokenKind::Identifier,
                };
                tokens.push(SyntaxToken {
                    kind,
                    text: word,
                    offset: start,
                    length: i - start,
                });
                continue;
            }

            // Operators
            if "!@#$%^&*()-+=|{}[]<>;:,./?".contains(chars[i]) {
                let start = i;
                while i < chars.len() && "!@#$%^&*()-+=|{}[]<>;:,./?".contains(chars[i]) {
                    i += 1;
                }
                tokens.push(SyntaxToken {
                    kind: TokenKind::Operator,
                    text: chars[start..i].iter().collect(),
                    offset: start,
                    length: i - start,
                });
                continue;
            }

            // Numbers
            if chars[i].is_numeric() {
                let start = i;
                while i < chars.len() && (chars[i].is_numeric() || chars[i] == '.') {
                    i += 1;
                }
                tokens.push(SyntaxToken {
                    kind: TokenKind::Number,
                    text: chars[start..i].iter().collect(),
                    offset: start,
                    length: i - start,
                });
                continue;
            }

            i += 1;
        }

        tokens
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_syntax_health() {
        let health = SyntaxHealth::error("test error");
        assert_eq!(health.score, 0.0);
        assert_eq!(health.errors.len(), 1);

        let health = SyntaxHealth::warning("test warning");
        assert_eq!(health.score, 0.5);
        assert_eq!(health.warnings.len(), 1);
    }

    #[test]
    fn test_tokenize_rust() {
        let source = r#"
            fn main() {
                let x = 42;
                println!("Hello");
            }
        "#;

        let tokens = SyntaxTokenizer::tokenize_rust(source);
        
        assert!(tokens.iter().any(|t| t.kind == TokenKind::Keyword));
        assert!(tokens.iter().any(|t| t.kind == TokenKind::Number));
        assert!(tokens.iter().any(|t| t.kind == TokenKind::String));
    }

    #[test]
    fn test_node_styles() {
        let fn_style = NodeStyle::function();
        assert_eq!(fn_style.border_color.0, 0.86); // Rust orange
        
        let struct_style = NodeStyle::r#struct();
        assert_eq!(struct_style.border_color.1, 0.80); // Green
        
        let error_style = NodeStyle::error();
        assert_eq!(error_style.glow_color, Some((1.0, 0.2, 0.2)));
    }

    #[test]
    fn test_grid_coord() {
        let coord1: GridCoord = (100.5, 200.3).into();
        assert_eq!(coord1.x, 100);
        assert_eq!(coord1.y, 200);

        let coord2: GridCoord = (300, 400).into();
        assert_eq!(coord2.x, 300);
        assert_eq!(coord2.y, 400);
    }
}
