; DESCRIPTION: Draws a orange circle centered at (85, 88) with radius 77.
; PLAN: r0=85(x), r1=88(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 88
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
