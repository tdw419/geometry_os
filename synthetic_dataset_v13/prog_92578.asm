; DESCRIPTION: Creates a yellow circular shape at (496, 57) with radius 11.
; PLAN: r0=496(x), r1=57(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 496
LDI r1, 57
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
