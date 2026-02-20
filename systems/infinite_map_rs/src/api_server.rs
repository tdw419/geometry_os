use axum::{
    extract::{Path, Query, State},
    response::{IntoResponse, Response},
    routing::{get, post},
    Json, Router,
};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::sync::{Arc, Mutex};
use tower_http::cors::CorsLayer;
use image::{ImageBuffer, Rgba};
use std::io::Cursor;
use crate::map_loader::MapLoader;
use crate::synapse::{Synapse, SynapticLayer};

/// Terminal spawn request (Phase 3: Terminal Clone Integration)
#[derive(Clone, Debug, Default)]
pub struct TerminalSpawnRequest {
    pub tile_id: i64,
    pub rows: usize,
    pub cols: usize,
    pub shell: String,
}

/// Terminal resize request
#[derive(Clone, Debug, Default)]
pub struct TerminalResizeRequest {
    pub tile_id: i64,
    pub rows: usize,
    pub cols: usize,
}

#[derive(Clone, Default)]
pub struct RuntimeState {
    pub focused_id: Option<String>, // "Alpine_VM" or brick name
    pub mouse_pos: (f32, f32),

    // Phase 36: Visual OCR - Framebuffer request
    pub screenshot_params: Option<(i32, i32, u32, u32)>, // x, y, w, h (ROI) - None means full screen
    pub screenshot_data: Option<(Vec<u8>, u32, u32)>,    // data, width, height

    // Phase 34: Transmutation Request
    pub pending_load: Option<String>, // Path to .rts.png to auto-load

    // Phase 35.6: Synaptic Action Execution (Queue)
    pub pending_synaptic_actions: Vec<String>,

    // Evolution Bridge
    pub pending_genomes: Vec<crate::evolution_terrain_bridge::EvolutionGenome>,

    // Phase 3: Terminal Clone Integration
    pub pending_terminal_spawns: Vec<TerminalSpawnRequest>,
    pub pending_terminal_resizes: Vec<TerminalResizeRequest>,
    pub pending_terminal_destroys: Vec<i64>, // tile_ids to destroy
}

#[derive(Clone)]
pub struct AppState {
    pub map_loader: Arc<Mutex<MapLoader>>,
    pub runtime_state: Arc<Mutex<RuntimeState>>,
    pub synaptic_layer: Arc<Mutex<SynapticLayer>>,
}

#[derive(Deserialize)]
pub struct ChunkQuery {
    x: i32,
    y: i32,
    size: Option<i32>,
}

#[derive(Serialize)]
pub struct TileData {
    x: i32,
    y: i32,
    brick: String,
    timestamp: u64,
}

#[derive(Serialize)]
#[allow(non_snake_case)]
pub struct ChunkResponse {
    chunkX: i32,
    chunkY: i32,
    tiles: HashMap<String, TileData>,
    metadata: ChunkMetadata,
}

#[derive(Serialize)]
pub struct ChunkMetadata {
    generated_at: u64,
    version: String,
}

#[derive(Deserialize)]
pub struct TransmuteRequest {
    code: String,
    language: String, // "python", "javascript", "c"
    cursor_x: Option<i32>,
    cursor_y: Option<i32>,
}

#[derive(Serialize)]
pub struct TransmuteResponse {
    success: bool,
    message: String,
    artifact_path: Option<String>,
    x: Option<i32>,
    y: Option<i32>,
}

// ... (Structs ChunkQuery, TileData, ChunkResponse, ChunkMetadata remain same)

pub async fn start_api_server(
    port: u16, 
    map_path: std::path::PathBuf, 
    runtime_state: Arc<Mutex<RuntimeState>>,
    synaptic_layer: Arc<Mutex<SynapticLayer>>
) {
    let map_loader = Arc::new(Mutex::new(MapLoader::new(map_path)));
    
    // Initial load
    if let Ok(mut loader) = map_loader.lock() {
        let _ = loader.check_updates();
    }

    let state = AppState {
        map_loader,
        runtime_state,
        synaptic_layer,
    };

use tower_http::services::ServeDir;

    let app = Router::new()
        .route("/api/chunk", get(get_chunk))
        .route("/api/scan", get(scan_world))
        .route("/api/visual/capture", get(capture_frame))
        .route("/api/transmute", post(handle_transmute))
        .route("/api/load-file", post(handle_load_file))
        .route("/api/self-write", post(handle_self_write))
        .route("/api/synapse/register", post(handle_synapse_register))
        .route("/api/synapse/signal", post(handle_synapse_signal))
        .route("/api/evolution/genome", post(handle_evolution_genome))
        // Phase 3: Terminal Clone Integration
        .route("/api/terminal/spawn", post(handle_terminal_spawn))
        .route("/api/terminal/{id}/resize", post(handle_terminal_resize))
        .route("/api/terminal/{id}", delete(handle_terminal_destroy))
        .route("/builder/queue/{brick}", get(get_texture))
        .route("/health", get(health_check))
        .fallback_service(ServeDir::new("../visual_shell/web"))
        .layer(CorsLayer::permissive())
        .with_state(state);

    let addr = std::net::SocketAddr::from(([0, 0, 0, 0], port));
    println!("🚀 API Server listening on http://{}", addr);

    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn health_check() -> impl IntoResponse {
    Json(serde_json::json!({ "status": "ok", "backend": "infinite_map_rs" }))
}

async fn get_chunk(
    Query(params): Query<ChunkQuery>,
    State(state): State<AppState>,
) -> impl IntoResponse {
    let chunk_x = params.x;
    let chunk_y = params.y;
    let size = params.size.unwrap_or(16);

    let mut tiles = HashMap::new();
    
    // Lock map loader to get data
    {
        let mut loader = state.map_loader.lock().unwrap();
        // Check for updates periodically? For now, assume notified or handle elsewhere.
        // Or just check here briefly (might be slow if FS is slow, but OK for now)
        let _ = loader.check_updates();

        // Iterate tiles in this chunk
        // MapLoader stores (x,y) -> BrickEntry
        // We need to find tiles in range [chunk_x*size .. (chunk_x+1)*size]
        
        let min_x = chunk_x * size;
        let min_y = chunk_y * size;
        let max_x = min_x + size;
        let max_y = min_y + size;

        // Optimization: Spatial index would be better, but iteration is fine for now if map is small.
        // If map is large, MapLoader should have a spatial index.
        // Current MapLoader uses HashMap<(i32,i32), ...>.
        // We can just iterate the relevant coordinates.
        for x in min_x..max_x {
            for y in min_y..max_y {
                if let Some(entry) = loader.entries.get(&(x, y)) {
                    let key = format!("{},{}", x, y);
                    tiles.insert(key, TileData {
                        x,
                        y,
                        brick: entry.brick.clone(),
                        timestamp: entry.timestamp as u64,
                    });
                }
            }
        }
    }
    
    // If we are at Antigravity Prime (819200, 819200) area (approx 8192, 8192 in chunk coords if grid=100?)
    // Wait, coordinate systems:
    // User JS: initialX: 819200, initialY: 819200.
    // Chunk size 16. Grid size 100.
    // If x=819200 is PIXELS, and grid is 100, then TILE coord is 8192.
    // Chunk coord is 8192 / 16 = 512. 
    // Wait, 8192 * 100 = 819200.
    // So TILE x=8192. Chunk x=512.
    
    // Add procedural tiles for Antigravity Prime if empty?
    if tiles.is_empty() {
        // Optional: procedural fallback like mock_server
        // But for now, let's stick to the map.
    }

    let response = ChunkResponse {
        chunkX: chunk_x,
        chunkY: chunk_y,
        tiles,
        metadata: ChunkMetadata {
            generated_at: std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs(),
            version: "1.0-rust".to_string(),
        },
    };

    Json(response)
}

#[derive(Serialize)]
pub struct ScanResponse {
    poi: Vec<PointOfInterest>,
}

#[derive(Serialize)]
pub struct PointOfInterest {
    x: i32,
    y: i32,
    brick: String,
    is_focused: bool,
}

async fn scan_world(State(state): State<AppState>) -> impl IntoResponse {
    let mut poi = Vec::new();
    
    // Get focused ID
    let focused_id = if let Ok(rs) = state.runtime_state.lock() {
        rs.focused_id.clone()
    } else {
        None
    };

    if let Ok(loader) = state.map_loader.lock() {
        for ((x, y), entry) in &loader.entries {
            poi.push(PointOfInterest {
                x: *x,
                y: *y,
                brick: entry.brick.clone(),
                is_focused: focused_id.as_deref() == Some(&entry.brick),
            });
        }
    }
    
    // Always add the Alpine VM location if running (Hack for now, usually it's a window)
    // In a real system, we'd query window manager too.
    poi.push(PointOfInterest { 
        x: 1200, 
        y: 0, 
        brick: "Alpine_VM".to_string(),
        is_focused: focused_id.as_deref() == Some("Alpine_VM"),
    });

    Json(ScanResponse { poi })
}

async fn get_texture(Path(brick): Path<String>) -> Response {
    let size = 100; // Default size
    let mut img: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::new(size, size);

    // Color logic
    let color = match brick.as_str() {
        "system_core" => Rgba([0, 255, 255, 255]),      // Cyan
        "data_block" => Rgba([0, 0, 255, 255]),         // Blue
        "neural_link" => Rgba([255, 0, 255, 255]),      // Magenta
        "memory_cell" => Rgba([255, 255, 0, 255]),       // Yellow
        "processing_unit" => Rgba([255, 0, 0, 255]),     // Red
        "storage_sector" => Rgba([0, 255, 0, 255]),      // Green
        "network_node" => Rgba([128, 0, 128, 255]),     // Purple
        "security_layer" => Rgba([255, 128, 0, 255]),     // Orange
        _ => Rgba([128, 128, 128, 255]),                // Gray
    };

    // Draw simple pattern
    for (x, y, pixel) in img.enumerate_pixels_mut() {
        // Border
        if x < 2 || x >= size-2 || y < 2 || y >= size-2 {
            *pixel = color;
        } else if x > 20 && x < 80 && y > 20 && y < 80 {
             // Inner square with alpha
             let mut c = color.clone();
             c.0[3] = 100;
             *pixel = c;
        } else {
            *pixel = Rgba([17, 17, 17, 255]); // Background
        }
    }

    // specific patterns
    if brick == "system_core" {
        // Draw circle (rough)
        let cx = size as i32 / 2;
        let cy = size as i32 / 2;
        let r = size as i32 / 3;
        for (x, y, pixel) in img.enumerate_pixels_mut() {
            let dx = x as i32 - cx;
            let dy = y as i32 - cy;
            if (dx*dx + dy*dy) < r*r {
                 *pixel = color;
            }
        }
    }

    let mut buffer = Cursor::new(Vec::new());
    img.write_to(&mut buffer, image::ImageFormat::Png).unwrap();
    
    let body = axum::body::Body::from(buffer.into_inner());

    Response::builder()
        .header("Content-Type", "image/png")
        .header("Cache-Control", "public, max-age=3600")
        .body(body)
        .unwrap()
}

#[derive(Deserialize)]
pub struct CaptureQuery {
    x: Option<i32>,
    y: Option<i32>,
    w: Option<u32>,
    h: Option<u32>,
}

async fn capture_frame(
    Query(params): Query<CaptureQuery>,
    State(state): State<AppState>,
) -> Response {
    let x = params.x.unwrap_or(0);
    let y = params.y.unwrap_or(0);
    let w = params.w.unwrap_or(0); // 0 means full screen
    let h = params.h.unwrap_or(0);

    // Request Screenshot
    {
        let mut rs = state.runtime_state.lock().unwrap();
        rs.screenshot_params = Some((x, y, w, h));
        rs.screenshot_data = None; // Reset previous
    }

    // Poll for result (Max 2 seconds)
    // We check every 50ms
    let mut attempts = 0;
    loop {
        tokio::time::sleep(tokio::time::Duration::from_millis(50)).await;
        
        let should_break = {
            let rs = state.runtime_state.lock().unwrap();
            rs.screenshot_data.is_some()
        };

        if should_break {
            break;
        }

        attempts += 1;
        if attempts > 40 {
            return Response::builder()
                .status(503)
                .body(axum::body::Body::from("Capture timeout"))
                .unwrap();
        }
    }

    // Retrieve data and clear
    let (data, width, height) = {
        let mut rs = state.runtime_state.lock().unwrap();
        let val = rs.screenshot_data.take().unwrap();
        rs.screenshot_params = None; // Clear request
        val
    };

    // Encode to PNG
    // Data is likely RGBA or BGRA. Renderer usually provides RGBA.
    // However, wgpu often pads rows to 256 bytes.
    // The Renderer implementation needs to handle unpadding.
    // Assuming 'data' is tightly packed RGBA here.
    
    let mut buffer = Cursor::new(Vec::new());
    if let Err(e) = image::write_buffer_with_format(
        &mut buffer,
        &data,
        width,
        height,
        image::ColorType::Rgba8,
        image::ImageFormat::Png,
    ) {
         return Response::builder()
            .status(500)
            .body(axum::body::Body::from(format!("Encoding error: {}", e)))
            .unwrap();
    }

    Response::builder()
        .header("Content-Type", "image/png")
        .header("X-Image-Width", width.to_string())
        .header("X-Image-Height", height.to_string())
        .body(axum::body::Body::from(buffer.into_inner()))
        .unwrap()
}

async fn handle_transmute(
    State(state): State<AppState>,
    Json(payload): Json<TransmuteRequest>,
) -> impl IntoResponse {
    // Determine extension
    let ext = match payload.language.as_str() {
        "python" => "py",
        "javascript" | "js" => "js",
        "c" => "c",
        _ => return Json(TransmuteResponse {
            success: false,
            message: "Unsupported language".to_string(),
            artifact_path: None,
            x: None,
            y: None,
        }),
    };

    let filename = format!("temp_transmute.{}", ext);
    // Path relative to project root
    let filepath_rel = std::path::Path::new("systems/transmutation").join(&filename);
    
    // We are running in systems/infinite_map_rs, need to go up to project root
    // But fs::write uses CWD. app is likely run from systems/infinite_map_rs
    let root_path = std::path::Path::new("../..");
    let filepath = root_path.join(&filepath_rel);

    // Write code to file
    if let Err(e) = std::fs::write(&filepath, &payload.code) {
        return Json(TransmuteResponse {
            success: false,
            message: format!("Failed to write source file to {:?}: {}", filepath, e),
            artifact_path: None,
            x: None,
            y: None,
        });
    }

    // Determine artifact path (pipeline replaces ext with .rts.png)
    let artifact_path = filepath.with_extension("rts.png");
    // Also remove old artifact if exists
    let _ = std::fs::remove_file(&artifact_path);

    // Run transmutation
    // python3 -m systems.transmutation.transmute systems/transmutation/temp_transmute.py --assemble --link
    // We run python from project root so module path works
    let start_time = std::time::Instant::now();
    let output = std::process::Command::new("python3")
        .args(&[
            "-m", "systems.transmutation.transmute",
            filepath_rel.to_str().unwrap(),
            "--assemble",
            "--link"
        ])
        .current_dir(root_path) 
        .output();
        
    let _duration = start_time.elapsed();

    match output {
        Ok(out) => {
            if out.status.success() {
                // Check if artifact exists
                 if artifact_path.exists() {
                                         let abs_path = std::fs::canonicalize(&artifact_path).unwrap_or(artifact_path.clone());
                                         let abs_path_str = abs_path.to_string_lossy().to_string();
                     
                                         let x = payload.cursor_x.unwrap_or(0); // Default X
                                         let y = payload.cursor_y.unwrap_or(0); // Default Y
                                          
                                         // Set pending load along with coordinates
                                         if let Ok(mut rs) = state.runtime_state.lock() {
                                             rs.pending_load = Some(format!("{};{},{}", abs_path_str.clone(), x, y));
                                         }
                                          
                                         Json(TransmuteResponse {
                                             success: true,
                                             message: "Transmutation successful. Artifact loaded.".to_string(),
                                             artifact_path: Some(abs_path_str),
                                             x: Some(x),
                                             y: Some(y),
                                         })
                                     } else {
                                         Json(TransmuteResponse {
                                             success: false,
                                             message: "Pipeline finished but artifact not found.".to_string(),
                                             artifact_path: None,
                                             x: None,
                                             y: None,
                                         })
                                     }            } else {
                let stderr = String::from_utf8_lossy(&out.stderr);
                Json(TransmuteResponse {
                    success: false,
                    message: format!("Transmutation failed:\n{}", stderr),
                    artifact_path: None,
                    x: None,
                    y: None,
                })
            }
        }
        Err(e) => {
            Json(TransmuteResponse {
                success: false,
                message: format!("Failed to execute transmutation pipeline: {}", e),
                artifact_path: None,
                x: None,
                y: None,
            })
        }
    }
}

// Phase 34.3: Drag-and-Drop Execution for .rts.png files
#[derive(Deserialize)]
pub struct LoadFileRequest {
    file_path: String,
}

#[derive(Serialize)]
pub struct LoadFileResponse {
    success: bool,
    message: String,
    loaded_path: Option<String>,
}

async fn handle_load_file(
            State(state): State<AppState>,
            Json(payload): Json<LoadFileRequest>,
        ) -> impl IntoResponse {
            let file_path = std::path::Path::new(&payload.file_path);
            
            // Validate file exists and has correct extension
            if !file_path.exists() {
                return Json(LoadFileResponse {
                    success: false,
                    message: format!("File not found: {}", payload.file_path),
                    loaded_path: None,
                });
            }
            
            let path_str = payload.file_path.to_lowercase();
            if !path_str.ends_with(".rts.png") && !path_str.ends_with(".rts") {
                return Json(LoadFileResponse {
                    success: false,
                    message: "File must be .rts.png or .rts format".to_string(),
                    loaded_path: None,
                });
            }
            
            // Canonicalize path
            let abs_path = match std::fs::canonicalize(file_path) {
                Ok(p) => p,
                Err(e) => {
                    return Json(LoadFileResponse {
                        success: false,
                        message: format!("Failed to resolve path: {}", e),
                        loaded_path: None,
                    });
                }
            };
            
            let abs_path_str = abs_path.to_string_lossy().to_string();
            
            // Set pending load in runtime state
            if let Ok(mut rs) = state.runtime_state.lock() {
                rs.pending_load = Some(abs_path_str.clone());
            }
            
            Json(LoadFileResponse {
                success: true,
                message: format!("File queued for execution: {}", abs_path_str),
                loaded_path: Some(abs_path_str),
            })
        }
        
        // Phase 34.4: EvolutionDaemon Self-Writing
        #[derive(Deserialize)]
        pub struct SelfWriteRequest {
            intent: String,
            language: Option<String>, // "python", "javascript", "c", "rust"
            context: Option<HashMap<String, String>>,
        }
        
        #[derive(Serialize)]
        pub struct SelfWriteResponse {
            success: bool,
            message: String,
            generated_code: Option<String>,
            artifact_path: Option<String>,
        }
        
        async fn handle_self_write(
            State(state): State<AppState>,
            Json(payload): Json<SelfWriteRequest>,
        ) -> impl IntoResponse {
            let language = payload.language.unwrap_or_else(|| "python".to_string());
            
            // Validate language
            let valid_languages = vec!["python", "javascript", "js", "c", "rust"];
            if !valid_languages.contains(&language.as_str()) {
                return Json(SelfWriteResponse {
                    success: false,
                    message: format!("Unsupported language: {}. Use: {:?}", language, valid_languages),
                    generated_code: None,
                    artifact_path: None,
                });
            }
            
            // Trigger EvolutionDaemon self-writing via Python script
            let root_path = std::path::Path::new("../..");
            let timestamp = std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs();
            
            let output_filename = format!("evolution_gen_{}.py", timestamp);
            let output_path = root_path.join("systems").join("transmutation").join(&output_filename);
            
            // Run evolution daemon code generation
            let output = std::process::Command::new("python3")
                .args(&[
                    "-c",
                    &format!(
                        r#"
        import sys
        sys.path.insert(0, '.')
        from evolution_daemon_v7 import EvolutionDaemonV7
        import json
        
        daemon = EvolutionDaemonV7()
        
        # Generate code based on intent
        intent = {{
            'action': 'GENERATE_CODE',
            'description': '{}',
            'language': '{}',
            'autonomous': True
        }}
        
        # Emit to intent bus
        daemon.intent_bus.emit_resonance(intent)
        
        # For now, generate a simple template based on the intent
        intent_desc = '{}'
        language = '{}'
        
        if language in ['python', 'py']:
            code = f'# Auto-generated by EvolutionDaemon V7\\n# Intent: {{intent_desc}}\\n\\n'
            code += 'def main():\\n'
            code += '    print("EvolutionDaemon Self-Writing Active")\\n'
            code += '    # TODO: Implement based on intent\\n'
            code += '    pass\\n\\n'
            code += 'if __name__ == "__main__":\\n'
            code += '    main()\\n'
        elif language in ['javascript', 'js']:
            code = f'// Auto-generated by EvolutionDaemon V7\\n// Intent: {{intent_desc}}\\n\\n'
            code += 'function main() {{\\n'
            code += '    console.log("EvolutionDaemon Self-Writing Active");\\n'
            code += '    // TODO: Implement based on intent\\n'
            code += '}}\\n\\n'
            code += 'main();\\n'
        elif language == 'c':
            code = f'/* Auto-generated by EvolutionDaemon V7 */\\n/* Intent: {{intent_desc}} */\\n\\n'
            code += '#include <stdio.h>\\n\\n'
            code += 'int main() {{\\n'
            code += '    printf("EvolutionDaemon Self-Writing Active\\n");\\n'
            code += '    // TODO: Implement based on intent\\n'
            code += '    return 0;\\n'
            code += '}}\\n'
        else:
            code = f'// Auto-generated by EvolutionDaemon V7\\n// Intent: {{intent_desc}}\\n'
        
        print(code)
                        "#,
                        payload.intent.replace("'", "\\'"),
                        language,
                        payload.intent.replace("'", "\\'"),
                        language
                    ),
                ])
                .current_dir(root_path)
                .output();
            
            match output {
                Ok(out) => {
                    if out.status.success() {
                        let generated_code = String::from_utf8_lossy(&out.stdout).to_string();
                        
                        // Write generated code to file
                        if let Err(e) = std::fs::write(&output_path, &generated_code) {
                            return Json(SelfWriteResponse {
                                success: false,
                                message: format!("Failed to write generated code: {}", e),
                                generated_code: Some(generated_code),
                                artifact_path: None,
                            });
                        }
                        
                        // Optionally transmute if not Python
                        let artifact_path = if language != "python" {
                            let rts_path = output_path.with_extension("rts.png");
                            let _ = std::fs::remove_file(&rts_path);
                            
                            let transmute_output = std::process::Command::new("python3")
                                .args(&[
                                    "-m", "systems.transmutation.transmute",
                                    &format!("systems/transmutation/{}", output_filename),
                                    "--assemble",
                                    "--link"
                                ])
                                .current_dir(root_path)
                                .output();
                            
                            if let Ok(t_out) = transmute_output {
                                if t_out.status.success() && rts_path.exists() {
                                    let abs_rts = std::fs::canonicalize(&rts_path)
                                        .unwrap_or(rts_path.clone())
                                        .to_string_lossy()
                                        .to_string();
                                    
                                    // Set pending load
                                    if let Ok(mut rs) = state.runtime_state.lock() {
                                        rs.pending_load = Some(abs_rts.clone());
                                    }
                                    
                                    Some(abs_rts)
                                } else {
                                    None
                                }
                            } else {
                                None
                            }
                        } else {
                            Some(output_path.to_string_lossy().to_string())
                        };
                        
                        Json(SelfWriteResponse {
                            success: true,
                            message: "EvolutionDaemon self-writing complete".to_string(),
                            generated_code: Some(generated_code),
                            artifact_path,
                        })
                    } else {
                        let stderr = String::from_utf8_lossy(&out.stderr);
                        Json(SelfWriteResponse {
                            success: false,
                            message: format!("Self-writing failed: {}", stderr),
                            generated_code: None,
                            artifact_path: None,
                        })
                    }
                }
                Err(e) => {
                    Json(SelfWriteResponse {
                        success: false,
                        message: format!("Failed to execute EvolutionDaemon: {}", e),
                        generated_code: None,
                        artifact_path: None,
                    })
                }
            }
}

// Phase 35: Synaptic Bridge Handlers

#[derive(Deserialize)]
pub struct SynapseRegisterRequest {
    id: String,
    vector: Vec<f32>,
    action: String,
}

#[derive(Serialize)]
pub struct SynapseRegisterResponse {
    success: bool,
    message: String,
}

async fn handle_synapse_register(
    State(state): State<AppState>,
    Json(payload): Json<SynapseRegisterRequest>,
) -> impl IntoResponse {
    let synapse = Synapse::new(payload.id.clone(), payload.vector, payload.action);
    
    if let Ok(mut layer) = state.synaptic_layer.lock() {
        layer.register_synapse(synapse);
        Json(SynapseRegisterResponse {
            success: true,
            message: format!("Synapse '{}' registered successfully", payload.id),
        })
    } else {
        Json(SynapseRegisterResponse {
            success: false,
            message: "Failed to lock Synaptic Layer".to_string(),
        })
    }
}

#[derive(Deserialize)]
pub struct SynapseSignalRequest {
    vector: Vec<f32>,
}

#[derive(Serialize)]
pub struct SynapseSignalResponse {
    triggered: Vec<String>, // List of Action Targets
    resonance_scores: HashMap<String, f32>,
}

async fn handle_synapse_signal(
    State(state): State<AppState>,
    Json(payload): Json<SynapseSignalRequest>,
) -> impl IntoResponse {
    let mut triggered_actions = Vec::new();
    let mut scores = HashMap::new();

    if let Ok(mut layer) = state.synaptic_layer.lock() {
        let activated = layer.check_resonance(&payload.vector);
        
        // Lock runtime state to queue actions
        if let Ok(mut rs) = state.runtime_state.lock() {
            for (synapse, score) in &activated {
                let action = synapse.action_target.clone();
                triggered_actions.push(action);
                scores.insert(synapse.id.clone(), *score);
            }
            rs.pending_synaptic_actions.extend(triggered_actions.clone());
        }
    }

    Json(SynapseSignalResponse {
        triggered: triggered_actions,
        resonance_scores: scores,
    })
}

#[derive(Deserialize)]
pub struct EvolutionGenomeRequest {
    pub pixels: Vec<u8>,
    pub generation: u64,
    pub fitness: f32,
}

async fn handle_evolution_genome(
    State(state): State<AppState>,
    Json(payload): Json<EvolutionGenomeRequest>,
) -> impl IntoResponse {
    if payload.pixels.len() != 4096 {
         return Json(serde_json::json!({ 
             "success": false, 
             "message": format!("Invalid pixel data length: {}. Expected 4096 (32x32x4).", payload.pixels.len()) 
         }));
    }

    let genome = crate::evolution_terrain_bridge::EvolutionGenome::from_pixels(
        payload.pixels,
        payload.generation,
        payload.fitness
    );

    if let Ok(mut rs) = state.runtime_state.lock() {
        rs.pending_genomes.push(genome);
    }

    Json(serde_json::json!({ "success": true, "message": "Genome received" }))
}

// ============================================
// Phase 3: Terminal Clone Integration
// ============================================

#[derive(Deserialize)]
pub struct TerminalSpawnPayload {
    pub tile_id: i64,
    pub rows: usize,
    pub cols: usize,
    pub shell: String,
}

#[derive(Serialize)]
pub struct TerminalSpawnResponse {
    pub success: bool,
    pub message: String,
    pub tile_id: i64,
}

async fn handle_terminal_spawn(
    State(state): State<AppState>,
    Json(payload): Json<TerminalSpawnPayload>,
) -> impl IntoResponse {
    let request = TerminalSpawnRequest {
        tile_id: payload.tile_id,
        rows: payload.rows,
        cols: payload.cols,
        shell: payload.shell,
    };

    if let Ok(mut rs) = state.runtime_state.lock() {
        rs.pending_terminal_spawns.push(request);
    }

    Json(TerminalSpawnResponse {
        success: true,
        message: "Terminal spawn request queued".to_string(),
        tile_id: payload.tile_id,
    })
}

#[derive(Deserialize)]
pub struct TerminalResizePayload {
    pub rows: usize,
    pub cols: usize,
}

#[derive(Serialize)]
pub struct TerminalResizeResponse {
    pub success: bool,
    pub message: String,
}

async fn handle_terminal_resize(
    State(state): State<AppState>,
    Path(tile_id): Path<i64>,
    Json(payload): Json<TerminalResizePayload>,
) -> impl IntoResponse {
    let request = TerminalResizeRequest {
        tile_id,
        rows: payload.rows,
        cols: payload.cols,
    };

    if let Ok(mut rs) = state.runtime_state.lock() {
        rs.pending_terminal_resizes.push(request);
    }

    Json(TerminalResizeResponse {
        success: true,
        message: format!("Terminal {} resize request queued", tile_id),
    })
}

#[derive(Serialize)]
pub struct TerminalDestroyResponse {
    pub success: bool,
    pub message: String,
}

async fn handle_terminal_destroy(
    State(state): State<AppState>,
    Path(tile_id): Path<i64>,
) -> impl IntoResponse {
    if let Ok(mut rs) = state.runtime_state.lock() {
        rs.pending_terminal_destroys.push(tile_id);
    }

    Json(TerminalDestroyResponse {
        success: true,
        message: format!("Terminal {} destroy request queued", tile_id),
    })
}
