; DESCRIPTION: Creates a green circular shape at (77, 170) with radius 63.
; PLAN: r0=77(x), r1=170(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 170
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
