; DESCRIPTION: Places a purple line segment connecting (3, 147) to (288, 37).
; PLAN: r0=3(x1), r1=147(y1), r2=288(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 147
LDI r2, 288
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
