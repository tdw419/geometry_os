; DESCRIPTION: Draws a blue line from (132, 147) to (29, 152).
; PLAN: r0=132(x1), r1=147(y1), r2=29(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 147
LDI r2, 29
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
