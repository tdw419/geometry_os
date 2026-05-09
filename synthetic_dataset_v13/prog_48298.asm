; DESCRIPTION: Places a orange line segment connecting (162, 200) to (412, 79).
; PLAN: r0=162(x1), r1=200(y1), r2=412(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 200
LDI r2, 412
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
