; DESCRIPTION: Places a blue line segment connecting (327, 219) to (147, 115).
; PLAN: r0=327(x1), r1=219(y1), r2=147(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 219
LDI r2, 147
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
