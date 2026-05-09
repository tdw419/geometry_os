; DESCRIPTION: Creates a yellow circular shape at (109, 99) with radius 14.
; PLAN: r0=109(x), r1=99(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 99
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
