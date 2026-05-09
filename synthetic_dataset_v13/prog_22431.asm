; DESCRIPTION: Draws a orange line from (169, 122) to (459, 30).
; PLAN: r0=169(x1), r1=122(y1), r2=459(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 122
LDI r2, 459
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
