; DESCRIPTION: Places a orange line segment connecting (15, 94) to (44, 75).
; PLAN: r0=15(x1), r1=94(y1), r2=44(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 94
LDI r2, 44
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
