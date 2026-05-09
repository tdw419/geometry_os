; DESCRIPTION: Draws a orange circle centered at (387, 185) with radius 13.
; PLAN: r0=387(x), r1=185(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 185
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
