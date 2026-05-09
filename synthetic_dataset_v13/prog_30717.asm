; DESCRIPTION: Creates a green circular shape at (140, 158) with radius 73.
; PLAN: r0=140(x), r1=158(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 158
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
