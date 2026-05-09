; DESCRIPTION: Draws a orange line from (247, 218) to (169, 98).
; PLAN: r0=247(x1), r1=218(y1), r2=169(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 218
LDI r2, 169
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
