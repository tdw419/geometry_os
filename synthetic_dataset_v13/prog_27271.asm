; DESCRIPTION: Places a orange line segment connecting (97, 6) to (484, 46).
; PLAN: r0=97(x1), r1=6(y1), r2=484(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 6
LDI r2, 484
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
