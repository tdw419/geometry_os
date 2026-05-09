; DESCRIPTION: Renders a magenta box of size 32x43 starting at (331, 94).
; PLAN: r0=331(x), r1=94(y), r2=32(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 94
LDI r2, 32
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
