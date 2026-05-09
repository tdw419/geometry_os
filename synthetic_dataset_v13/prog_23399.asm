; DESCRIPTION: Draws a magenta circle centered at (385, 85) with radius 49.
; PLAN: r0=385(x), r1=85(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 85
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
