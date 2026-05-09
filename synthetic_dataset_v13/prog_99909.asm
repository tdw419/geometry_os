; DESCRIPTION: Creates a green circular shape at (110, 115) with radius 26.
; PLAN: r0=110(x), r1=115(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 115
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
