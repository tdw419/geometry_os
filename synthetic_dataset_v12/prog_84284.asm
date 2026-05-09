; DESCRIPTION: Places a purple line segment connecting (255, 115) to (470, 155).
; PLAN: r0=255(x1), r1=115(y1), r2=470(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 115
LDI r2, 470
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
