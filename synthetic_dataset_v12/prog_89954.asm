; DESCRIPTION: Draws a orange circle centered at (410, 170) with radius 39.
; PLAN: r0=410(x), r1=170(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 170
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
