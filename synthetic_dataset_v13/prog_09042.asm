; DESCRIPTION: Places a blue line segment connecting (156, 225) to (347, 131).
; PLAN: r0=156(x1), r1=225(y1), r2=347(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 225
LDI r2, 347
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
