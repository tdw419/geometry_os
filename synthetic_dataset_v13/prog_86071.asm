; DESCRIPTION: Places a blue line segment connecting (75, 147) to (376, 199).
; PLAN: r0=75(x1), r1=147(y1), r2=376(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 147
LDI r2, 376
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
