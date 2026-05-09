; DESCRIPTION: Draws a white circle centered at (423, 61) with radius 49.
; PLAN: r0=423(x), r1=61(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 61
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
