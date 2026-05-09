; DESCRIPTION: Places a blue line segment connecting (453, 225) to (493, 147).
; PLAN: r0=453(x1), r1=225(y1), r2=493(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 225
LDI r2, 493
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
