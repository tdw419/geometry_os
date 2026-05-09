; DESCRIPTION: Places a red line segment connecting (306, 72) to (136, 118).
; PLAN: r0=306(x1), r1=72(y1), r2=136(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 72
LDI r2, 136
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
