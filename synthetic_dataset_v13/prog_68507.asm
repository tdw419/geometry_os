; DESCRIPTION: Places a blue line segment connecting (77, 192) to (285, 191).
; PLAN: r0=77(x1), r1=192(y1), r2=285(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 192
LDI r2, 285
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
