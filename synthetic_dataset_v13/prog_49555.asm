; DESCRIPTION: Draws a orange line from (89, 87) to (335, 147).
; PLAN: r0=89(x1), r1=87(y1), r2=335(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 87
LDI r2, 335
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
