; DESCRIPTION: Places a orange line segment connecting (420, 10) to (430, 54).
; PLAN: r0=420(x1), r1=10(y1), r2=430(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 10
LDI r2, 430
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
