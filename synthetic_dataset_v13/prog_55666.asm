; DESCRIPTION: Places a orange line segment connecting (364, 148) to (148, 155).
; PLAN: r0=364(x1), r1=148(y1), r2=148(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 148
LDI r2, 148
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
