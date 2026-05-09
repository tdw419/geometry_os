; DESCRIPTION: Draws a purple line from (142, 111) to (304, 105).
; PLAN: r0=142(x1), r1=111(y1), r2=304(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 111
LDI r2, 304
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
