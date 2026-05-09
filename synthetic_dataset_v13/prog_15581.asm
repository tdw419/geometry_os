; DESCRIPTION: Creates a yellow circular shape at (409, 72) with radius 11.
; PLAN: r0=409(x), r1=72(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 72
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
