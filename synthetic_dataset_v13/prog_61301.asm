; DESCRIPTION: Places a purple line segment connecting (84, 83) to (154, 73).
; PLAN: r0=84(x1), r1=83(y1), r2=154(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 83
LDI r2, 154
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
