; DESCRIPTION: Places a yellow line segment connecting (139, 198) to (435, 3).
; PLAN: r0=139(x1), r1=198(y1), r2=435(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 198
LDI r2, 435
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
