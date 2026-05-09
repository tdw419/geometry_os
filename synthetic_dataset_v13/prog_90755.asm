; DESCRIPTION: Creates a green circular shape at (421, 189) with radius 14.
; PLAN: r0=421(x), r1=189(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 189
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
