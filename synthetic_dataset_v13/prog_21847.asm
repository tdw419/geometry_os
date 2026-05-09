; DESCRIPTION: Places a blue line segment connecting (199, 240) to (385, 247).
; PLAN: r0=199(x1), r1=240(y1), r2=385(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 240
LDI r2, 385
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
