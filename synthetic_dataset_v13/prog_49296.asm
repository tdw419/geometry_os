; DESCRIPTION: Creates a green circular shape at (102, 105) with radius 55.
; PLAN: r0=102(x), r1=105(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 105
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
