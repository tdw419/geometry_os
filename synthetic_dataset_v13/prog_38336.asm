; DESCRIPTION: Places a blue line segment connecting (264, 139) to (134, 63).
; PLAN: r0=264(x1), r1=139(y1), r2=134(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 139
LDI r2, 134
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
