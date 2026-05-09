; DESCRIPTION: Places a purple line segment connecting (253, 34) to (364, 96).
; PLAN: r0=253(x1), r1=34(y1), r2=364(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 34
LDI r2, 364
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
