; DESCRIPTION: Draws a orange line from (106, 26) to (149, 9).
; PLAN: r0=106(x1), r1=26(y1), r2=149(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 26
LDI r2, 149
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
