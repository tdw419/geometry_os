; DESCRIPTION: Draws a yellow circle centered at (219, 20) with radius 20.
; PLAN: r0=219(x), r1=20(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 20
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
