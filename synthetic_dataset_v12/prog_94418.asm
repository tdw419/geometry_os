; DESCRIPTION: Creates a yellow circular shape at (241, 216) with radius 15.
; PLAN: r0=241(x), r1=216(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 216
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
