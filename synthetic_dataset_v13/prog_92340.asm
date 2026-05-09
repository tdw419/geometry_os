; DESCRIPTION: Places a purple line segment connecting (49, 131) to (409, 150).
; PLAN: r0=49(x1), r1=131(y1), r2=409(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 131
LDI r2, 409
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
