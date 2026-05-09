; DESCRIPTION: Draws a magenta circle centered at (362, 68) with radius 35.
; PLAN: r0=362(x), r1=68(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 68
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
