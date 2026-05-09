; DESCRIPTION: Places a purple line segment connecting (412, 244) to (16, 49).
; PLAN: r0=412(x1), r1=244(y1), r2=16(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 244
LDI r2, 16
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
