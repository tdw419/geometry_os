; DESCRIPTION: Places a red line segment connecting (112, 102) to (174, 118).
; PLAN: r0=112(x1), r1=102(y1), r2=174(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 102
LDI r2, 174
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
