; DESCRIPTION: Places a yellow line segment connecting (141, 21) to (504, 136).
; PLAN: r0=141(x1), r1=21(y1), r2=504(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 21
LDI r2, 504
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
