; DESCRIPTION: Draws a purple line from (452, 233) to (379, 84).
; PLAN: r0=452(x1), r1=233(y1), r2=379(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 233
LDI r2, 379
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
