; DESCRIPTION: Places a orange line segment connecting (485, 112) to (411, 97).
; PLAN: r0=485(x1), r1=112(y1), r2=411(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 112
LDI r2, 411
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
