; DESCRIPTION: Creates a black circular shape at (423, 152) with radius 26.
; PLAN: r0=423(x), r1=152(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 152
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
