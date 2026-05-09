; DESCRIPTION: Draws a orange circle centered at (387, 134) with radius 56.
; PLAN: r0=387(x), r1=134(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 134
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
