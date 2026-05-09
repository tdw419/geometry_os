; DESCRIPTION: Places a red line segment connecting (390, 121) to (140, 251).
; PLAN: r0=390(x1), r1=121(y1), r2=140(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 121
LDI r2, 140
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
