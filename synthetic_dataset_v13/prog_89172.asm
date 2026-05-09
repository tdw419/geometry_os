; DESCRIPTION: Creates a green circular shape at (437, 105) with radius 29.
; PLAN: r0=437(x), r1=105(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 105
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
