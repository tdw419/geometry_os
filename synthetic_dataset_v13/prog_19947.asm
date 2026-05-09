; DESCRIPTION: Places a orange line segment connecting (222, 132) to (315, 33).
; PLAN: r0=222(x1), r1=132(y1), r2=315(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 132
LDI r2, 315
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
