; DESCRIPTION: Places a purple line segment connecting (165, 163) to (3, 58).
; PLAN: r0=165(x1), r1=163(y1), r2=3(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 163
LDI r2, 3
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
