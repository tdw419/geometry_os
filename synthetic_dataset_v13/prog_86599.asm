; DESCRIPTION: Draws a orange circle centered at (118, 175) with radius 44.
; PLAN: r0=118(x), r1=175(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 175
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
