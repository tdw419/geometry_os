; DESCRIPTION: Places a yellow line segment connecting (163, 191) to (337, 1).
; PLAN: r0=163(x1), r1=191(y1), r2=337(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 191
LDI r2, 337
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
