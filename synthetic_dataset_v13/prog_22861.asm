; DESCRIPTION: Places a blue line segment connecting (391, 131) to (199, 84).
; PLAN: r0=391(x1), r1=131(y1), r2=199(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 131
LDI r2, 199
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
