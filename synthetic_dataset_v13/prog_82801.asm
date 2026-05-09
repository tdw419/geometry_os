; DESCRIPTION: Places a yellow line segment connecting (335, 190) to (9, 189).
; PLAN: r0=335(x1), r1=190(y1), r2=9(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 190
LDI r2, 9
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
