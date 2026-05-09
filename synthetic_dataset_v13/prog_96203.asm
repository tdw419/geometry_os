; DESCRIPTION: Creates a black circular shape at (364, 65) with radius 10.
; PLAN: r0=364(x), r1=65(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 65
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
