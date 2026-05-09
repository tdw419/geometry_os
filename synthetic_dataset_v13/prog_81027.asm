; DESCRIPTION: Places a blue line segment connecting (137, 151) to (341, 135).
; PLAN: r0=137(x1), r1=151(y1), r2=341(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 151
LDI r2, 341
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
