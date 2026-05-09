; DESCRIPTION: Places a red line segment connecting (332, 190) to (112, 3).
; PLAN: r0=332(x1), r1=190(y1), r2=112(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 190
LDI r2, 112
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
