; DESCRIPTION: Draws a white circle centered at (308, 78) with radius 30.
; PLAN: r0=308(x), r1=78(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 78
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
