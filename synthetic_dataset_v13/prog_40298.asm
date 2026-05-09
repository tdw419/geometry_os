; DESCRIPTION: Places a blue line segment connecting (136, 118) to (426, 219).
; PLAN: r0=136(x1), r1=118(y1), r2=426(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 118
LDI r2, 426
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
