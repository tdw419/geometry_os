; DESCRIPTION: Creates a green circular shape at (240, 137) with radius 80.
; PLAN: r0=240(x), r1=137(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 137
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
