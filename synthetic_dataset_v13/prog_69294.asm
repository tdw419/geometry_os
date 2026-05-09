; DESCRIPTION: Places a purple line segment connecting (141, 83) to (336, 26).
; PLAN: r0=141(x1), r1=83(y1), r2=336(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 83
LDI r2, 336
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
