; DESCRIPTION: Places a red line segment connecting (0, 14) to (119, 202).
; PLAN: r0=0(x1), r1=14(y1), r2=119(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 14
LDI r2, 119
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
