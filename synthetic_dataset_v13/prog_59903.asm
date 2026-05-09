; DESCRIPTION: Draws a orange circle centered at (52, 84) with radius 52.
; PLAN: r0=52(x), r1=84(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 84
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
