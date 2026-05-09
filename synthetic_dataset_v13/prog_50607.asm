; DESCRIPTION: Draws a white circle centered at (249, 88) with radius 65.
; PLAN: r0=249(x), r1=88(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 88
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
