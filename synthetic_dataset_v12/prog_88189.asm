; DESCRIPTION: Draws a orange circle centered at (430, 100) with radius 70.
; PLAN: r0=430(x), r1=100(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 100
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
