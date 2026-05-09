; DESCRIPTION: Places a orange line segment connecting (49, 44) to (468, 68).
; PLAN: r0=49(x1), r1=44(y1), r2=468(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 44
LDI r2, 468
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
