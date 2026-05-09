; DESCRIPTION: Draws a orange line from (200, 234) to (451, 80).
; PLAN: r0=200(x1), r1=234(y1), r2=451(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 234
LDI r2, 451
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
