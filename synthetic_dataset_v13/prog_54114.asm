; DESCRIPTION: Places a green line segment connecting (155, 230) to (20, 90).
; PLAN: r0=155(x1), r1=230(y1), r2=20(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 230
LDI r2, 20
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
