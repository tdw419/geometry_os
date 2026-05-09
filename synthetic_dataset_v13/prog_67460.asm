; DESCRIPTION: Creates a green circular shape at (62, 161) with radius 56.
; PLAN: r0=62(x), r1=161(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 161
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
