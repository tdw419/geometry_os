; DESCRIPTION: Renders a magenta box of size 32x112 starting at (115, 57).
; PLAN: r0=115(x), r1=57(y), r2=32(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 57
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
