; DESCRIPTION: Places a green line segment connecting (70, 172) to (364, 190).
; PLAN: r0=70(x1), r1=172(y1), r2=364(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 172
LDI r2, 364
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
