; DESCRIPTION: Draws a purple line from (157, 25) to (382, 105).
; PLAN: r0=157(x1), r1=25(y1), r2=382(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 25
LDI r2, 382
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
