; DESCRIPTION: Creates a green circular shape at (164, 117) with radius 33.
; PLAN: r0=164(x), r1=117(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 117
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
