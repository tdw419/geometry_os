; DESCRIPTION: Draws a orange circle centered at (212, 89) with radius 53.
; PLAN: r0=212(x), r1=89(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 89
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
