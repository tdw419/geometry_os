; DESCRIPTION: Draws a orange circle centered at (334, 134) with radius 38.
; PLAN: r0=334(x), r1=134(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 134
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
