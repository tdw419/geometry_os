; DESCRIPTION: Draws a orange circle centered at (422, 79) with radius 56.
; PLAN: r0=422(x), r1=79(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 79
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
