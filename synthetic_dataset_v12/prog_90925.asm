; DESCRIPTION: Creates a green circular shape at (130, 184) with radius 56.
; PLAN: r0=130(x), r1=184(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 184
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
