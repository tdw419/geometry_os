; DESCRIPTION: Places a red line segment connecting (133, 170) to (153, 185).
; PLAN: r0=133(x1), r1=170(y1), r2=153(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 170
LDI r2, 153
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
