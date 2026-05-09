; DESCRIPTION: Renders a magenta box of size 17x63 starting at (266, 6).
; PLAN: r0=266(x), r1=6(y), r2=17(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 6
LDI r2, 17
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
