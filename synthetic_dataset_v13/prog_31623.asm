; DESCRIPTION: Places a orange line segment connecting (422, 185) to (364, 23).
; PLAN: r0=422(x1), r1=185(y1), r2=364(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 185
LDI r2, 364
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
