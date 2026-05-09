; DESCRIPTION: Places a yellow line segment connecting (163, 20) to (123, 19).
; PLAN: r0=163(x1), r1=20(y1), r2=123(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 20
LDI r2, 123
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
