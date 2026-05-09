; DESCRIPTION: Creates a yellow circular shape at (85, 114) with radius 53.
; PLAN: r0=85(x), r1=114(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 114
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
