; DESCRIPTION: Draws a blue circle centered at (226, 115) with radius 45.
; PLAN: r0=226(x), r1=115(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 115
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
