; DESCRIPTION: Places a orange line segment connecting (440, 216) to (233, 185).
; PLAN: r0=440(x1), r1=216(y1), r2=233(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 216
LDI r2, 233
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
