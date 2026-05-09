; DESCRIPTION: Renders a orange line between points (349, 127) and (335, 9).
; PLAN: r0=349(x1), r1=127(y1), r2=335(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 127
LDI r2, 335
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
