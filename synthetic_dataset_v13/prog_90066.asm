; DESCRIPTION: Places a green line segment connecting (84, 142) to (237, 2).
; PLAN: r0=84(x1), r1=142(y1), r2=237(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 142
LDI r2, 237
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
