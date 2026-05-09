; DESCRIPTION: Places a blue line segment connecting (421, 17) to (230, 157).
; PLAN: r0=421(x1), r1=17(y1), r2=230(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 17
LDI r2, 230
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
