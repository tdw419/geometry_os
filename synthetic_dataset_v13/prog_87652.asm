; DESCRIPTION: Places a orange line segment connecting (440, 207) to (428, 85).
; PLAN: r0=440(x1), r1=207(y1), r2=428(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 207
LDI r2, 428
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
