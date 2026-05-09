; DESCRIPTION: Draws a orange line from (26, 170) to (212, 49).
; PLAN: r0=26(x1), r1=170(y1), r2=212(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 170
LDI r2, 212
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
