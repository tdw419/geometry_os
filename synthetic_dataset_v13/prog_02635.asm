; DESCRIPTION: Creates a yellow circular shape at (432, 94) with radius 71.
; PLAN: r0=432(x), r1=94(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 94
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
