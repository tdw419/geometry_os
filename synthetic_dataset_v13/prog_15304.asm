; DESCRIPTION: Draws a orange circle centered at (419, 81) with radius 69.
; PLAN: r0=419(x), r1=81(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 81
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
