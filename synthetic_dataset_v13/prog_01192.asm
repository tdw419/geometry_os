; DESCRIPTION: Creates a green circular shape at (337, 170) with radius 62.
; PLAN: r0=337(x), r1=170(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 170
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
