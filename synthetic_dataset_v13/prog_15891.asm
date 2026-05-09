; DESCRIPTION: Draws a purple line from (328, 179) to (153, 238).
; PLAN: r0=328(x1), r1=179(y1), r2=153(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 179
LDI r2, 153
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
