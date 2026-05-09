; DESCRIPTION: Places a red line segment connecting (7, 50) to (163, 159).
; PLAN: r0=7(x1), r1=50(y1), r2=163(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 50
LDI r2, 163
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
