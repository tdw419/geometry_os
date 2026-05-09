; DESCRIPTION: Creates a black circular shape at (133, 97) with radius 58.
; PLAN: r0=133(x), r1=97(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 97
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
