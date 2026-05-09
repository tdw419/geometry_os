; DESCRIPTION: Creates a green circular shape at (123, 99) with radius 67.
; PLAN: r0=123(x), r1=99(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 99
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
