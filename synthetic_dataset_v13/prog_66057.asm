; DESCRIPTION: Places a purple line segment connecting (375, 188) to (56, 221).
; PLAN: r0=375(x1), r1=188(y1), r2=56(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 188
LDI r2, 56
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
