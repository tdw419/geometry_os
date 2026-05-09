; DESCRIPTION: Creates a green circular shape at (164, 144) with radius 15.
; PLAN: r0=164(x), r1=144(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 144
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
