; DESCRIPTION: Places a red line segment connecting (232, 182) to (193, 200).
; PLAN: r0=232(x1), r1=182(y1), r2=193(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 182
LDI r2, 193
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
