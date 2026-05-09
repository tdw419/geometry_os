; DESCRIPTION: Draws a white circle centered at (157, 181) with radius 65.
; PLAN: r0=157(x), r1=181(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 181
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
