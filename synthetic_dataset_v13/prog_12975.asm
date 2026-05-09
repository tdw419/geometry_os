; DESCRIPTION: Draws a purple line from (271, 227) to (29, 62).
; PLAN: r0=271(x1), r1=227(y1), r2=29(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 227
LDI r2, 29
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
