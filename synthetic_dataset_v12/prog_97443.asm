; DESCRIPTION: Places a red line segment connecting (252, 136) to (181, 39).
; PLAN: r0=252(x1), r1=136(y1), r2=181(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 136
LDI r2, 181
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
