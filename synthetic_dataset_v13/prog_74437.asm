; DESCRIPTION: Places a purple line segment connecting (24, 144) to (428, 71).
; PLAN: r0=24(x1), r1=144(y1), r2=428(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 144
LDI r2, 428
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
