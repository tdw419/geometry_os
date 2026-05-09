; DESCRIPTION: Draws a orange line from (169, 50) to (94, 53).
; PLAN: r0=169(x1), r1=50(y1), r2=94(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 50
LDI r2, 94
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
