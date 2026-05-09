; DESCRIPTION: Places a purple line segment connecting (441, 29) to (489, 139).
; PLAN: r0=441(x1), r1=29(y1), r2=489(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 29
LDI r2, 489
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
