; DESCRIPTION: Draws a orange line from (4, 123) to (347, 163).
; PLAN: r0=4(x1), r1=123(y1), r2=347(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 123
LDI r2, 347
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
