; DESCRIPTION: Draws a orange line from (302, 144) to (216, 72).
; PLAN: r0=302(x1), r1=144(y1), r2=216(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 144
LDI r2, 216
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
