; DESCRIPTION: Draws a magenta circle centered at (362, 123) with radius 80.
; PLAN: r0=362(x), r1=123(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 123
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
