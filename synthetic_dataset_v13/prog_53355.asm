; DESCRIPTION: Creates a yellow circular shape at (67, 123) with radius 64.
; PLAN: r0=67(x), r1=123(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 123
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
