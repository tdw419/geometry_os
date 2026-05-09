; DESCRIPTION: Draws a white circle centered at (121, 58) with radius 51.
; PLAN: r0=121(x), r1=58(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 58
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
