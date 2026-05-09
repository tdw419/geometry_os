; DESCRIPTION: Draws a orange line from (414, 232) to (360, 155).
; PLAN: r0=414(x1), r1=232(y1), r2=360(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 232
LDI r2, 360
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
