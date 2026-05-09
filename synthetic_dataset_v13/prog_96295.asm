; DESCRIPTION: Places a purple line segment connecting (317, 198) to (207, 224).
; PLAN: r0=317(x1), r1=198(y1), r2=207(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 198
LDI r2, 207
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
