; DESCRIPTION: Draws a magenta circle centered at (82, 165) with radius 45.
; PLAN: r0=82(x), r1=165(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 165
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
