; DESCRIPTION: Creates a yellow circular shape at (334, 77) with radius 70.
; PLAN: r0=334(x), r1=77(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 77
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
