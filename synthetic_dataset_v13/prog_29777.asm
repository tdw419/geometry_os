; DESCRIPTION: Draws a blue line from (158, 49) to (225, 18).
; PLAN: r0=158(x1), r1=49(y1), r2=225(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 49
LDI r2, 225
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
