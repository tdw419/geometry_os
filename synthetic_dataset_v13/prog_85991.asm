; DESCRIPTION: Draws a blue circle centered at (428, 119) with radius 51.
; PLAN: r0=428(x), r1=119(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 119
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
