; DESCRIPTION: Creates a green circular shape at (72, 123) with radius 23.
; PLAN: r0=72(x), r1=123(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 123
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
