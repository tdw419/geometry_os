; DESCRIPTION: Places a orange line segment connecting (194, 48) to (427, 133).
; PLAN: r0=194(x1), r1=48(y1), r2=427(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 48
LDI r2, 427
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
