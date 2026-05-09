; DESCRIPTION: Draws a red line from (302, 13) to (99, 97).
; PLAN: r0=302(x1), r1=13(y1), r2=99(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 13
LDI r2, 99
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
