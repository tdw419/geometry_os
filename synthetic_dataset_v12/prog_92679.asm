; DESCRIPTION: Draws a orange line from (34, 133) to (131, 40).
; PLAN: r0=34(x1), r1=133(y1), r2=131(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 133
LDI r2, 131
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
