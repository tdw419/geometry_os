; DESCRIPTION: Places a yellow line segment connecting (377, 65) to (230, 114).
; PLAN: r0=377(x1), r1=65(y1), r2=230(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 65
LDI r2, 230
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
