; DESCRIPTION: Places a green line segment connecting (155, 212) to (80, 67).
; PLAN: r0=155(x1), r1=212(y1), r2=80(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 212
LDI r2, 80
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
