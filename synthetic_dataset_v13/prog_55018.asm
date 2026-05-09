; DESCRIPTION: Creates a yellow circular shape at (52, 84) with radius 33.
; PLAN: r0=52(x), r1=84(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 84
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
