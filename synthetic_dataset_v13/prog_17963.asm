; DESCRIPTION: Places a green line segment connecting (419, 216) to (377, 32).
; PLAN: r0=419(x1), r1=216(y1), r2=377(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 216
LDI r2, 377
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
