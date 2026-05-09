; DESCRIPTION: Draws a white circle centered at (236, 181) with radius 45.
; PLAN: r0=236(x), r1=181(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 181
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
