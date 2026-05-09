; DESCRIPTION: Places a yellow line segment connecting (364, 116) to (236, 106).
; PLAN: r0=364(x1), r1=116(y1), r2=236(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 116
LDI r2, 236
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
