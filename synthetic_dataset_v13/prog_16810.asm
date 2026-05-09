; DESCRIPTION: Draws a orange line from (123, 190) to (234, 97).
; PLAN: r0=123(x1), r1=190(y1), r2=234(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 190
LDI r2, 234
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
