; DESCRIPTION: Draws a blue line from (353, 226) to (147, 142).
; PLAN: r0=353(x1), r1=226(y1), r2=147(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 226
LDI r2, 147
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
