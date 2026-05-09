; DESCRIPTION: Draws a magenta circle centered at (222, 213) with radius 17.
; PLAN: r0=222(x), r1=213(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 213
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
