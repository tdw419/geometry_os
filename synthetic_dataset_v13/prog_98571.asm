; DESCRIPTION: Places a orange line segment connecting (135, 216) to (226, 159).
; PLAN: r0=135(x1), r1=216(y1), r2=226(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 216
LDI r2, 226
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
