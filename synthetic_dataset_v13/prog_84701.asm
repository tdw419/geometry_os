; DESCRIPTION: Draws a blue line from (53, 147) to (336, 37).
; PLAN: r0=53(x1), r1=147(y1), r2=336(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 147
LDI r2, 336
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
