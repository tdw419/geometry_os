; DESCRIPTION: Places a purple line segment connecting (344, 190) to (405, 3).
; PLAN: r0=344(x1), r1=190(y1), r2=405(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 190
LDI r2, 405
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
