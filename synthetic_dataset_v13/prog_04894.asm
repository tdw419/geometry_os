; DESCRIPTION: Places a purple line segment connecting (313, 73) to (216, 86).
; PLAN: r0=313(x1), r1=73(y1), r2=216(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 73
LDI r2, 216
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
