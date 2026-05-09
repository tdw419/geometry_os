; DESCRIPTION: Places a blue line segment connecting (497, 68) to (418, 243).
; PLAN: r0=497(x1), r1=68(y1), r2=418(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 68
LDI r2, 418
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
