; DESCRIPTION: Draws a purple line from (64, 148) to (142, 39).
; PLAN: r0=64(x1), r1=148(y1), r2=142(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 142
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
