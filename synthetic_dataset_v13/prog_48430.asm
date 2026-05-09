; DESCRIPTION: Draws a cyan circle centered at (88, 170) with radius 44.
; PLAN: r0=88(x), r1=170(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 170
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
