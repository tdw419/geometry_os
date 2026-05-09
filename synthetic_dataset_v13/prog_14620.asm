; DESCRIPTION: Places a purple line segment connecting (153, 97) to (440, 110).
; PLAN: r0=153(x1), r1=97(y1), r2=440(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 97
LDI r2, 440
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
