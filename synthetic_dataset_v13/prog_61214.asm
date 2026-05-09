; DESCRIPTION: Draws a blue circle centered at (230, 219) with radius 11.
; PLAN: r0=230(x), r1=219(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 219
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
