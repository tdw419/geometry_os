; DESCRIPTION: Places a purple 93x42 rectangle at position (417, 211).
; PLAN: r0=417(x), r1=211(y), r2=93(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 211
LDI r2, 93
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
