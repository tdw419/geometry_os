; DESCRIPTION: Draws a magenta circle centered at (424, 222) with radius 12.
; PLAN: r0=424(x), r1=222(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 222
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
