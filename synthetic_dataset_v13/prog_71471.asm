; DESCRIPTION: Places a purple line segment connecting (400, 154) to (94, 25).
; PLAN: r0=400(x1), r1=154(y1), r2=94(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 154
LDI r2, 94
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
