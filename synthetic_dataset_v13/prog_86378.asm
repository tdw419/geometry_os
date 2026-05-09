; DESCRIPTION: Places a yellow line segment connecting (131, 78) to (136, 197).
; PLAN: r0=131(x1), r1=78(y1), r2=136(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 78
LDI r2, 136
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
