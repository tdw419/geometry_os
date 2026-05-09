; DESCRIPTION: Places a purple line segment connecting (189, 198) to (389, 143).
; PLAN: r0=189(x1), r1=198(y1), r2=389(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 198
LDI r2, 389
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
