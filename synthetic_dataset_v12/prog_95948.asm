; DESCRIPTION: Draws a orange circle centered at (433, 160) with radius 47.
; PLAN: r0=433(x), r1=160(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 160
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
