; DESCRIPTION: Places a red line segment connecting (96, 216) to (178, 118).
; PLAN: r0=96(x1), r1=216(y1), r2=178(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 216
LDI r2, 178
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
