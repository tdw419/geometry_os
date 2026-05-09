; DESCRIPTION: Creates a blue circular shape at (364, 53) with radius 13.
; PLAN: r0=364(x), r1=53(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 53
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
