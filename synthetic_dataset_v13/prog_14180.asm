; DESCRIPTION: Places a red line segment connecting (486, 115) to (192, 251).
; PLAN: r0=486(x1), r1=115(y1), r2=192(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 115
LDI r2, 192
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
