; DESCRIPTION: Draws a yellow circle centered at (219, 139) with radius 74.
; PLAN: r0=219(x), r1=139(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 139
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
