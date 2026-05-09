; DESCRIPTION: Places a orange line segment connecting (427, 39) to (419, 68).
; PLAN: r0=427(x1), r1=39(y1), r2=419(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 39
LDI r2, 419
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
