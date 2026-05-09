; DESCRIPTION: Places a purple line segment connecting (501, 230) to (90, 175).
; PLAN: r0=501(x1), r1=230(y1), r2=90(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 230
LDI r2, 90
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
