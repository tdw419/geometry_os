; DESCRIPTION: Places a purple line segment connecting (400, 60) to (3, 67).
; PLAN: r0=400(x1), r1=60(y1), r2=3(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 60
LDI r2, 3
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
