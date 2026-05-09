; DESCRIPTION: Draws a purple line from (511, 157) to (351, 72).
; PLAN: r0=511(x1), r1=157(y1), r2=351(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 157
LDI r2, 351
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
