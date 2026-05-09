; DESCRIPTION: Creates a yellow circular shape at (258, 91) with radius 34.
; PLAN: r0=258(x), r1=91(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 91
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
