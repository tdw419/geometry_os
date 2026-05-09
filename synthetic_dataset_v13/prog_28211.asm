; DESCRIPTION: Places a purple line segment connecting (345, 198) to (192, 51).
; PLAN: r0=345(x1), r1=198(y1), r2=192(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 198
LDI r2, 192
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
