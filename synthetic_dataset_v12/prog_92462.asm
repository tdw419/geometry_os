; DESCRIPTION: Draws a orange line from (511, 15) to (335, 22).
; PLAN: r0=511(x1), r1=15(y1), r2=335(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 15
LDI r2, 335
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
