; DESCRIPTION: Creates a green circular shape at (129, 149) with radius 45.
; PLAN: r0=129(x), r1=149(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 149
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
