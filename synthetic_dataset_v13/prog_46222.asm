; DESCRIPTION: Places a purple line segment connecting (47, 1) to (111, 37).
; PLAN: r0=47(x1), r1=1(y1), r2=111(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 1
LDI r2, 111
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
