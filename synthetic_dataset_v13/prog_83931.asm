; DESCRIPTION: Places a red line segment connecting (136, 89) to (8, 199).
; PLAN: r0=136(x1), r1=89(y1), r2=8(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 89
LDI r2, 8
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
