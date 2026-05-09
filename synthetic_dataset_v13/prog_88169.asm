; DESCRIPTION: Draws a white circle centered at (200, 137) with radius 73.
; PLAN: r0=200(x), r1=137(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 137
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
