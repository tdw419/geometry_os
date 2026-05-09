; DESCRIPTION: Creates a black circular shape at (161, 144) with radius 52.
; PLAN: r0=161(x), r1=144(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 144
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
