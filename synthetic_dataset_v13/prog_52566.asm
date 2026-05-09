; DESCRIPTION: Creates a green circular shape at (55, 117) with radius 11.
; PLAN: r0=55(x), r1=117(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 117
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
