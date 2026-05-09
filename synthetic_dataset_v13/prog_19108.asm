; DESCRIPTION: Draws a orange line from (302, 40) to (153, 114).
; PLAN: r0=302(x1), r1=40(y1), r2=153(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 40
LDI r2, 153
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
