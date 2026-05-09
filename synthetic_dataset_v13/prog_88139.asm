; DESCRIPTION: Places a green line segment connecting (360, 131) to (448, 216).
; PLAN: r0=360(x1), r1=131(y1), r2=448(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 131
LDI r2, 448
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
