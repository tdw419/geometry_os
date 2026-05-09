; DESCRIPTION: Places a purple line segment connecting (422, 222) to (151, 232).
; PLAN: r0=422(x1), r1=222(y1), r2=151(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 222
LDI r2, 151
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
