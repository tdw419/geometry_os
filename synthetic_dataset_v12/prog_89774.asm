; DESCRIPTION: Renders a magenta box of size 32x17 starting at (199, 147).
; PLAN: r0=199(x), r1=147(y), r2=32(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 147
LDI r2, 32
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
