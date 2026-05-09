; DESCRIPTION: Draws a purple line from (382, 96) to (424, 203).
; PLAN: r0=382(x1), r1=96(y1), r2=424(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 96
LDI r2, 424
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
