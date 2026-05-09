; DESCRIPTION: Draws a orange line from (431, 122) to (34, 170).
; PLAN: r0=431(x1), r1=122(y1), r2=34(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 122
LDI r2, 34
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
