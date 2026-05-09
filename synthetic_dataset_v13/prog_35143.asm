; DESCRIPTION: Draws a purple line from (326, 57) to (112, 157).
; PLAN: r0=326(x1), r1=57(y1), r2=112(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 57
LDI r2, 112
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
