; DESCRIPTION: Draws a blue line from (258, 147) to (384, 155).
; PLAN: r0=258(x1), r1=147(y1), r2=384(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 147
LDI r2, 384
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
