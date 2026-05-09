; DESCRIPTION: Draws a red line from (149, 94) to (377, 99).
; PLAN: r0=149(x1), r1=94(y1), r2=377(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 94
LDI r2, 377
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
