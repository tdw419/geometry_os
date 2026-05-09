; DESCRIPTION: Creates a green circular shape at (76, 170) with radius 53.
; PLAN: r0=76(x), r1=170(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 170
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
