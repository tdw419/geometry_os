; DESCRIPTION: Creates a green circular shape at (44, 123) with radius 29.
; PLAN: r0=44(x), r1=123(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 123
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
