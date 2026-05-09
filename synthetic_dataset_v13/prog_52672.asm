; DESCRIPTION: Creates a green circular shape at (89, 60) with radius 53.
; PLAN: r0=89(x), r1=60(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 60
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
