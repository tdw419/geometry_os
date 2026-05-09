; DESCRIPTION: Creates a black circular shape at (170, 156) with radius 80.
; PLAN: r0=170(x), r1=156(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 156
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
