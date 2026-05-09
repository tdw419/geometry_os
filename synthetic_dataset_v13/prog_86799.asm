; DESCRIPTION: Draws a blue line from (478, 28) to (188, 58).
; PLAN: r0=478(x1), r1=28(y1), r2=188(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 28
LDI r2, 188
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
