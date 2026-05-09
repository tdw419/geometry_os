; DESCRIPTION: Creates a green circular shape at (296, 144) with radius 23.
; PLAN: r0=296(x), r1=144(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 144
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
