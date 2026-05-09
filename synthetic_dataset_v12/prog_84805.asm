; DESCRIPTION: Creates a yellow circular shape at (123, 145) with radius 74.
; PLAN: r0=123(x), r1=145(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 145
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
