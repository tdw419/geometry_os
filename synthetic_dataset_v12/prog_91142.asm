; DESCRIPTION: Draws a orange line from (88, 81) to (325, 102).
; PLAN: r0=88(x1), r1=81(y1), r2=325(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 81
LDI r2, 325
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
