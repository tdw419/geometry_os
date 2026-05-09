; DESCRIPTION: Creates a green circular shape at (430, 161) with radius 24.
; PLAN: r0=430(x), r1=161(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 161
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
