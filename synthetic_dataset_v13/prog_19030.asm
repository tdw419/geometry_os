; DESCRIPTION: Places a blue line segment connecting (136, 72) to (419, 0).
; PLAN: r0=136(x1), r1=72(y1), r2=419(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 72
LDI r2, 419
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
