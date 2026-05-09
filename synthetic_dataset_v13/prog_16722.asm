; DESCRIPTION: Places a red line segment connecting (100, 36) to (498, 190).
; PLAN: r0=100(x1), r1=36(y1), r2=498(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 36
LDI r2, 498
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
