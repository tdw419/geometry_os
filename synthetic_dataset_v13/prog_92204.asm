; DESCRIPTION: Places a red line segment connecting (124, 24) to (190, 186).
; PLAN: r0=124(x1), r1=24(y1), r2=190(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 24
LDI r2, 190
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
