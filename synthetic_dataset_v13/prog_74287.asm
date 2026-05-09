; DESCRIPTION: Places a yellow line segment connecting (88, 214) to (28, 118).
; PLAN: r0=88(x1), r1=214(y1), r2=28(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 214
LDI r2, 28
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
