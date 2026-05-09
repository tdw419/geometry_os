; DESCRIPTION: Draws a blue line from (29, 136) to (122, 202).
; PLAN: r0=29(x1), r1=136(y1), r2=122(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 136
LDI r2, 122
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
