; DESCRIPTION: Draws a white circle centered at (229, 169) with radius 78.
; PLAN: r0=229(x), r1=169(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 169
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
