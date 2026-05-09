; DESCRIPTION: Places a purple line segment connecting (328, 0) to (73, 122).
; PLAN: r0=328(x1), r1=0(y1), r2=73(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 0
LDI r2, 73
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
