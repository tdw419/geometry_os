; DESCRIPTION: Renders a purple line between points (453, 164) and (447, 217).
; PLAN: r0=453(x1), r1=164(y1), r2=447(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 164
LDI r2, 447
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
