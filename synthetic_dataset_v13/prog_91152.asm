; DESCRIPTION: Creates a green circular shape at (244, 144) with radius 80.
; PLAN: r0=244(x), r1=144(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 144
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
