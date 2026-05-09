; DESCRIPTION: Places a blue line segment connecting (382, 216) to (136, 64).
; PLAN: r0=382(x1), r1=216(y1), r2=136(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 216
LDI r2, 136
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
