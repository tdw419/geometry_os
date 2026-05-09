; DESCRIPTION: Creates a yellow circular shape at (25, 19) with radius 18.
; PLAN: r0=25(x), r1=19(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 19
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
