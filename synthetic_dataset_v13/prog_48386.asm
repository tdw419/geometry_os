; DESCRIPTION: Places a purple line segment connecting (300, 14) to (307, 58).
; PLAN: r0=300(x1), r1=14(y1), r2=307(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 14
LDI r2, 307
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
