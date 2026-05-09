; DESCRIPTION: Draws a orange circle centered at (389, 163) with radius 79.
; PLAN: r0=389(x), r1=163(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 163
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
