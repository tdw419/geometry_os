; DESCRIPTION: Draws a purple circle centered at (125, 212) with radius 35.
; PLAN: r0=125(x), r1=212(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 212
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
