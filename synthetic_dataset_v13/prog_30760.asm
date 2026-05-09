; DESCRIPTION: Draws a white circle centered at (155, 186) with radius 30.
; PLAN: r0=155(x), r1=186(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 186
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
