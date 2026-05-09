; DESCRIPTION: Draws a magenta circle centered at (45, 68) with radius 38.
; PLAN: r0=45(x), r1=68(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 68
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
