; DESCRIPTION: Draws a white circle centered at (142, 144) with radius 75.
; PLAN: r0=142(x), r1=144(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 144
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
