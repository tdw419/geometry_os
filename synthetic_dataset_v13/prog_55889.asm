; DESCRIPTION: Draws a orange circle centered at (464, 23) with radius 23.
; PLAN: r0=464(x), r1=23(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 23
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
