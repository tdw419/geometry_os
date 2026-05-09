; DESCRIPTION: Draws a orange circle centered at (249, 45) with radius 37.
; PLAN: r0=249(x), r1=45(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 45
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
