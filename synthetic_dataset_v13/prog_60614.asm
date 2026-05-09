; DESCRIPTION: Places a purple line segment connecting (142, 128) to (112, 180).
; PLAN: r0=142(x1), r1=128(y1), r2=112(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 128
LDI r2, 112
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
