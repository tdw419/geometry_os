; DESCRIPTION: Places a purple line segment connecting (409, 234) to (400, 131).
; PLAN: r0=409(x1), r1=234(y1), r2=400(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 234
LDI r2, 400
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
