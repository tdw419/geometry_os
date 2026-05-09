; DESCRIPTION: Draws a orange line from (314, 80) to (17, 81).
; PLAN: r0=314(x1), r1=80(y1), r2=17(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 80
LDI r2, 17
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
