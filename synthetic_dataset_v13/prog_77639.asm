; DESCRIPTION: Places a purple line segment connecting (30, 175) to (222, 127).
; PLAN: r0=30(x1), r1=175(y1), r2=222(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 175
LDI r2, 222
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
