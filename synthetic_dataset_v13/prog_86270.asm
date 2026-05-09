; DESCRIPTION: Draws a blue circle centered at (428, 35) with radius 33.
; PLAN: r0=428(x), r1=35(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 35
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
