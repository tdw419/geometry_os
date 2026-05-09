; DESCRIPTION: Draws a blue circle centered at (219, 124) with radius 43.
; PLAN: r0=219(x), r1=124(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 124
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
