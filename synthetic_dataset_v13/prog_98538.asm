; DESCRIPTION: Places a purple line segment connecting (493, 106) to (273, 148).
; PLAN: r0=493(x1), r1=106(y1), r2=273(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 106
LDI r2, 273
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
