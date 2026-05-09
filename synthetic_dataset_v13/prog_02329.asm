; DESCRIPTION: Places a yellow line segment connecting (190, 116) to (344, 106).
; PLAN: r0=190(x1), r1=116(y1), r2=344(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 116
LDI r2, 344
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
