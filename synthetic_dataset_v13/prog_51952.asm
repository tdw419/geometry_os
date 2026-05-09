; DESCRIPTION: Draws a orange line from (88, 44) to (236, 163).
; PLAN: r0=88(x1), r1=44(y1), r2=236(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 44
LDI r2, 236
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
