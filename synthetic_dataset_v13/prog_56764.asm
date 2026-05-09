; DESCRIPTION: Draws a purple line from (282, 90) to (7, 153).
; PLAN: r0=282(x1), r1=90(y1), r2=7(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 90
LDI r2, 7
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
