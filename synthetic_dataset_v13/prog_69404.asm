; DESCRIPTION: Draws a orange line from (12, 123) to (331, 106).
; PLAN: r0=12(x1), r1=123(y1), r2=331(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 123
LDI r2, 331
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
