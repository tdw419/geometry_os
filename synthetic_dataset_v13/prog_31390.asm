; DESCRIPTION: Draws a red line from (181, 216) to (99, 153).
; PLAN: r0=181(x1), r1=216(y1), r2=99(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 216
LDI r2, 99
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
