; DESCRIPTION: Places a yellow line segment connecting (155, 64) to (504, 219).
; PLAN: r0=155(x1), r1=64(y1), r2=504(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 64
LDI r2, 504
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
