; DESCRIPTION: Draws a orange circle centered at (476, 13) with radius 11.
; PLAN: r0=476(x), r1=13(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 13
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
