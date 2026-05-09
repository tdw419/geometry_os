; DESCRIPTION: Places a purple line segment connecting (148, 20) to (107, 12).
; PLAN: r0=148(x1), r1=20(y1), r2=107(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 20
LDI r2, 107
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
