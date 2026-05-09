; DESCRIPTION: Places a orange line segment connecting (117, 232) to (50, 162).
; PLAN: r0=117(x1), r1=232(y1), r2=50(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 232
LDI r2, 50
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
