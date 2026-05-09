; DESCRIPTION: Places a yellow line segment connecting (129, 28) to (93, 209).
; PLAN: r0=129(x1), r1=28(y1), r2=93(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 28
LDI r2, 93
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
