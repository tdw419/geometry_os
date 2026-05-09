; DESCRIPTION: Draws a white circle centered at (80, 125) with radius 29.
; PLAN: r0=80(x), r1=125(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 125
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
