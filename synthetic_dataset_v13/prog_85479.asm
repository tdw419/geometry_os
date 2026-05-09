; DESCRIPTION: Places a blue line segment connecting (279, 21) to (337, 206).
; PLAN: r0=279(x1), r1=21(y1), r2=337(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 21
LDI r2, 337
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
