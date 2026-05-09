; DESCRIPTION: Places a orange line segment connecting (364, 163) to (427, 207).
; PLAN: r0=364(x1), r1=163(y1), r2=427(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 163
LDI r2, 427
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
