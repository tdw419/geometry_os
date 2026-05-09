; DESCRIPTION: Draws a orange circle centered at (303, 84) with radius 66.
; PLAN: r0=303(x), r1=84(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 84
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
