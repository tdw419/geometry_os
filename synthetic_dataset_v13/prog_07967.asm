; DESCRIPTION: Places a red line segment connecting (118, 83) to (417, 48).
; PLAN: r0=118(x1), r1=83(y1), r2=417(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 83
LDI r2, 417
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
