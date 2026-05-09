; DESCRIPTION: Places a purple line segment connecting (8, 196) to (400, 56).
; PLAN: r0=8(x1), r1=196(y1), r2=400(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 196
LDI r2, 400
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
