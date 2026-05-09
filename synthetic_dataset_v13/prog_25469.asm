; DESCRIPTION: Creates a yellow circular shape at (383, 66) with radius 62.
; PLAN: r0=383(x), r1=66(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 66
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
