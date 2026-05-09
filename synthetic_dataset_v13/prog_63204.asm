; DESCRIPTION: Draws a orange line from (250, 53) to (301, 140).
; PLAN: r0=250(x1), r1=53(y1), r2=301(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 53
LDI r2, 301
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
