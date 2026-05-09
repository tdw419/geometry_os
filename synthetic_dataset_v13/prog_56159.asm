; DESCRIPTION: Creates a black circular shape at (414, 141) with radius 26.
; PLAN: r0=414(x), r1=141(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 141
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
