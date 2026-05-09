; DESCRIPTION: Places a orange line segment connecting (248, 59) to (9, 137).
; PLAN: r0=248(x1), r1=59(y1), r2=9(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 59
LDI r2, 9
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
