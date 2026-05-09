; DESCRIPTION: Draws a white circle centered at (314, 153) with radius 51.
; PLAN: r0=314(x), r1=153(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 153
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
