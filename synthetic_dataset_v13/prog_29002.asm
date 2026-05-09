; DESCRIPTION: Places a purple line segment connecting (19, 84) to (256, 127).
; PLAN: r0=19(x1), r1=84(y1), r2=256(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 84
LDI r2, 256
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
