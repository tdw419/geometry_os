; DESCRIPTION: Draws a purple line from (278, 131) to (478, 58).
; PLAN: r0=278(x1), r1=131(y1), r2=478(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 131
LDI r2, 478
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
