; DESCRIPTION: Draws a orange line from (303, 179) to (390, 222).
; PLAN: r0=303(x1), r1=179(y1), r2=390(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 179
LDI r2, 390
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
