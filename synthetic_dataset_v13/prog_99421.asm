; DESCRIPTION: Creates a yellow circular shape at (145, 115) with radius 14.
; PLAN: r0=145(x), r1=115(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 115
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
