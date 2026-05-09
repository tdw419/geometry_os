; DESCRIPTION: Places a red line segment connecting (7, 94) to (62, 167).
; PLAN: r0=7(x1), r1=94(y1), r2=62(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 94
LDI r2, 62
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
