; DESCRIPTION: Draws a magenta circle centered at (178, 222) with radius 17.
; PLAN: r0=178(x), r1=222(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 222
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
