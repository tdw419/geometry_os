; DESCRIPTION: Places a red line segment connecting (172, 94) to (155, 25).
; PLAN: r0=172(x1), r1=94(y1), r2=155(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 94
LDI r2, 155
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
