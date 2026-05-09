; DESCRIPTION: Places a orange line segment connecting (183, 147) to (45, 157).
; PLAN: r0=183(x1), r1=147(y1), r2=45(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 147
LDI r2, 45
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
