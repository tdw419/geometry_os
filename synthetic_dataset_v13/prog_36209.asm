; DESCRIPTION: Draws a purple line from (453, 25) to (139, 5).
; PLAN: r0=453(x1), r1=25(y1), r2=139(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 25
LDI r2, 139
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
