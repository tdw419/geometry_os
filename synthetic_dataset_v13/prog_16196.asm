; DESCRIPTION: Draws a white circle centered at (370, 85) with radius 13.
; PLAN: r0=370(x), r1=85(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 85
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
