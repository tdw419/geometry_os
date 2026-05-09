; DESCRIPTION: Places a red line segment connecting (109, 24) to (29, 203).
; PLAN: r0=109(x1), r1=24(y1), r2=29(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 29
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
