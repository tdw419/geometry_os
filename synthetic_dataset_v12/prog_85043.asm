; DESCRIPTION: Draws a magenta circle centered at (309, 104) with radius 53.
; PLAN: r0=309(x), r1=104(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 104
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
