; DESCRIPTION: Draws a orange line from (411, 53) to (124, 99).
; PLAN: r0=411(x1), r1=53(y1), r2=124(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 53
LDI r2, 124
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
