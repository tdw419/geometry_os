; DESCRIPTION: Draws a white circle centered at (84, 141) with radius 51.
; PLAN: r0=84(x), r1=141(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 141
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
