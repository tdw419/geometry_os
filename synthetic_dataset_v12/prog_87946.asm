; DESCRIPTION: Places a blue line segment connecting (413, 17) to (454, 3).
; PLAN: r0=413(x1), r1=17(y1), r2=454(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 454
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
