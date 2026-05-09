; DESCRIPTION: Places a purple line segment connecting (277, 148) to (390, 14).
; PLAN: r0=277(x1), r1=148(y1), r2=390(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 148
LDI r2, 390
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
