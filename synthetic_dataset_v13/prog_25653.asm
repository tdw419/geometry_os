; DESCRIPTION: Draws a orange circle centered at (419, 161) with radius 58.
; PLAN: r0=419(x), r1=161(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 161
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
