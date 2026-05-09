; DESCRIPTION: Draws a magenta circle centered at (350, 165) with radius 49.
; PLAN: r0=350(x), r1=165(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 165
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
