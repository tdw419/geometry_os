; DESCRIPTION: Draws a white circle centered at (155, 180) with radius 61.
; PLAN: r0=155(x), r1=180(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 180
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
