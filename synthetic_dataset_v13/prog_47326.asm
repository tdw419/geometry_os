; DESCRIPTION: Places a purple line segment connecting (246, 90) to (92, 84).
; PLAN: r0=246(x1), r1=90(y1), r2=92(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 90
LDI r2, 92
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
