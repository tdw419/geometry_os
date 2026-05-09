; DESCRIPTION: Draws a orange line from (452, 223) to (282, 201).
; PLAN: r0=452(x1), r1=223(y1), r2=282(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 223
LDI r2, 282
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
