; DESCRIPTION: Draws a blue circle centered at (361, 75) with radius 70.
; PLAN: r0=361(x), r1=75(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 75
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
