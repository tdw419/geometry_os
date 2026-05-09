; DESCRIPTION: Places a purple line segment connecting (145, 54) to (341, 57).
; PLAN: r0=145(x1), r1=54(y1), r2=341(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 54
LDI r2, 341
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
