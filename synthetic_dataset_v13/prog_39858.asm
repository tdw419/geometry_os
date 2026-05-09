; DESCRIPTION: Places a purple line segment connecting (167, 4) to (363, 135).
; PLAN: r0=167(x1), r1=4(y1), r2=363(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 4
LDI r2, 363
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
