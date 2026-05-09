; DESCRIPTION: Places a blue line segment connecting (47, 169) to (107, 179).
; PLAN: r0=47(x1), r1=169(y1), r2=107(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 169
LDI r2, 107
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
