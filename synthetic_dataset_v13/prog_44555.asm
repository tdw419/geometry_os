; DESCRIPTION: Draws a blue line from (37, 147) to (449, 250).
; PLAN: r0=37(x1), r1=147(y1), r2=449(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 147
LDI r2, 449
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
