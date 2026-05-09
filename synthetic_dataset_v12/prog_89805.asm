; DESCRIPTION: Places a orange line segment connecting (106, 241) to (388, 9).
; PLAN: r0=106(x1), r1=241(y1), r2=388(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 241
LDI r2, 388
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
