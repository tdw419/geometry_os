; DESCRIPTION: Places a red line segment connecting (190, 15) to (433, 11).
; PLAN: r0=190(x1), r1=15(y1), r2=433(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 15
LDI r2, 433
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
