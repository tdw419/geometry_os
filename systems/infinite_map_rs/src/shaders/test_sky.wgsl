precision highp float; // For trig functions in WGSL

uniform vec2 viewport_width; // Dimensions of the rendered canvas
uniform vec2 viewport_height; // Dimensions of the rendered canvas

// Define constants and variables for use in shader
const float PI = 3.14159;
const float DRIFTING_CLOUDS_RADIUS = 0.5;
const vec2 CLOUD_DIRECTIONS[4] = vec2[]
{
    vec2(-1, -1),
    vec2(1, -1),
    vec2(-1, 1),
    vec2(1, 1)
};

// Generate noise for clouds based on the direction of the camera
vec3 generateCloudsNoise()
{
    const float DRIFTING_CLOUDS_DELAY = 0.5; // In seconds
    return mix(vec3(0), noise(vec2(10.0 * sin(time * PI / 20.0), 10.0 * cos(time * PI / 20.0))), exp(-length(CLOUD_DIRECTIONS[random % 4]) * DRIFTING_CLOUDS_DELAY));
}

// Calculate the position and direction of a cloud based on the current viewport size
vec3 getCloudPosition()
{
    vec2 uv = (gl_FragCoord.xy / viewport_width) * 0.5 + 0.5;
    float angle = atan(uv.y, uv.x); // Angle in radians
    return mix(vec3(0), generateCloudsNoise(), exp(-length(CLOUD_DIRECTIONS[random % 4]) * PI / DRIFTING_CLOUDS_DELAY));
}

// Calculate the position and direction of a cloud based on its position relative to the camera
vec3 getCloudPositionRelativeToCamera()
{
    vec2 uv = (gl_FragCoord.xy / viewport_width) * 0.5 + 0.5;
    float angle = atan(uv.y, uv.x); // Angle in radians
    return mix(vec3(-10), generateCloudsNoise(), exp(-length(CLOUD_DIRECTIONS[random % 4]) * PI / DRIFTING_CLOUDS_DELAY));
}

// Calculate the position and direction of a cloud based on its position relative to the current viewport size
vec3 getCloudPositionRelativeToViewport()
{
    vec2 uv = (gl_FragCoord.xy / viewport_width) * 0.5 + 0.5;
    float angle = atan(uv.y, uv.x); // Angle in radians
    return mix(vec3(-10), generateCloudsNoise(), exp(-length(CLOUD_DIRECTIONS[random % 4]) * PI / DRIFTING_CLOUDS_DELAY));
}

// Calculate the position and direction of a cloud based on its position relative to the current viewport size
vec3 getCloudPositionRelativeToViewport()
{
    vec2 uv = (gl_FragCoord.xy / viewport_size) * 0.5 + 0.5;
    float angle = atan(uv.y, uv.x); // Angle in radians
    return mix(vec3(-10), generateCloudsNoise(), exp(-length(CLOUD_DIRECTIONS[random % 4]) * PI / DRIFTING_CLOUDS_DELAY));
}