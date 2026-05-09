; DESCRIPTION: Places a red line segment connecting (413, 182) to (31, 248).
; PLAN: r0=413(x1), r1=182(y1), r2=31(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 182
LDI r2, 31
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
