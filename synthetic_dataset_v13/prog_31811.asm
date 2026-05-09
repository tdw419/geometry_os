; DESCRIPTION: Places a red 32x73 rectangle at position (180, 183).
; PLAN: r0=180(x), r1=183(y), r2=32(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 183
LDI r2, 32
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
