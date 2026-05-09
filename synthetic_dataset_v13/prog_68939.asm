; DESCRIPTION: Places a red line segment connecting (60, 83) to (413, 136).
; PLAN: r0=60(x1), r1=83(y1), r2=413(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 83
LDI r2, 413
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
