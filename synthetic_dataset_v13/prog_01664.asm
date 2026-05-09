; DESCRIPTION: Places a purple line segment connecting (271, 119) to (376, 33).
; PLAN: r0=271(x1), r1=119(y1), r2=376(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 119
LDI r2, 376
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
