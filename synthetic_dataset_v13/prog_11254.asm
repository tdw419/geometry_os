; DESCRIPTION: Places a yellow line segment connecting (356, 153) to (6, 129).
; PLAN: r0=356(x1), r1=153(y1), r2=6(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 153
LDI r2, 6
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
