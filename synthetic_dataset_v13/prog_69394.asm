; DESCRIPTION: Draws a orange line from (101, 169) to (302, 182).
; PLAN: r0=101(x1), r1=169(y1), r2=302(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 169
LDI r2, 302
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
