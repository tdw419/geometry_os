; DESCRIPTION: Places a red line segment connecting (153, 150) to (143, 118).
; PLAN: r0=153(x1), r1=150(y1), r2=143(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 150
LDI r2, 143
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
