; DESCRIPTION: Draws a orange circle centered at (341, 145) with radius 56.
; PLAN: r0=341(x), r1=145(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 145
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
