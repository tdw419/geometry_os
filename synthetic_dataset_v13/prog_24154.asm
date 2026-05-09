; DESCRIPTION: Draws a green line from (54, 100) to (302, 97).
; PLAN: r0=54(x1), r1=100(y1), r2=302(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 100
LDI r2, 302
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
