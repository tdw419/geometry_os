; DESCRIPTION: Places a orange line segment connecting (432, 3) to (510, 70).
; PLAN: r0=432(x1), r1=3(y1), r2=510(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 3
LDI r2, 510
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
