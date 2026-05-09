; DESCRIPTION: Draws a orange line from (335, 78) to (145, 106).
; PLAN: r0=335(x1), r1=78(y1), r2=145(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 78
LDI r2, 145
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
