; DESCRIPTION: Places a purple line segment connecting (141, 139) to (144, 142).
; PLAN: r0=141(x1), r1=139(y1), r2=144(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 139
LDI r2, 144
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
