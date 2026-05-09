; DESCRIPTION: Creates a green circular shape at (478, 38) with radius 24.
; PLAN: r0=478(x), r1=38(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 38
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
