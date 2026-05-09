; DESCRIPTION: Places a orange line segment connecting (293, 154) to (324, 122).
; PLAN: r0=293(x1), r1=154(y1), r2=324(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 154
LDI r2, 324
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
