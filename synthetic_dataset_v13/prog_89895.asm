; DESCRIPTION: Draws a white line from (451, 100) to (147, 188).
; PLAN: r0=451(x1), r1=100(y1), r2=147(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 100
LDI r2, 147
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
