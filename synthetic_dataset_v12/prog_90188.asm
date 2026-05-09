; DESCRIPTION: Draws a orange circle centered at (338, 75) with radius 70.
; PLAN: r0=338(x), r1=75(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 75
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
