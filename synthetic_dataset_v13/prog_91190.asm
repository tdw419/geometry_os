; DESCRIPTION: Draws a white circle centered at (270, 144) with radius 69.
; PLAN: r0=270(x), r1=144(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 144
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
