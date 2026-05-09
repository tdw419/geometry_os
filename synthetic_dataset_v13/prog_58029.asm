; DESCRIPTION: Draws a magenta circle centered at (287, 61) with radius 42.
; PLAN: r0=287(x), r1=61(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 61
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
