; DESCRIPTION: Renders a magenta box of size 64x42 starting at (186, 87).
; PLAN: r0=186(x), r1=87(y), r2=64(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 87
LDI r2, 64
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
