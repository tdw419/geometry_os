; DESCRIPTION: Draws a magenta circle centered at (408, 141) with radius 17.
; PLAN: r0=408(x), r1=141(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 141
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
