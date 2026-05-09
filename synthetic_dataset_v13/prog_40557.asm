; DESCRIPTION: Places a yellow line segment connecting (20, 216) to (379, 93).
; PLAN: r0=20(x1), r1=216(y1), r2=379(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 216
LDI r2, 379
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
