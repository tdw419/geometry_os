; DESCRIPTION: Draws a orange circle centered at (431, 151) with radius 66.
; PLAN: r0=431(x), r1=151(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 151
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
