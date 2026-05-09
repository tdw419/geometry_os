; DESCRIPTION: Draws a purple line from (32, 98) to (469, 201).
; PLAN: r0=32(x1), r1=98(y1), r2=469(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 98
LDI r2, 469
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
