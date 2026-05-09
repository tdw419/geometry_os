; DESCRIPTION: Creates a yellow circular shape at (125, 68) with radius 36.
; PLAN: r0=125(x), r1=68(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 68
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
