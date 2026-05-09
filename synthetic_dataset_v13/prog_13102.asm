; DESCRIPTION: Places a red line segment connecting (216, 156) to (77, 240).
; PLAN: r0=216(x1), r1=156(y1), r2=77(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 156
LDI r2, 77
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
