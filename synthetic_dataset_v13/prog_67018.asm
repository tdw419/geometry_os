; DESCRIPTION: Draws a white circle centered at (102, 125) with radius 70.
; PLAN: r0=102(x), r1=125(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 125
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
