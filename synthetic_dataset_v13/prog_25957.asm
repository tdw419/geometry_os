; DESCRIPTION: Creates a yellow circular shape at (88, 68) with radius 39.
; PLAN: r0=88(x), r1=68(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 68
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
