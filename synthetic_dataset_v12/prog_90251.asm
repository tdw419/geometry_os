; DESCRIPTION: Creates a green circular shape at (78, 189) with radius 60.
; PLAN: r0=78(x), r1=189(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 189
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
