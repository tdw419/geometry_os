; DESCRIPTION: Creates a yellow circular shape at (233, 122) with radius 77.
; PLAN: r0=233(x), r1=122(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 122
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
