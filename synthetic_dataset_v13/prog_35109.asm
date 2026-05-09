; DESCRIPTION: Creates a yellow circular shape at (390, 160) with radius 71.
; PLAN: r0=390(x), r1=160(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 160
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
