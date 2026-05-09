; DESCRIPTION: Places a purple line segment connecting (110, 210) to (441, 8).
; PLAN: r0=110(x1), r1=210(y1), r2=441(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 210
LDI r2, 441
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
