; DESCRIPTION: Draws a white circle centered at (385, 145) with radius 20.
; PLAN: r0=385(x), r1=145(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 145
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
