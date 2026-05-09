; DESCRIPTION: Draws a purple line from (341, 13) to (490, 140).
; PLAN: r0=341(x1), r1=13(y1), r2=490(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 13
LDI r2, 490
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
