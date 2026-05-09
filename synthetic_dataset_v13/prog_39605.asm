; DESCRIPTION: Places a yellow line segment connecting (176, 98) to (148, 35).
; PLAN: r0=176(x1), r1=98(y1), r2=148(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 98
LDI r2, 148
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
