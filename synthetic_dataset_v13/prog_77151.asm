; DESCRIPTION: Places a purple line segment connecting (152, 131) to (282, 230).
; PLAN: r0=152(x1), r1=131(y1), r2=282(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 131
LDI r2, 282
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
