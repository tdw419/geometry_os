; DESCRIPTION: Creates a yellow circular shape at (484, 46) with radius 26.
; PLAN: r0=484(x), r1=46(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 46
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
