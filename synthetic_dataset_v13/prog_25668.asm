; DESCRIPTION: Draws a orange line from (385, 155) to (72, 9).
; PLAN: r0=385(x1), r1=155(y1), r2=72(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 155
LDI r2, 72
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
