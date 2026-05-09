; DESCRIPTION: Draws a magenta circle centered at (289, 108) with radius 74.
; PLAN: r0=289(x), r1=108(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 108
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
