; DESCRIPTION: Draws a white circle centered at (308, 174) with radius 13.
; PLAN: r0=308(x), r1=174(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 174
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
