; DESCRIPTION: Places a purple line segment connecting (422, 164) to (325, 9).
; PLAN: r0=422(x1), r1=164(y1), r2=325(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 164
LDI r2, 325
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
