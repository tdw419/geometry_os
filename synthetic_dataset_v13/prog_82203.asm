; DESCRIPTION: Places a orange line segment connecting (11, 188) to (383, 61).
; PLAN: r0=11(x1), r1=188(y1), r2=383(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 188
LDI r2, 383
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
