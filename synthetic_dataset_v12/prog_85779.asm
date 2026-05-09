; DESCRIPTION: Draws a orange line from (313, 147) to (451, 31).
; PLAN: r0=313(x1), r1=147(y1), r2=451(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 147
LDI r2, 451
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
