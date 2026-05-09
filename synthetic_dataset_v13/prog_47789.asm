; DESCRIPTION: Places a red line segment connecting (190, 204) to (348, 1).
; PLAN: r0=190(x1), r1=204(y1), r2=348(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 204
LDI r2, 348
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
