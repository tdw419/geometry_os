; DESCRIPTION: Draws a white circle centered at (188, 160) with radius 66.
; PLAN: r0=188(x), r1=160(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 160
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
