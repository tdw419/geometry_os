; DESCRIPTION: Creates a green circular shape at (409, 96) with radius 63.
; PLAN: r0=409(x), r1=96(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 96
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
