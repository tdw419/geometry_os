; DESCRIPTION: Creates a green circular shape at (83, 162) with radius 73.
; PLAN: r0=83(x), r1=162(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 162
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
