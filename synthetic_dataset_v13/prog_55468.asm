; DESCRIPTION: Draws a orange line from (55, 182) to (136, 77).
; PLAN: r0=55(x1), r1=182(y1), r2=136(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 182
LDI r2, 136
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
