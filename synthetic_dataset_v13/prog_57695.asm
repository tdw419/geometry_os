; DESCRIPTION: Draws a purple line from (326, 31) to (379, 45).
; PLAN: r0=326(x1), r1=31(y1), r2=379(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 31
LDI r2, 379
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
