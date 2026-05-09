; DESCRIPTION: Draws a white circle centered at (429, 158) with radius 34.
; PLAN: r0=429(x), r1=158(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 158
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
