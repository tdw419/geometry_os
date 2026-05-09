; DESCRIPTION: Draws a yellow circle centered at (200, 56) with radius 20.
; PLAN: r0=200(x), r1=56(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 56
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
