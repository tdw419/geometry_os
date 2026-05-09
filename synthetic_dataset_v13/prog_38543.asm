; DESCRIPTION: Draws a magenta circle centered at (347, 203) with radius 52.
; PLAN: r0=347(x), r1=203(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 203
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
