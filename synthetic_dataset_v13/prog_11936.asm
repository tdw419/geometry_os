; DESCRIPTION: Places a purple line segment connecting (273, 128) to (511, 141).
; PLAN: r0=273(x1), r1=128(y1), r2=511(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 128
LDI r2, 511
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
