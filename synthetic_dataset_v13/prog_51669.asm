; DESCRIPTION: Creates a yellow circular shape at (138, 117) with radius 23.
; PLAN: r0=138(x), r1=117(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 117
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
