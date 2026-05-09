; DESCRIPTION: Creates a yellow circular shape at (339, 72) with radius 66.
; PLAN: r0=339(x), r1=72(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 72
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
