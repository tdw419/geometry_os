; DESCRIPTION: Places a purple line segment connecting (454, 147) to (442, 221).
; PLAN: r0=454(x1), r1=147(y1), r2=442(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 147
LDI r2, 442
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
