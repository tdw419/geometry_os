; DESCRIPTION: Creates a black circular shape at (102, 67) with radius 54.
; PLAN: r0=102(x), r1=67(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 67
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
