; DESCRIPTION: Places a yellow line segment connecting (440, 22) to (155, 153).
; PLAN: r0=440(x1), r1=22(y1), r2=155(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 22
LDI r2, 155
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
