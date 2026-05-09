; DESCRIPTION: Draws a magenta circle centered at (347, 95) with radius 58.
; PLAN: r0=347(x), r1=95(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 95
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
