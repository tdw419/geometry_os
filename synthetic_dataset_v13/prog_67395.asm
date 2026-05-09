; DESCRIPTION: Places a purple line segment connecting (104, 88) to (162, 240).
; PLAN: r0=104(x1), r1=88(y1), r2=162(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 88
LDI r2, 162
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
