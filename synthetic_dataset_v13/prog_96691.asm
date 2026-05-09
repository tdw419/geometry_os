; DESCRIPTION: Draws a purple line from (119, 74) to (101, 180).
; PLAN: r0=119(x1), r1=74(y1), r2=101(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 74
LDI r2, 101
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
