; DESCRIPTION: Draws a orange circle centered at (163, 175) with radius 73.
; PLAN: r0=163(x), r1=175(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 175
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
