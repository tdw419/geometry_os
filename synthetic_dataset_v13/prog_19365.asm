; DESCRIPTION: Draws a orange line from (280, 169) to (80, 62).
; PLAN: r0=280(x1), r1=169(y1), r2=80(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 169
LDI r2, 80
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
