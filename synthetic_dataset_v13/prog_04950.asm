; DESCRIPTION: Places a orange line segment connecting (427, 143) to (474, 105).
; PLAN: r0=427(x1), r1=143(y1), r2=474(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 143
LDI r2, 474
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
