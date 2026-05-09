; DESCRIPTION: Places a red line segment connecting (302, 101) to (47, 205).
; PLAN: r0=302(x1), r1=101(y1), r2=47(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 101
LDI r2, 47
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
