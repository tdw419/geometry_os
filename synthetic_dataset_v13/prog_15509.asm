; DESCRIPTION: Draws a orange line from (302, 109) to (381, 109).
; PLAN: r0=302(x1), r1=109(y1), r2=381(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 109
LDI r2, 381
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
