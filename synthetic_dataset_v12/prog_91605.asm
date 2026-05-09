; DESCRIPTION: Draws a purple line from (233, 34) to (300, 232).
; PLAN: r0=233(x1), r1=34(y1), r2=300(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 34
LDI r2, 300
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
