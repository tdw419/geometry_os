; DESCRIPTION: Creates a orange circular shape at (119, 115) with radius 52.
; PLAN: r0=119(x), r1=115(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 115
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
