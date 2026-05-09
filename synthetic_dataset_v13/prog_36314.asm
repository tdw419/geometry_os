; DESCRIPTION: Places a purple line segment connecting (307, 35) to (230, 17).
; PLAN: r0=307(x1), r1=35(y1), r2=230(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 35
LDI r2, 230
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
