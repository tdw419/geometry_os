; DESCRIPTION: Draws a blue circle centered at (475, 121) with radius 20.
; PLAN: r0=475(x), r1=121(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 121
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
