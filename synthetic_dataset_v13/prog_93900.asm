; DESCRIPTION: Draws a purple line from (22, 72) to (53, 238).
; PLAN: r0=22(x1), r1=72(y1), r2=53(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 72
LDI r2, 53
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
