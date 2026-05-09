; DESCRIPTION: Draws a white circle centered at (169, 117) with radius 66.
; PLAN: r0=169(x), r1=117(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 117
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
