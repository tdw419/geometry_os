; DESCRIPTION: Places a blue line segment connecting (372, 75) to (208, 131).
; PLAN: r0=372(x1), r1=75(y1), r2=208(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 75
LDI r2, 208
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
