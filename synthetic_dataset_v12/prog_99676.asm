; DESCRIPTION: Places a purple line segment connecting (378, 11) to (218, 37).
; PLAN: r0=378(x1), r1=11(y1), r2=218(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 11
LDI r2, 218
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
