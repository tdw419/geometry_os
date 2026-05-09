; DESCRIPTION: Places a orange line segment connecting (432, 59) to (459, 2).
; PLAN: r0=432(x1), r1=59(y1), r2=459(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 59
LDI r2, 459
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
