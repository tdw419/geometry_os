; DESCRIPTION: Draws a purple line from (119, 139) to (488, 216).
; PLAN: r0=119(x1), r1=139(y1), r2=488(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 139
LDI r2, 488
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
