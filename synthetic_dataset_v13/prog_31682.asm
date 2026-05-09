; DESCRIPTION: Creates a yellow circular shape at (432, 102) with radius 28.
; PLAN: r0=432(x), r1=102(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 102
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
