; DESCRIPTION: Places a blue line segment connecting (345, 147) to (317, 179).
; PLAN: r0=345(x1), r1=147(y1), r2=317(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 147
LDI r2, 317
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
