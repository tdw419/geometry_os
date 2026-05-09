; DESCRIPTION: Renders a magenta box of size 64x35 starting at (266, 170).
; PLAN: r0=266(x), r1=170(y), r2=64(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 170
LDI r2, 64
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
