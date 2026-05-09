; DESCRIPTION: Creates a yellow circular shape at (407, 216) with radius 38.
; PLAN: r0=407(x), r1=216(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 216
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
