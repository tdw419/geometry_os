; DESCRIPTION: Draws a orange line from (506, 252) to (490, 244).
; PLAN: r0=506(x1), r1=252(y1), r2=490(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 252
LDI r2, 490
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
