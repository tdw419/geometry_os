; DESCRIPTION: Places a purple line segment connecting (486, 61) to (422, 230).
; PLAN: r0=486(x1), r1=61(y1), r2=422(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 61
LDI r2, 422
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
