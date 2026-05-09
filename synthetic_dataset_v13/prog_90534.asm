; DESCRIPTION: Draws a orange circle centered at (308, 43) with radius 29.
; PLAN: r0=308(x), r1=43(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 43
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
