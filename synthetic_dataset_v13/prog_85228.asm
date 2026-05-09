; DESCRIPTION: Places a red line segment connecting (163, 95) to (303, 25).
; PLAN: r0=163(x1), r1=95(y1), r2=303(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 95
LDI r2, 303
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
