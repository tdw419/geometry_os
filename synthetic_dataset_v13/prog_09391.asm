; DESCRIPTION: Creates a yellow circular shape at (254, 84) with radius 18.
; PLAN: r0=254(x), r1=84(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 84
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
