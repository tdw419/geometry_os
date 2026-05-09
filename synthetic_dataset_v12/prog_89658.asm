; DESCRIPTION: Creates a green circular shape at (244, 71) with radius 28.
; PLAN: r0=244(x), r1=71(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 71
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
