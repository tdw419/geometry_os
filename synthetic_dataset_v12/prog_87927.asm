; DESCRIPTION: Draws a magenta circle centered at (315, 175) with radius 44.
; PLAN: r0=315(x), r1=175(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 175
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
