; DESCRIPTION: Places a purple line segment connecting (350, 189) to (128, 70).
; PLAN: r0=350(x1), r1=189(y1), r2=128(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 189
LDI r2, 128
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
