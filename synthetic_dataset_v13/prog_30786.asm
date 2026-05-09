; DESCRIPTION: Places a red line segment connecting (303, 217) to (106, 82).
; PLAN: r0=303(x1), r1=217(y1), r2=106(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 217
LDI r2, 106
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
