; DESCRIPTION: Draws a orange circle centered at (84, 109) with radius 77.
; PLAN: r0=84(x), r1=109(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 109
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
