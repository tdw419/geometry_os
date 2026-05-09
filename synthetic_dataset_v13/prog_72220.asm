; DESCRIPTION: Creates a yellow circular shape at (430, 105) with radius 21.
; PLAN: r0=430(x), r1=105(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 105
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
