; DESCRIPTION: Creates a yellow circular shape at (377, 198) with radius 33.
; PLAN: r0=377(x), r1=198(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 198
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
