; DESCRIPTION: Places a blue line segment connecting (337, 156) to (0, 29).
; PLAN: r0=337(x1), r1=156(y1), r2=0(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 156
LDI r2, 0
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
