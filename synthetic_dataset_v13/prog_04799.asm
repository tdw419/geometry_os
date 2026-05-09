; DESCRIPTION: Places a yellow line segment connecting (364, 190) to (132, 112).
; PLAN: r0=364(x1), r1=190(y1), r2=132(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 190
LDI r2, 132
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
