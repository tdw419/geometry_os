; DESCRIPTION: Creates a blue circular shape at (331, 137) with radius 63.
; PLAN: r0=331(x), r1=137(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 137
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
