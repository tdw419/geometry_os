; DESCRIPTION: Places a blue line segment connecting (115, 136) to (422, 144).
; PLAN: r0=115(x1), r1=136(y1), r2=422(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 136
LDI r2, 422
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
