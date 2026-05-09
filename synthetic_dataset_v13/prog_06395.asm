; DESCRIPTION: Draws a purple line from (62, 16) to (201, 128).
; PLAN: r0=62(x1), r1=16(y1), r2=201(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 16
LDI r2, 201
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
