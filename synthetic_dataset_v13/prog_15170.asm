; DESCRIPTION: Places a red line segment connecting (194, 147) to (351, 190).
; PLAN: r0=194(x1), r1=147(y1), r2=351(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 147
LDI r2, 351
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
