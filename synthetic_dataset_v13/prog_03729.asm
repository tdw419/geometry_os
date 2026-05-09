; DESCRIPTION: Places a purple line segment connecting (122, 178) to (493, 8).
; PLAN: r0=122(x1), r1=178(y1), r2=493(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 178
LDI r2, 493
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
