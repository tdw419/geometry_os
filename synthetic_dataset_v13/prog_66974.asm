; DESCRIPTION: Draws a blue circle centered at (100, 124) with radius 23.
; PLAN: r0=100(x), r1=124(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 124
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
