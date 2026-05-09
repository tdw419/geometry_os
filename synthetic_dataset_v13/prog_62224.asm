; DESCRIPTION: Draws a orange line from (364, 62) to (132, 230).
; PLAN: r0=364(x1), r1=62(y1), r2=132(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 62
LDI r2, 132
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
