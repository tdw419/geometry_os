; DESCRIPTION: Places a red line segment connecting (79, 140) to (378, 216).
; PLAN: r0=79(x1), r1=140(y1), r2=378(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 140
LDI r2, 378
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
