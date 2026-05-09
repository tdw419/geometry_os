; DESCRIPTION: Places a yellow line segment connecting (83, 133) to (476, 168).
; PLAN: r0=83(x1), r1=133(y1), r2=476(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 133
LDI r2, 476
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
