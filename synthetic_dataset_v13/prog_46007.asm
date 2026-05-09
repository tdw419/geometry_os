; DESCRIPTION: Places a black line segment connecting (247, 190) to (116, 245).
; PLAN: r0=247(x1), r1=190(y1), r2=116(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 190
LDI r2, 116
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
