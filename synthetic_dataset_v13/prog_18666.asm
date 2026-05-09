; DESCRIPTION: Draws a orange line from (423, 62) to (99, 131).
; PLAN: r0=423(x1), r1=62(y1), r2=99(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 62
LDI r2, 99
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
