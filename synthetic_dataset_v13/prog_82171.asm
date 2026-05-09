; DESCRIPTION: Draws a purple line from (488, 80) to (158, 6).
; PLAN: r0=488(x1), r1=80(y1), r2=158(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 80
LDI r2, 158
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
