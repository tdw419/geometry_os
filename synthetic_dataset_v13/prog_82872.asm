; DESCRIPTION: Places a orange line segment connecting (423, 35) to (162, 249).
; PLAN: r0=423(x1), r1=35(y1), r2=162(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 35
LDI r2, 162
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
