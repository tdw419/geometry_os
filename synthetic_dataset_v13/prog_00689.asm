; DESCRIPTION: Creates a yellow circular shape at (402, 138) with radius 80.
; PLAN: r0=402(x), r1=138(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 138
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
