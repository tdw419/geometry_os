; DESCRIPTION: Places a purple line segment connecting (338, 109) to (422, 190).
; PLAN: r0=338(x1), r1=109(y1), r2=422(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 109
LDI r2, 422
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
