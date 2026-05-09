; DESCRIPTION: Creates a black circular shape at (94, 101) with radius 54.
; PLAN: r0=94(x), r1=101(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 101
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
