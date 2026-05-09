; DESCRIPTION: Places a red line segment connecting (390, 115) to (62, 146).
; PLAN: r0=390(x1), r1=115(y1), r2=62(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 115
LDI r2, 62
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
