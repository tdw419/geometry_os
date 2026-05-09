; DESCRIPTION: Renders a magenta box of size 63x38 starting at (351, 158).
; PLAN: r0=351(x), r1=158(y), r2=63(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 158
LDI r2, 63
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
