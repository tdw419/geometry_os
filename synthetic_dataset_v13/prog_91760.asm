; DESCRIPTION: Places a yellow line segment connecting (390, 93) to (148, 52).
; PLAN: r0=390(x1), r1=93(y1), r2=148(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 93
LDI r2, 148
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
