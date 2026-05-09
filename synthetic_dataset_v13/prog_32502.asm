; DESCRIPTION: Renders a magenta box of size 62x49 starting at (417, 189).
; PLAN: r0=417(x), r1=189(y), r2=62(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 189
LDI r2, 62
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
