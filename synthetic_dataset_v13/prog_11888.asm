; DESCRIPTION: Places a orange line segment connecting (29, 234) to (316, 201).
; PLAN: r0=29(x1), r1=234(y1), r2=316(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 234
LDI r2, 316
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
