; DESCRIPTION: Places a orange line segment connecting (428, 240) to (405, 252).
; PLAN: r0=428(x1), r1=240(y1), r2=405(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 240
LDI r2, 405
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
