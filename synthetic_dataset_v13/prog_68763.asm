; DESCRIPTION: Draws a red line from (345, 133) to (302, 25).
; PLAN: r0=345(x1), r1=133(y1), r2=302(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 133
LDI r2, 302
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
