; DESCRIPTION: Draws a orange circle centered at (66, 170) with radius 47.
; PLAN: r0=66(x), r1=170(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 170
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
