; DESCRIPTION: Creates a green circular shape at (192, 55) with radius 45.
; PLAN: r0=192(x), r1=55(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 55
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
