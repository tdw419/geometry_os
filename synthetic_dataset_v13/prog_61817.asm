; DESCRIPTION: Creates a green circular shape at (76, 163) with radius 75.
; PLAN: r0=76(x), r1=163(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 163
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
