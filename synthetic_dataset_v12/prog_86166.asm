; DESCRIPTION: Places a purple line segment connecting (309, 214) to (72, 17).
; PLAN: r0=309(x1), r1=214(y1), r2=72(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 214
LDI r2, 72
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
