; DESCRIPTION: Draws a blue line from (88, 167) to (216, 230).
; PLAN: r0=88(x1), r1=167(y1), r2=216(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 167
LDI r2, 216
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
