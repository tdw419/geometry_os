; DESCRIPTION: Places a blue line segment connecting (305, 136) to (421, 251).
; PLAN: r0=305(x1), r1=136(y1), r2=421(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 136
LDI r2, 421
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
