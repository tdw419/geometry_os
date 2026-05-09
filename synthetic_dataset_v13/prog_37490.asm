; DESCRIPTION: Draws a orange circle centered at (494, 198) with radius 15.
; PLAN: r0=494(x), r1=198(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 494
LDI r1, 198
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
