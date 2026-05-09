; DESCRIPTION: Places a red line segment connecting (258, 178) to (86, 158).
; PLAN: r0=258(x1), r1=178(y1), r2=86(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 178
LDI r2, 86
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
