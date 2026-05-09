; DESCRIPTION: Places a yellow line segment connecting (279, 58) to (20, 118).
; PLAN: r0=279(x1), r1=58(y1), r2=20(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 58
LDI r2, 20
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
