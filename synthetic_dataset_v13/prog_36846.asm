; DESCRIPTION: Places a orange line segment connecting (203, 251) to (172, 66).
; PLAN: r0=203(x1), r1=251(y1), r2=172(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 251
LDI r2, 172
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
