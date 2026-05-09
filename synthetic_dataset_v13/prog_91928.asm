; DESCRIPTION: Creates a yellow circular shape at (291, 122) with radius 75.
; PLAN: r0=291(x), r1=122(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 122
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
