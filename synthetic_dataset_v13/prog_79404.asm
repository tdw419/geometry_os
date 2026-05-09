; DESCRIPTION: Places a red line segment connecting (121, 106) to (353, 85).
; PLAN: r0=121(x1), r1=106(y1), r2=353(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 106
LDI r2, 353
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
