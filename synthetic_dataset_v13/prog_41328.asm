; DESCRIPTION: Draws a magenta circle centered at (494, 35) with radius 14.
; PLAN: r0=494(x), r1=35(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 494
LDI r1, 35
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
