; DESCRIPTION: Places a yellow line segment connecting (345, 70) to (137, 230).
; PLAN: r0=345(x1), r1=70(y1), r2=137(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 70
LDI r2, 137
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
