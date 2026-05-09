; DESCRIPTION: Creates a green circular shape at (220, 137) with radius 62.
; PLAN: r0=220(x), r1=137(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 137
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
