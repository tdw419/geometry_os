; DESCRIPTION: Draws a orange circle centered at (77, 125) with radius 63.
; PLAN: r0=77(x), r1=125(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 125
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
