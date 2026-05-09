; DESCRIPTION: Creates a black circular shape at (290, 140) with radius 45.
; PLAN: r0=290(x), r1=140(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 140
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
