; DESCRIPTION: Places a red line segment connecting (363, 204) to (418, 190).
; PLAN: r0=363(x1), r1=204(y1), r2=418(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 204
LDI r2, 418
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
