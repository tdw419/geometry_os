; DESCRIPTION: Places a purple line segment connecting (8, 189) to (315, 178).
; PLAN: r0=8(x1), r1=189(y1), r2=315(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 189
LDI r2, 315
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
