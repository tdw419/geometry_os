; DESCRIPTION: Draws a magenta circle centered at (277, 106) with radius 53.
; PLAN: r0=277(x), r1=106(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 106
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
