; DESCRIPTION: Places a red line segment connecting (424, 119) to (489, 177).
; PLAN: r0=424(x1), r1=119(y1), r2=489(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 119
LDI r2, 489
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
