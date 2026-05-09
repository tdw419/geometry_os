; DESCRIPTION: Places a purple line segment connecting (207, 8) to (83, 49).
; PLAN: r0=207(x1), r1=8(y1), r2=83(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 8
LDI r2, 83
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
