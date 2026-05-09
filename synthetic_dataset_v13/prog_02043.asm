; DESCRIPTION: Places a orange circle of radius 43 at center (448, 145).
; PLAN: r0=448(x), r1=145(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 145
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
