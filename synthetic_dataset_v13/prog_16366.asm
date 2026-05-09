; DESCRIPTION: Places a purple line segment connecting (367, 198) to (393, 96).
; PLAN: r0=367(x1), r1=198(y1), r2=393(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 198
LDI r2, 393
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
