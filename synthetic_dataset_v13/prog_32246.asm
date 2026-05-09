; DESCRIPTION: Draws a purple line from (230, 142) to (211, 129).
; PLAN: r0=230(x1), r1=142(y1), r2=211(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 142
LDI r2, 211
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
