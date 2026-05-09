; DESCRIPTION: Places a blue line segment connecting (119, 53) to (37, 12).
; PLAN: r0=119(x1), r1=53(y1), r2=37(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 37
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
