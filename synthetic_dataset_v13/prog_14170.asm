; DESCRIPTION: Draws a white circle centered at (110, 232) with radius 19.
; PLAN: r0=110(x), r1=232(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 232
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
