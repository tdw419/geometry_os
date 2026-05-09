; DESCRIPTION: Creates a yellow circular shape at (78, 99) with radius 78.
; PLAN: r0=78(x), r1=99(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 99
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
