; DESCRIPTION: Places a blue line segment connecting (147, 8) to (160, 235).
; PLAN: r0=147(x1), r1=8(y1), r2=160(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 8
LDI r2, 160
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
