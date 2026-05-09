; DESCRIPTION: Creates a cyan circular shape at (292, 170) with radius 78.
; PLAN: r0=292(x), r1=170(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 170
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
