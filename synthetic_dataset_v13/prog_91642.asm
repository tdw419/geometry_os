; DESCRIPTION: Draws a orange line from (364, 169) to (123, 251).
; PLAN: r0=364(x1), r1=169(y1), r2=123(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 169
LDI r2, 123
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
