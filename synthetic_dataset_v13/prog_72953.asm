; DESCRIPTION: Draws a orange circle centered at (275, 84) with radius 77.
; PLAN: r0=275(x), r1=84(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 84
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
