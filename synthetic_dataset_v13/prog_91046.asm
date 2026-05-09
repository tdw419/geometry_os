; DESCRIPTION: Draws a orange line from (18, 85) to (414, 201).
; PLAN: r0=18(x1), r1=85(y1), r2=414(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 85
LDI r2, 414
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
