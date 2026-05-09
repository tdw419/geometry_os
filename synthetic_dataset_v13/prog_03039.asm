; DESCRIPTION: Draws a white circle centered at (134, 79) with radius 54.
; PLAN: r0=134(x), r1=79(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 79
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
