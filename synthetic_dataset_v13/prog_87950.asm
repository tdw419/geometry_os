; DESCRIPTION: Places a blue line segment connecting (285, 29) to (147, 179).
; PLAN: r0=285(x1), r1=29(y1), r2=147(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 29
LDI r2, 147
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
