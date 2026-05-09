; DESCRIPTION: Creates a blue circular shape at (469, 91) with radius 37.
; PLAN: r0=469(x), r1=91(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 91
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
