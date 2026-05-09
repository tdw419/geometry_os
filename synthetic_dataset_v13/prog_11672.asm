; DESCRIPTION: Creates a yellow circular shape at (211, 155) with radius 68.
; PLAN: r0=211(x), r1=155(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 155
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
