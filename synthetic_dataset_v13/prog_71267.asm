; DESCRIPTION: Places a yellow line segment connecting (356, 214) to (136, 217).
; PLAN: r0=356(x1), r1=214(y1), r2=136(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 214
LDI r2, 136
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
