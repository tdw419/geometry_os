; DESCRIPTION: Creates a black circular shape at (184, 91) with radius 35.
; PLAN: r0=184(x), r1=91(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 91
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
