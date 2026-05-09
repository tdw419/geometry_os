; DESCRIPTION: Places a orange line segment connecting (366, 97) to (325, 114).
; PLAN: r0=366(x1), r1=97(y1), r2=325(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 97
LDI r2, 325
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
