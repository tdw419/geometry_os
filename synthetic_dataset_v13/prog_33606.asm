; DESCRIPTION: Draws a magenta circle centered at (412, 147) with radius 73.
; PLAN: r0=412(x), r1=147(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 147
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
