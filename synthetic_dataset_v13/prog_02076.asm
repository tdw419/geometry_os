; DESCRIPTION: Draws a purple line from (170, 80) to (297, 253).
; PLAN: r0=170(x1), r1=80(y1), r2=297(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 80
LDI r2, 297
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
