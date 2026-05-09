; DESCRIPTION: Draws a orange circle centered at (155, 134) with radius 71.
; PLAN: r0=155(x), r1=134(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 134
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
